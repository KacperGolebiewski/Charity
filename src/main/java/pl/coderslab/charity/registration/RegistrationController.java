package pl.coderslab.charity.registration;

import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.user.AppUser;
import pl.coderslab.charity.user.AppUserRepository;
import pl.coderslab.charity.user.AppUserService;

import javax.validation.Valid;

@Controller
@RequestMapping("/register")
@AllArgsConstructor
public class RegistrationController {

    private final RegistrationService registrationService;

    @GetMapping
    public String start(Model model) {
        model.addAttribute("request", new RegistrationRequest());
        return "register";
    }

    @PostMapping
    public String register(RegistrationRequest request) {
        registrationService.register(request);
        return "redirect:/login";
    }

    @GetMapping("/confirm/{token}")
    public String confirm(@PathVariable String token) {
        registrationService.confirmToken(token);
        return "register-confirmation";

    }



}