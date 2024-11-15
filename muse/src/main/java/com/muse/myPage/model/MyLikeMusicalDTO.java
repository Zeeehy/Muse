package com.muse.myPage.model;

import java.sql.Date;

public class MyLikeMusicalDTO {
	private String lm_code;
	private String m_code;
	private Date lm_date;
	private String m_title;
	private Date m_startdate;
	private Date m_enddate;
	private String m_poster;
	
	public MyLikeMusicalDTO() {
		// TODO Auto-generated constructor stub
	}

	public MyLikeMusicalDTO(String lm_code, String m_code, Date lm_date, String m_title, Date m_startdate,
			Date m_enddate, String m_poster) {
		super();
		this.lm_code = lm_code;
		this.m_code = m_code;
		this.lm_date = lm_date;
		this.m_title = m_title;
		this.m_startdate = m_startdate;
		this.m_enddate = m_enddate;
		this.m_poster = m_poster;
	}

	public String getLm_code() {
		return lm_code;
	}

	public void setLm_code(String lm_code) {
		this.lm_code = lm_code;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public Date getLm_date() {
		return lm_date;
	}

	public void setLm_date(Date lm_date) {
		this.lm_date = lm_date;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public Date getM_startdate() {
		return m_startdate;
	}

	public void setM_startdate(Date m_startdate) {
		this.m_startdate = m_startdate;
	}

	public Date getM_enddate() {
		return m_enddate;
	}

	public void setM_enddate(Date m_enddate) {
		this.m_enddate = m_enddate;
	}

	public String getM_poster() {
		return m_poster;
	}

	public void setM_poster(String m_poster) {
		this.m_poster = m_poster;
	}
	
	
}
