package pl.coderslab.charity.user;

import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.category.CategoryRepository;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.InstitutionRepository;
import pl.coderslab.charity.institution.InstitutionService;
import pl.coderslab.charity.institution.InstitutionServiceImpl;

import java.util.List;

@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {

    private final InstitutionService institutionService;
    private final CategoryRepository categoryRepository;
    private final AppUserService appUserService;

    @GetMapping("/dashboard/{pageNo}")
    String adminDashboard(@PathVariable int pageNo, Model model) {
        int pageSize = 10;
        Page<AppUser> page = appUserService.findAdminsPaginated(pageNo, pageSize);
        List<AppUser> admins = page.getContent();
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("admins", admins);
        return "admin/dashboard";
    }

    @GetMapping("/users/{pageNo}")
    String adminUsers(@PathVariable int pageNo, Model model) {
        int pageSize = 10;
        Page<AppUser> page = appUserService.findUsersPaginated(pageNo, pageSize);
        List<AppUser> users = page.getContent();
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("users", users);
        return "admin/users";
    }

    @GetMapping("/institutions/{pageNo}")
    String adminInstitutions(@PathVariable int pageNo, Model model) {
        int pageSize = 10;
        Page<Institution> page = institutionService.findAllPaginated(pageNo, pageSize);
        List<Institution> institutions = page.getContent();
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("institutions", institutions);
        return "admin/institutions";
    }

    @GetMapping("/categories")
    String adminCategories( Model model) {
        model.addAttribute("categories", categoryRepository.findAll());

        return "admin/categories";
    }

    @GetMapping("/messages/{pageNo}")
    String adminMessages(@PathVariable int pageNo, Model model) {

        return "admin/messages";
    }
}
