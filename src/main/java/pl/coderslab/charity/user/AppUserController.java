package pl.coderslab.charity.user;


import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
@AllArgsConstructor
public class AppUserController {

    private final AppUserRepository appUserRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;


    @GetMapping("/details")
    String userDetails(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("user", appUserRepository.findByEmail(auth.getName()).orElse(null));
        return "profile";
    }

    @GetMapping("/details/edit")
    String userDetailsUpdate(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("appUser", appUserRepository.findByEmail(auth.getName()).orElse(null));
        return "profile-update";
    }

    @PostMapping("/details/edit")
    String updateDetailsSave(AppUser user, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        AppUser tempUser = (AppUser) auth.getPrincipal();
        tempUser.setFirstName(user.getFirstName());
        tempUser.setLastName(user.getLastName());
        tempUser.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));

        appUserRepository.updateUser(tempUser.getFirstName(),tempUser.getLastName(), tempUser.getPassword(), tempUser.getEmail());

        return "redirect:/user/details";
    }
}
