package pl.coderslab.charity.user;

import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.category.Category;
import pl.coderslab.charity.category.CategoryRepository;
import pl.coderslab.charity.donation.Donation;
import pl.coderslab.charity.donation.DonationRepository;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.InstitutionService;
import pl.coderslab.charity.registration.RegistrationRequest;
import pl.coderslab.charity.registration.RegistrationService;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {

    private final InstitutionService institutionService;
    private final CategoryRepository categoryRepository;
    private final AppUserService appUserService;
    private final DonationRepository donationRepository;
    private final AppUserRepository appUserRepository;
    private final RegistrationService registrationService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;


    @GetMapping("/dashboard")
    public String viewDashboardPage(Model model) {
        return adminDashboard(1, "firstName", "asc", model);
    }

    @GetMapping("/users")
    public String viewUsersPage(Model model) {
        return adminUsers(1, "firstName", "asc", model);
    }

    @GetMapping("/institutions")
    public String viewInstitutionsPage(Model model) {
        return adminInstitutions(1, "name", "asc", model);
    }


    @GetMapping("/dashboard/{pageNo}")
    String adminDashboard(@PathVariable int pageNo, @RequestParam("sortField") String sortField, @RequestParam("sortDir") String sortDir, Model model) {
        int pageSize = 10;
        Page<AppUser> page = appUserService.findAdminsPaginated(pageNo, pageSize, sortField, sortDir);
        List<AppUser> admins = page.getContent();
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());

        model.addAttribute("sortField", sortField);
        model.addAttribute("sortDir", sortDir);
        model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");

        model.addAttribute("admins", admins);
        return "admin/admins/dashboard";
    }

    @GetMapping("/dashboard/add")
    String adminAdd(Model model) {
        model.addAttribute("request", new RegistrationRequest());
        return "admin/admins/add-admin";
    }

    @PostMapping("/dashboard/add")
    String adminSave(@Valid @ModelAttribute("request") RegistrationRequest request, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/admins/add-admin";
        }
        registrationService.registerAdmin(request);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/dashboard/edit/{id}")
    String adminEdit(@PathVariable long id, Model model) {
        model.addAttribute("admin", appUserRepository.findById(id).orElse(null));
        return "admin/admins/edit-admin";
    }

    @PostMapping("/dashboard/edit/{id}")
    String adminUpdate(@PathVariable long id,@Valid @ModelAttribute("admin") AppUser admin, BindingResult bindingResult) {
        AppUser appUser = appUserRepository.findById(id).get();
        if (bindingResult.hasErrors()) {
            return "admin/admins/edit-admin";
        }
        admin.setAppUserRole(appUser.getAppUserRole());
        admin.setPassword(bCryptPasswordEncoder.encode(admin.getPassword()));
        appUserRepository.save(admin);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/dashboard/confirm-delete/{id}")
    String adminConfirmDelete(@PathVariable long id, Model model) {
        model.addAttribute("admin", appUserRepository.findById(id).orElse(null));
        model.addAttribute("id", id);
        return "admin/admins/delete-admin";
    }

    @GetMapping("/dashboard/delete/{id}")
    String adminDelete(@PathVariable long id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth.getName().equals(appUserRepository.findById(id).get().getEmail())) {
            throw new IllegalStateException("Cannot delete currently logged admin");
        } else {
            appUserRepository.deleteById(id);
        }
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/users/{pageNo}")
    String adminUsers(@PathVariable int pageNo, @RequestParam("sortField") String sortField, @RequestParam("sortDir") String sortDir, Model model) {
        int pageSize = 10;
        Page<AppUser> page = appUserService.findUsersPaginated(pageNo, pageSize, sortField, sortDir);
        List<AppUser> users = page.getContent();

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());

        model.addAttribute("sortField", sortField);
        model.addAttribute("sortDir", sortDir);
        model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");

        model.addAttribute("users", users);
        return "admin/users/users";
    }

    @GetMapping("/institutions/{pageNo}")
    String adminInstitutions(@PathVariable int pageNo, @RequestParam("sortField") String sortField, @RequestParam("sortDir") String sortDir, Model model) {
        int pageSize = 10;
        Page<Institution> page = institutionService.findAllPaginated(pageNo, pageSize, sortField, sortDir);
        List<Institution> institutions = page.getContent();
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());

        model.addAttribute("sortField", sortField);
        model.addAttribute("sortDir", sortDir);
        model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");

        model.addAttribute("institutions", institutions);
        return "admin/institutions";
    }

    @GetMapping("/categories")
    String adminCategories(Model model) {
        model.addAttribute("categories", categoryRepository.findAll());

        return "admin/categories/category";
    }

    @GetMapping("/categories/add")
    String adminCategoriesAdd(Model model) {
        model.addAttribute("category", new Category());
        return "admin/categories/add-category";
    }

    @PostMapping("/categories/add")
    String adminCategoriesSave(@Valid Category category, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/categories/add-category";
        }
        categoryRepository.save(category);
        return "redirect:/admin/categories";
    }

    @GetMapping("/categories/edit/{id}")
    String adminCategoriesEdit(@PathVariable long id, Model model) {
        model.addAttribute("category", categoryRepository.findById(id).orElse(null));
        return "admin/categories/edit-category";
    }

    @PostMapping("/categories/edit/{id}")
    String adminCategoriesUpdate(@Valid Category category, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/categories/edit-category";
        }
        categoryRepository.save(category);
        return "redirect:/admin/categories";
    }

    @GetMapping("/categories/confirm-delete/{id}")
    String adminCategoriesConfirmDelete(@PathVariable long id, Model model) {
        model.addAttribute("id", id);
        return "admin/categories/delete-category";
    }

    @GetMapping("/categories/delete/{id}")
    String adminCategoriesDelete(@PathVariable long id) {
        if (!donationRepository.findDonationByCategoryId(id).isEmpty()) {
            return "redirect:/admin/categories/confirm-archive/"+id;
        } else {
            categoryRepository.deleteById(id);
        }
        return "redirect:/admin/categories";
    }

    @GetMapping("/categories/confirm-archive/{id}")
    String adminCategoriesConfirmArchive(@PathVariable long id, Model model) {
        model.addAttribute("id", id);
        return "admin/categories/archive-category";
    }

    @GetMapping("/categories/archive/{id}")
    String adminCategoriesArchive(@PathVariable long id) {
        Category category = categoryRepository.findById(id).get();
        category.setActive(false);
        categoryRepository.save(category);
        return "redirect:/admin/categories";
    }

    @GetMapping("/messages/{pageNo}")
    String adminMessages(@PathVariable int pageNo, Model model) {

        return "admin/messages";
    }
}
