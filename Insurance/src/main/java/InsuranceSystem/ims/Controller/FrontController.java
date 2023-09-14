package InsuranceSystem.ims.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import InsuranceSystem.ims.models.InsurancePackages;
import InsuranceSystem.ims.models.Users;
import InsuranceSystem.ims.service.UserService;

@Controller
public class FrontController {
	
	@Autowired
	UserService us;
	
	@RequestMapping(value = "/createUser", method = RequestMethod.POST)
	@ResponseBody
	public String createUser(@ModelAttribute Users u) {

		if(us.registerUsers(u))
		 return "success";
		return "error";
	}

	@RequestMapping(value = "/getPacks", method = RequestMethod.GET)
	@ResponseBody
	public List<InsurancePackages> returnPackages(@ModelAttribute Users u) {

		return us.getInsurancePackages();
	}
	
	@RequestMapping(value = "/updateUserStatus/{userId}", method = RequestMethod.PUT)
	@ResponseBody
	public ResponseEntity<String> updateUserStatus(@PathVariable Long userId, @RequestBody Map<String, String> request) {
        String newStatus = request.get("status");

        boolean updated = us.updateUserStatus(userId, newStatus);

        if (updated) {
            return ResponseEntity.ok("User status updated successfully");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update user status");
        }
    }
}
