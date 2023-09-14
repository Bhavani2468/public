package InsuranceSystem.ims.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import InsuranceSystem.ims.models.Users;
import InsuranceSystem.ims.service.UserService;

@Controller
public class FrontController {
	
	@Autowired
	UserService us;
	
	@RequestMapping(value = "/createUser", method = RequestMethod.POST)
	@ResponseBody
	public String createUser(@ModelAttribute Users u) {

		us.registerUsers(u);
		return "hello";
	}

}
