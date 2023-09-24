package insurancePol.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PolicyController {

    @GetMapping("/cf")
    public String showForm(Model model) {
        model.addAttribute("name", "");
        return "claimForm";
    }

    @PostMapping("/submit")
    public String processForm(@RequestParam String name, Model model) {
        // Process the submitted data (e.g., save to a database)
        // For simplicity, we'll just return a message with the name
        model.addAttribute("message", "Hello, " + name + "!");
        return "result";
    }
}
