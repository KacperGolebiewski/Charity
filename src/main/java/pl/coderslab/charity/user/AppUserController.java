package pl.coderslab.charity.user;


import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.EntityNotFoundException;
import javax.validation.Valid;

@Controller
@RequestMapping("/user")
@AllArgsConstructor
public class AppUserController {

    private final AppUserRepository appUserRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;


    @GetMapping("/details")
    String userDetails(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("user", appUserRepository.findByEmail(auth.getName()).orElseThrow(EntityNotFoundException::new));
        return "user/profile";
    }

    @GetMapping("/details/edit")
    String userDetailsUpdate(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("appUser", appUserRepository.findByEmail(auth.getName()).orElseThrow(EntityNotFoundException::new));
        return "user/profile-update";
    }

    @PostMapping("/details/edit")
    String updateDetailsSave(@Valid AppUser user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "user/profile-update";
        }
        user.setFirstName(user.getFirstName());
        user.setLastName(user.getLastName());
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        appUserRepository.save(user);

        return "redirect:/user/details";
    }
}
