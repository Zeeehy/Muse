package com.muse.partner.model;

public class MusicalReviewDTO {

	private String mr_code;
	private String mr_title;
	private String mr_content;
	private int mr_score;
	private String mr_date;
	private String u_id;
	private String pr_code;
	
	
	
	
	public MusicalReviewDTO() {
		// TODO Auto-generated constructor stub
	}




	public MusicalReviewDTO(String mr_code, String mr_title, String mr_content, int mr_score, String mr_date,
			String u_id, String pr_code) {
		super();
		this.mr_code = mr_code;
		this.mr_title = mr_title;
		this.mr_content = mr_content;
		this.mr_score = mr_score;
		this.mr_date = mr_date;
		this.u_id = u_id;
		this.pr_code = pr_code;
	}




	public String getMr_code() {
		return mr_code;
	}




	public void setMr_code(String mr_code) {
		this.mr_code = mr_code;
	}




	public String getMr_title() {
		return mr_title;
	}




	public void setMr_title(String mr_title) {
		this.mr_title = mr_title;
	}




	public String getMr_content() {
		return mr_content;
	}




	public void setMr_content(String mr_content) {
		this.mr_content = mr_content;
	}




	public int getMr_score() {
		return mr_score;
	}




	public void setMr_score(int mr_score) {
		this.mr_score = mr_score;
	}




	public String getMr_date() {
		return mr_date;
	}




	public void setMr_date(String mr_date) {
		this.mr_date = mr_date;
	}




	public String getU_id() {
		return u_id;
	}




	public void setU_id(String u_id) {
		this.u_id = u_id;
	}




	public String getPr_code() {
		return pr_code;
	}




	public void setPr_code(String pr_code) {
		this.pr_code = pr_code;
	}




	
	
}
