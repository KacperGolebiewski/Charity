package pl.coderslab.charity.registration;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/register")
@AllArgsConstructor
public class RegistrationController {

    private final RegistrationService registrationService;

    @GetMapping
    public String start(Model model) {
        model.addAttribute("request", new RegistrationRequest());
        return "log-reg/register";
    }

    @PostMapping
    public String register(RegistrationRequest request) {
        registrationService.register(request);
        return "redirect:/login";
    }

    @GetMapping("/confirm/{token}")
    public String confirm(@PathVariable String token) {
        registrationService.confirmToken(token);
        return "log-reg/register-confirmation";

    }



}