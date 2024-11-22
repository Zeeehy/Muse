package com.muse.musePass.model;

import java.sql.Date;

public class MusePassDTO {

	private String mp_code;
	private String u_id;
	private Date mp_startdate;
	private Date mp_enddate;
	private int mp_state;
	private int mp_price;
	
	public MusePassDTO() {
		super();
	}

	public String getMp_code() {
		return mp_code;
	}

	public void setMp_code(String mp_code) {
		this.mp_code = mp_code;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
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
