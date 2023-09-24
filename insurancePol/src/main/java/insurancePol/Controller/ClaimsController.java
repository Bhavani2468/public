package insurancePol.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import insurancePol.models.ClaimBills;
import insurancePol.repository.ClaimRepository;

@Controller
public class ClaimsController {
	
	@Autowired
	ClaimRepository cr;

    @GetMapping("/cf")
    public String showForm(Model model) {
    	
        model.addAttribute("name", "");
        return "claimForm";
    }

    @PostMapping("/submit")
    public String processForm(@ModelAttribute ClaimBills cm) {
        System.out.println("At controller,doc title is "+cm.getClbl_document_title()+" doc path is "+cm.getClbl_document_path());
    	cr.addClaim(cm);
    	
        return "result";
    }
}
