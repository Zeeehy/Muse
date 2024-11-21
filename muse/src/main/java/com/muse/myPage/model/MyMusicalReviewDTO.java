package com.muse.myPage.model;

public class MyMusicalReviewDTO {
	private String mr_code;
	private String b_code;
	private double mr_score;
	private String mr_title;
	private String mr_content;
	private String mr_date;
	private String m_title;
	
	public MyMusicalReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public MyMusicalReviewDTO(String mr_code, String b_code, double mr_score, String mr_title, String mr_content,
			String mr_date, String m_title) {
		super();
		this.mr_code = mr_code;
		this.b_code = b_code;
		this.mr_score = mr_score;
		this.mr_title = mr_title;
		this.mr_content = mr_content;
		this.mr_date = mr_date;
		this.m_title = m_title;
	}

	public String getMr_code() {
		return mr_code;
	}

	public void setMr_code(String mr_code) {
		this.mr_code = mr_code;
	}

	public String getB_code() {
		return b_code;
	}

	public void setB_code(String b_code) {
		this.b_code = b_code;
	}

	public double getMr_score() {
		return mr_score;
	}

	public void setMr_score(double mr_score) {
		this.mr_score = mr_score;
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

	public String getMr_date() {
		return mr_date;
	}

	public void setMr_date(String mr_date) {
		this.mr_date = mr_date;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	
}
