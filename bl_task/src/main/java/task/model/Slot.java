package task.model;

import java.sql.Date;
import java.sql.Time;

public class Slot {
	private int lastId;
	private int buttonId;
	private int dateId;
	private String p;

	public int getLastId() {
		return lastId;
	}

	public int getButtonId() {
		return buttonId;
	}

	public int getDateId() {
		return dateId;
	}

	public void setLastId(int lastId) {
		this.lastId = lastId;
	}

	public void setButtonId(int buttonId) {
		this.buttonId = buttonId;
	}

	public void setDateId(int dateId) {
		this.dateId = dateId;
	}

	
	
}
