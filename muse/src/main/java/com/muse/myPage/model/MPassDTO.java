package com.muse.myPage.model;

import java.sql.Date;

public class MPassDTO {
	private String mp_code;
	private Date mp_startdate;
	private Date mp_enddate;
	private int mp_state;
	private int mp_price;
	
	public MPassDTO() {
		// TODO Auto-generated constructor stub
	}

	public MPassDTO(String mp_code, Date mp_startdate, Date mp_enddate, int mp_state, int mp_price) {
		super();
		this.mp_code = mp_code;
		this.mp_startdate = mp_startdate;
		this.mp_enddate = mp_enddate;
		this.mp_state = mp_state;
		this.mp_price = mp_price;
	}

	public String getMp_code() {
		return mp_code;
	}

	public void setMp_code(String mp_code) {
		this.mp_code = mp_code;
	}

	public Date getMp_startdate() {
		return mp_startdate;
	}

	public void setMp_startdate(Date mp_startdate) {
		this.mp_startdate = mp_startdate;
	}

	public Date getMp_enddate() {
		return mp_enddate;
	}

	public void setMp_enddate(Date mp_enddate) {
		this.mp_enddate = mp_enddate;
	}

	public int getMp_state() {
		return mp_state;
	}

	public void setMp_state(int mp_state) {
		this.mp_state = mp_state;
	}

	public int getMp_price() {
		return mp_price;
	}

	public void setMp_price(int mp_price) {
		this.mp_price = mp_price;
	}
	
	
}
