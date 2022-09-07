package pl.coderslab.charity.user;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.category.CategoryRepository;
import pl.coderslab.charity.donation.Donation;
import pl.coderslab.charity.institution.InstitutionRepository;

@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {

    private final InstitutionRepository institutionRepository;
    private final CategoryRepository categoryRepository;
    private final AppUserRepository appUserRepository;

    @GetMapping("/dashboard")
    String adminDashboard(Model model) {
        model.addAttribute("admins", appUserRepository.findAdmins());
        return "admin/dashboard";
    }

    @GetMapping("/users")
    String adminUsers(Model model) {
        model.addAttribute("users", appUserRepository.findAll());
        return "admin/users";
    }

    @GetMapping("/institutions")
    String adminInstitutions(Model model) {
        model.addAttribute("institutions", institutionRepository.findAll());

        return "admin/institutions";
    }

    @GetMapping("/categories")
    String adminCategories(Model model) {
        model.addAttribute("categories", categoryRepository.findAll());

        return "admin/categories";
    }

    @GetMapping("/messages")
    String adminMessages() {

        return "admin/messages";
    }
}
