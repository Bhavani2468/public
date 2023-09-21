package exam.books.Repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import exam.books.DAO.BooksDAO;
import exam.books.models.Book;
import exam.books.models.PublicationHouses;

@Repository
public class BooksRepository {
	
	@Autowired
	BooksDAO dao;

	public boolean registerHouse(PublicationHouses ph) {
		return dao.registerPubHouse(ph);
	}

	public boolean addBookToHouse(Book b) {
		return dao.addBook(b);
	}

	public List<Book> getBooks(int id) {
			return dao.getAllBooks(id);
	
	}

	public boolean deleteBook(int bookId) {
		if(dao.delBook(bookId))
			return true;
		return false;
	}

	public List<PublicationHouses> getPublicationHouses() {
		return dao.getAllPublicationHouses();
	}

}
