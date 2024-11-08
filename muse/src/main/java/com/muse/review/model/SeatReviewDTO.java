package com.muse.review.model;

import java.sql.Date;

public class SeatReviewDTO {

	//검색
	private String mh_name; // 공연장이름
	private String m_title ; // 공연명
	
	//공연명 검색이면 공연명, 기간, 장소
	private Date m_startdate;
	private Date m_enddate;
	private String m_poster;
	private String m_code;
	
	//공연장이름 검색이면 공연장이름만
	private String mh_code;
	
	public SeatReviewDTO() {
		super();
	}


	public String getMh_name() {
		return mh_name;
	}


	public void setMh_name(String mh_name) {
		this.mh_name = mh_name;
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


	public String getM_code() {
		return m_code;
	}


	public void setM_code(String m_code) {
		this.m_code = m_code;
	}


	public String getMh_code() {
		return mh_code;
	}


	public void setMh_code(String mh_code) {
		this.mh_code = mh_code;
	}
	
	
	
	
	
}
