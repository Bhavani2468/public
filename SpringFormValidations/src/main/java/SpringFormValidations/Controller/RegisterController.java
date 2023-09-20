package SpringFormValidations.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import SpringFormValidations.models.User;

 
@Controller
public class RegisterController {
 
    @RequestMapping(value = "/register",method = RequestMethod.GET)

    public String viewRegistration(Map<String, Object> model) {
        User userForm = new User();    
        model.put("userForm", userForm);
         
        List<String> professionList = new ArrayList<>();
        professionList.add("Developer");
        professionList.add("Designer");
        professionList.add("IT Manager");
        model.put("professionList", professionList);
         
        return "registration";
    }
     
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String processRegistration(@Valid @ModelAttribute("userForm") User user,BindingResult bindingResult,
            Map<String, Object> model) {
         
        // implement your own registration logic here...
         
        // for testing purpose:
        System.out.println("username: " + user.getUsername());
        System.out.println("password: " + user.getPassword());
        System.out.println("email: " + user.getEmail());
        System.out.println("birth date: " + user.getBirthDate());
        System.out.println("profession: " + user.getProfession());
         
 	if (bindingResult.hasErrors()) {       
        	return "registration";
    	} else {
       	 	return "registrationsuccess";
    	}
        
    }
}
