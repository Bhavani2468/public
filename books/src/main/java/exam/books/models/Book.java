package exam.books.models;

import java.sql.Date;

public class Book {
	
	private int bid;
	private String bname;
	private String author;
	private Date published_date;
	private int published_house_id;
	public int getBid() {
		return bid;
	}
	public String getBname() {
		return bname;
	}
	public String getAuthor() {
		return author;
	}
	public Date getPublished_date() {
		return published_date;
	}
	public int getPublished_house_id() {
		return published_house_id;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setPublished_date(Date published_date) {
		this.published_date = published_date;
	}
	public void setPublished_house_id(int published_house_id) {
		this.published_house_id = published_house_id;
	}

}
