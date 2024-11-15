package com.muse.main.model;


public class BestReviewDTO  {

	private String m_code;
	private String m_poster;
	private String m_title;
	private String mr_title;
	private String mr_content;
	private double mr_score;
	private String u_id;
	
	
	public BestReviewDTO() {
		super();
	}

	public BestReviewDTO(String m_code, String m_poster, String m_title, String mr_title, String mr_content, double mr_score,
			String u_id) {
		super();
		this.m_code = m_code;
		this.m_poster = m_poster;
		this.m_title = m_title;
		this.mr_title = mr_title;
		this.mr_content = mr_content;
		this.mr_score = mr_score;
		this.u_id = u_id;
	}
	
	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	
	public String getM_poster() {
		return m_poster;
	}

	public void setM_poster(String m_poster) {
		this.m_poster = m_poster;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
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

	public double getMr_score() {
		return mr_score;
	}

	public void setMr_score(double mr_score) {
		this.mr_score = mr_score;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

}
