package exam.books.DAO;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import exam.books.models.Book;
import exam.books.models.PublicationHouses;

@Component
public class BooksDAOImpl implements BooksDAO {
	
	private final JdbcTemplate jdbcTemplate;
	
	 @Autowired
	    public BooksDAOImpl(JdbcTemplate jdbcTemplate) {
	        this.jdbcTemplate = jdbcTemplate;
	    }

	@Override
	public boolean registerPubHouse(PublicationHouses ph) {
		
		String insertQuery = "INSERT INTO chinnu_publishing_house (house_title, founded_date) VALUES (?,?)";
        return jdbcTemplate.update(insertQuery, ph.getHouse_title(),ph.getFounded_date()) > 0;
	}

	@Override
	public boolean addBook(Book b) {
		
		String insertQuery = "INSERT INTO chinnu_books (bname, author, published_date, published_house_id) VALUES (?,?,?,?)";
        return jdbcTemplate.update(insertQuery, b.getBname(),b.getAuthor(),b.getPublished_date(),b.getPublished_house_id()) > 0;
	}

	
	public List<Book> getAllBooks(int id)
	{
	        String query = "SELECT * FROM chinnu_books where published_house_id=?";
	        return jdbcTemplate.query(query, new Object[]{id}, new BeanPropertyRowMapper<>(Book.class));
	}

	@Override
	public boolean delBook(int bookId) {
		String query = "DELETE FROM books WHERE bid = ?";
		return jdbcTemplate.update(query,bookId) > 0;
	}

	@Override
	public List<PublicationHouses> getAllPublicationHouses() {
		String query = "SELECT * FROM chinnu_publishing_house";
        return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(PublicationHouses.class));
	}
}
