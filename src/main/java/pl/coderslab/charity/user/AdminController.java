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
import pl.coderslab.charity.donation.DonationRepository;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.InstitutionRepository;
import pl.coderslab.charity.institution.InstitutionService;
import pl.coderslab.charity.registration.RegistrationRequest;
import pl.coderslab.charity.registration.RegistrationService;

import javax.validation.Valid;
import java.util.List;

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
    private final InstitutionRepository institutionRepository;


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
    String adminUpdate(@PathVariable long id, @Valid @ModelAttribute("admin") AppUser admin, BindingResult bindingResult) {
        AppUser appUser = appUserRepository.findById(id).get();
        if (bindingResult.hasErrors()) {
            return "admin/admins/edit-admin";
        }
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (appUserRepository.findById(id).isPresent()) {
            if (appUserRepository.findById(id).get().getEmail().equals(auth.getName())) {
                admin.setEnabled(appUser.getEnabled());
                admin.setLocked(appUser.getLocked());
            }
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

    @GetMapping("/users/add")
    String adminUserAdd(Model model) {
        model.addAttribute("request", new RegistrationRequest());
        return "admin/users/add-user";
    }

    @PostMapping("/users/add")
    String adminUserSave(@Valid @ModelAttribute("request") RegistrationRequest request, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/users/add-user";
        }
        registrationService.registerAdmin(request);
        return "redirect:/admin/users";
    }

    @GetMapping("/users/edit/{id}")
    String adminUserEdit(@PathVariable long id, Model model) {
        model.addAttribute("user", appUserRepository.findById(id).orElse(null));
        return "admin/users/edit-user";
    }

    @PostMapping("/users/edit/{id}")
    String adminUserUpdate(@PathVariable long id, @Valid @ModelAttribute("user") AppUser user, BindingResult bindingResult) {
        AppUser appUser = appUserRepository.findById(id).get();
        if (bindingResult.hasErrors()) {
            return "admin/admins/edit-admin";
        }
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (appUserRepository.findById(id).isPresent()) {
            if (appUserRepository.findById(id).get().getEmail().equals(auth.getName())) {
                user.setEnabled(appUser.getEnabled());
                user.setLocked(appUser.getLocked());
            }
        }
        user.setAppUserRole(appUser.getAppUserRole());
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        appUserRepository.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/users/confirm-delete/{id}")
    String adminUserConfirmDelete(@PathVariable long id, Model model) {
        model.addAttribute("user", appUserRepository.findById(id).orElse(null));
        model.addAttribute("id", id);
        return "admin/users/delete-user";
    }

    @GetMapping("/users/delete/{id}")
    String adminUserDelete(@PathVariable long id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth.getName().equals(appUserRepository.findById(id).get().getEmail())) {
            throw new IllegalStateException("Cannot delete currently logged admin");
        } else {
            appUserRepository.deleteById(id);
        }
        return "redirect:/admin/users";
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
        return "admin/institutions/institutions";
    }

    @GetMapping("/institutions/add")
    String adminInstitutionsAdd(Model model) {
        model.addAttribute("institution", new Institution());
        return "admin/institutions/add-institution";
    }

    @PostMapping("/institutions/add")
    String adminInstitutionsSave(@Valid Institution institution, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/institutions/add-institution";
        }
        institutionRepository.save(institution);
        return "redirect:/admin/institutions";
    }

    @GetMapping("/institutions/edit/{id}")
    String adminInstitutionsEdit(@PathVariable long id, Model model) {
        model.addAttribute("institution", institutionRepository.findById(id).orElse(null));
        return "admin/institutions/edit-institution";
    }

    @PostMapping("/institutions/edit/{id}")
    String adminInstitutionsUpdate(@Valid Institution institution, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/institutions/edit-institution";
        }
        institutionRepository.save(institution);
        return "redirect:/admin/institutions";
    }

    @GetMapping("/institutions/confirm-delete/{id}")
    String adminInstitutionsConfirmDelete(@PathVariable long id, Model model) {
        model.addAttribute("id", id);
        return "admin/institutions/delete-institution";
    }

    @GetMapping("/institutions/delete/{id}")
    String adminInstitutionsDelete(@PathVariable long id) {
        if (donationRepository.findDonationByInstitutionId(id).isPresent()) {
            return "redirect:/admin/institutions/confirm-archive/" + id;
        } else {
            institutionRepository.deleteById(id);
        }
        return "redirect:/admin/institutions";
    }

    @GetMapping("/institutions/confirm-archive/{id}")
    String adminInstitutionsConfirmArchive(@PathVariable long id, Model model) {
        model.addAttribute("id", id);
        return "admin/institutions/archive-institution";
    }

    @GetMapping("/institutions/archive/{id}")
    String adminInstitutionsArchive(@PathVariable long id) {
        Institution institution = institutionRepository.findById(id).get();
        institution.setActive(false);
        institutionRepository.save(institution);
        return "redirect:/admin/institutions";
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
            return "redirect:/admin/categories/confirm-archive/" + id;
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
