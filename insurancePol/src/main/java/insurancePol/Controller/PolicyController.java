package insurancePol.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import insurancePol.models.ClaimBills;
import insurancePol.repository.ClaimRepository;

@Controller
public class PolicyController {
	
	@Autowired
	ClaimRepository cr;

    @GetMapping("/cf")
    public String showForm(Model model) {
        model.addAttribute("name", "");
        return "claimForm";
    }

    @PostMapping("/submit")
    public String processForm(ClaimBills cm) {
        
    	cr.addClaim(cm);
    	
        return "result";
    }
}
