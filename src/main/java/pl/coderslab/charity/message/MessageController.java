package pl.coderslab.charity.message;


import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@AllArgsConstructor
@RequestMapping("/contact-us")
public class MessageController {

    private final MessageRepository messageRepository;

    @GetMapping
    String messageAdd(Model model) {
        model.addAttribute("message", new Message());
        return "contact-us";
    }

    @PostMapping
    String messageSave(@Valid Message message, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "contact-us";
        }
        messageRepository.save(message);
        return "redirect:/";
    }
}
