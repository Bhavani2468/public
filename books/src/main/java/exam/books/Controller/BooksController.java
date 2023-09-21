package exam.books.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import exam.books.Repository.BooksRepository;
import exam.books.models.Book;
import exam.books.models.PublicationHouses;



@Controller
public class BooksController {
	
	@Autowired
	BooksRepository br;
	
	@RequestMapping(value = "/registerHouse", method = RequestMethod.POST)
	@ResponseBody
	public String registerPublishingHouse(@ModelAttribute PublicationHouses ph)
	{
		//In this method, the new publication house will be register to publish their books
		if(br.registerHouse(ph))
			return "success";
		return null;
	}
	
	
	@RequestMapping(value = "/addBook", method = RequestMethod.POST)
	@ResponseBody
	public String addNewBook(@ModelAttribute Book b)
	{
		//In this method, the new books will be added to the existing publication house stock
		if(br.addBookToHouse(b))
			return "success";
		return null;
	}
	
	@RequestMapping(value = "/loginValidation", method = RequestMethod.POST)
	@ResponseBody
	public String loginValidation(@RequestParam("username") String username, @RequestParam("password") String password)
	{
		//In this method, the login credentials will be checked based on the key
		String key="husdyfgdhfbdvdv"+username+"hycgyxzhgfyhxgd"+password+"khdjhfgjdfg";	//here i am manually generating a key using username and password
		if(key.equals("husdyfgdhfbdvdvbhavshycgyxzhgfyhxgd1234khdjhfgjdfg"))  // comparing with the key generated for fixed credentials as username=bhavs and password=1234
			return "success";
		return null;
	}
	
	@RequestMapping(value = "/getBooks", method = RequestMethod.GET)
	@ResponseBody
	public List<Book> returnPackages(@ModelAttribute Book b,@RequestParam("data") int id) {

		return br.getBooks(id);
	}
	
	
	@RequestMapping(value = "/getPublishers", method = RequestMethod.GET)
	@ResponseBody
	public List<PublicationHouses> returnPackages(@ModelAttribute PublicationHouses ph) {

		return br.getPublicationHouses();
	}
	
	@DeleteMapping("/deleteBook/{bookId}")
    public String deleteBook(@PathVariable int bookId) {
        if (br.deleteBook(bookId)) {
            return "Book with ID " + bookId + " has been deleted successfully.";
        } else {
            return "Book with ID " + bookId + " does not exist or could not be deleted.";
        }
    }

}
