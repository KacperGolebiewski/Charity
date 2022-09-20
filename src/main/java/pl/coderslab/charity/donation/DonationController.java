package pl.coderslab.charity.donation;


import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.category.CategoryRepository;
import pl.coderslab.charity.institution.InstitutionRepository;
import pl.coderslab.charity.sms.SmsService;
import pl.coderslab.charity.user.AppUser;
import pl.coderslab.charity.user.AppUserRepository;

import javax.persistence.EntityExistsException;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/donation")
@AllArgsConstructor
public class DonationController {

    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final AppUserRepository appUserRepository;
    private final DonationService donationService;
    private final SmsService smsService;

    @GetMapping("/details")
    public String viewDonationsPages(Model model) {
        return donationDetails(1, "created", "desc", model);
    }


    @GetMapping
    String addDonation(Model model) {
        model.addAttribute("donation", new Donation());
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("institutions", institutionRepository.findAll());
        return "user/donation/donation";
    }

    @PostMapping
    String saveDonation(Model model, @Valid Donation donation, BindingResult bindingResult) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        AppUser user = appUserRepository.findByEmail(auth.getName()).orElse(null);
        donation.setUser(user);
        if (bindingResult.hasErrors()) {
            model.addAttribute("categories", categoryRepository.findAll());
            model.addAttribute("institutions", institutionRepository.findAll());
            return "user/donation/donation";
        }
        donationRepository.save(donation);
        return "redirect:/donation/confirmation/"+donation.getId();
    }

    @GetMapping("/confirmation/{id}")
    String showConfirmation(@PathVariable long id) {
       Donation donation = donationRepository.findById(id).orElseThrow(EntityExistsException::new);
        smsService.send(donation.getPhoneNumber(),donation);
        return "user/donation/donation-confirmation";
    }

    @GetMapping("/details/{pageNo}")
    String donationDetails(@PathVariable int pageNo, @RequestParam("sortField") String sortField, @RequestParam("sortDir") String sortDir, Model model) {
        int pageSize = 10;
        Page<Donation> page = donationService.findDonationsPaginated(pageNo, pageSize, sortField, sortDir);
        List<Donation> donations = page.getContent();
        System.out.println(donations);
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());

        model.addAttribute("sortField", sortField);
        model.addAttribute("sortDir", sortDir);
        model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");

        model.addAttribute("donations", donations);
        return "user/donation/details";
    }

    @GetMapping("/details/edit/{id}")
    String donationEdit(@PathVariable long id, Model model) {
        model.addAttribute("donation", donationRepository.findById(id));
        return "user/donation/edit-details";
    }

    @PostMapping("/details/edit/{id}")
    String adminCategoriesUpdate(@PathVariable long id, Donation donation) {
        Donation updatedDonation = donationRepository.findById(id).orElseThrow(EntityExistsException::new);
        updatedDonation.setDelivered(donation.isDelivered());
        donationRepository.save(updatedDonation);
        return "redirect:/donation/details";
    }


}
