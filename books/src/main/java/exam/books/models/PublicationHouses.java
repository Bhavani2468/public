package exam.books.models;

import java.sql.Date;

public class PublicationHouses {
	
	private int published_house_id;
	private String house_title;
	private Date founded_date;
	public int getPublished_house_id() {
		return published_house_id;
	}
	public String getHouse_title() {
		return house_title;
	}
	public Date getFounded_date() {
		return founded_date;
	}
	public void setPublished_house_id(int published_house_id) {
		this.published_house_id = published_house_id;
	}
	public void setHouse_title(String house_title) {
		this.house_title = house_title;
	}
	public void setFounded_date(Date founded_date) {
		this.founded_date = founded_date;
	}

}
