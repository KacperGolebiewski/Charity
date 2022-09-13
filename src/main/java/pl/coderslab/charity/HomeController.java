package pl.coderslab.charity;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.donation.DonationRepository;
import pl.coderslab.charity.institution.InstitutionRepository;


@Controller
@AllArgsConstructor
public class HomeController {

    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;


    @RequestMapping("/")
    public String homeAction(Model model) {

        model.addAttribute("totalQuantity", donationRepository.findTotalQuantity());
        model.addAttribute("totalDonations", donationRepository.findTotalDonations());
        model.addAttribute("institutions", institutionRepository.findAll());
        return "index";
    }
}
