package pl.coderslab.charity.login;


import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.user.AppUserRepository;

@Controller
@AllArgsConstructor
@RequestMapping("/password-recover")
public class PasswordRecoveryController {

    private final AppUserRepository appUserRepository;
    @GetMapping
    public String recoverPassword() {
        return "log-reg/password-recover";
    }

    @PostMapping
    public String sendRecoveryPassword(@RequestParam("email") String email) {


        return "redirect:/login";
    }
}
