package data.dto;

import java.sql.Timestamp;

public class HotelDto {
	
	private String h_num;
	private String h_subject;
	private String h_content;
	private String h_image;
	private String h_location;
	private String h_link;
	
	private String h_category;
	
	private Timestamp h_writeday;

	public String getH_num() {
		return h_num;
	}

	public void setH_num(String h_num) {
		this.h_num = h_num;
	}

	public String getH_subject() {
		return h_subject;
	}

	public void setH_subject(String h_subject) {
		this.h_subject = h_subject;
	}

	public String getH_content() {
		return h_content;
	}

	public void setH_content(String h_content) {
		this.h_content = h_content;
	}

	public String getH_image() {
		return h_image;
	}

	public void setH_image(String h_image) {
		this.h_image = h_image;
	}


	public String getH_link() {
		return h_link;
	}

	public void setH_link(String h_link) {
		this.h_link = h_link;
	}



	public String getH_location() {
		return h_location;
	}

	public void setH_location(String h_location) {
		this.h_location = h_location;
	}

	public String getH_category() {
		return h_category;
	}

	public void setH_category(String h_category) {
		this.h_category = h_category;
	}

	public Timestamp getH_writeday() {
		return h_writeday;
	}

	public void setH_writeday(Timestamp h_writeday) {
		this.h_writeday = h_writeday;
	}


	
	

}
