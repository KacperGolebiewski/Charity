package pl.coderslab.charity.password;


import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.registration.RegistrationRequest;
import pl.coderslab.charity.user.AppUser;
import pl.coderslab.charity.user.AppUserRepository;

import javax.persistence.EntityExistsException;
import javax.validation.Valid;

@Controller
@AllArgsConstructor
@RequestMapping("/forgot-password")
public class PasswordRecoveryController {

    private final PasswordRecoveryService passwordRecoveryService;
    private final AppUserRepository appUserRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;


    @GetMapping
    public String recoverPassword() {
        return "log-reg/password-recover";
    }


    @PostMapping
    public String createToken(@RequestParam(value= "email") String email) {
        passwordRecoveryService.sendToken(email);
        return "redirect:/";
    }

    @GetMapping("/confirm/{token}")
    public String confirm(@PathVariable String token, Model model) {
        passwordRecoveryService.confirmToken(token);
        Long userId = appUserRepository.findByToken(token);
        model.addAttribute("id", userId);
        return "log-reg/password-reset-confirmation";
    }

    @GetMapping("/reset-password/{id}")
    public String resetPassword(@PathVariable Long id, Model model) {
        AppUser appUser = appUserRepository.findById(id).orElseThrow(EntityExistsException::new);
        RegistrationRequest request = new RegistrationRequest();
        request.setFirstName(appUser.getFirstName());
        request.setLastName(appUser.getLastName());
        request.setEmail(appUser.getEmail());
        model.addAttribute("request", request);
        return "log-reg/reset-password";
    }

    @PostMapping("/reset-password/{id}")
    public String updatePassword(@Valid @ModelAttribute("request") RegistrationRequest request, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "log-reg/reset-password";
        }
        String password = bCryptPasswordEncoder.encode(request.getPassword());
        String email = request.getEmail();
        appUserRepository.updatePassword(password, email);
        return "redirect:/login";

    }

}
