package com.muse.myPage.model;

import java.sql.Date;

public class MyBookingListDTO {
	/*
	 select b.b_date, b.b_code, m.m_title, mo.mo_date, mo.mo_time, b.b_count, mo.mo_date-7, sysdate-mo.mo_date
		from booking b
		join musical_option mo on mo.mo_code = b.mo_code 
		join musical m on mo.m_code = m.m_code
		where b.u_id=#{u_id} 
		
		select b.b_date, b.b_code, m.m_title, mo.mo_date, mo.mo_time, b.b_count, mo.mo_date-1 as b_rfdate, b.b_state
		from booking b
		join musical_option mo on mo.mo_code = b.mo_code 
		join musical m on mo.m_code = m.m_code
		where b.u_id='test'
	*/
	
	private Date b_date;
	private String b_code;
	private String m_title;
	private Date mo_date;
	private String mo_time;
	private int b_count;
	private Date mr_date;		//취소가능날짜
	private int b_state;
	private int review_state;	//리뷰버튼 생성여부

	public MyBookingListDTO() {
		// TODO Auto-generated constructor stub
	}

	public MyBookingListDTO(Date b_date, String b_code, String m_title, Date mo_date, String mo_time, int b_count,
			Date mr_date, int b_state, int review_state) {
		super();
		this.b_date = b_date;
		this.b_code = b_code;
		this.m_title = m_title;
		this.mo_date = mo_date;
		this.mo_time = mo_time;
		this.b_count = b_count;
		this.mr_date = mr_date;
		this.b_state = b_state;
		this.review_state = review_state;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public String getB_code() {
		return b_code;
	}

	public void setB_code(String b_code) {
		this.b_code = b_code;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public Date getMo_date() {
		return mo_date;
	}

	public void setMo_date(Date mo_date) {
		this.mo_date = mo_date;
	}

	public String getMo_time() {
		return mo_time;
	}

	public void setMo_time(String mo_time) {
		this.mo_time = mo_time;
	}

	public int getB_count() {
		return b_count;
	}

	public void setB_count(int b_count) {
		this.b_count = b_count;
	}

	public Date getMr_date() {
		return mr_date;
	}

	public void setMr_date(Date mr_date) {
		this.mr_date = mr_date;
	}

	public int getB_state() {
		return b_state;
	}

	public void setB_state(int b_state) {
		this.b_state = b_state;
	}

	public int getReview_state() {
		return review_state;
	}

	public void setReview_state(int review_state) {
		this.review_state = review_state;
	}
	
	
	
	
	
}
