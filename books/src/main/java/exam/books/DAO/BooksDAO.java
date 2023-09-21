package exam.books.DAO;

import java.util.List;

import exam.books.models.Book;
import exam.books.models.PublicationHouses;

public interface BooksDAO {

	public boolean registerPubHouse(PublicationHouses ph);

	public boolean addBook(Book b);

	public List<Book> getAllBooks(int id);

	public boolean delBook(int bookId);

	public List<PublicationHouses> getAllPublicationHouses();

}
