package com.muse.myPage.model;

import java.sql.Date;

public class MyBookingDetailDTO {
	private String b_code;
	private Date b_date;
	private String b_type;
	private Date mo_date;
	private String m_poster;
	private String m_title;
	private String mh_name;
	private String mh_addr;
	private int bd_price;
	private String s_section;
	private int s_position;
	private int s_row;
	private int s_floor;
	private String u_name;

	public MyBookingDetailDTO() {
		// TODO Auto-generated constructor stub
	}

	public MyBookingDetailDTO(String b_code, Date b_date, String b_type, Date mo_date, String m_poster, String m_title,
			String mh_name, String mh_addr, int bd_price, String s_section, int s_position, int s_row, int s_floor,
			String u_name) {
		super();
		this.b_code = b_code;
		this.b_date = b_date;
		this.b_type = b_type;
		this.mo_date = mo_date;
		this.m_poster = m_poster;
		this.m_title = m_title;
		this.mh_name = mh_name;
		this.mh_addr = mh_addr;
		this.bd_price = bd_price;
		this.s_section = s_section;
		this.s_position = s_position;
		this.s_row = s_row;
		this.s_floor = s_floor;
		this.u_name = u_name;
	}

	public String getB_code() {
		return b_code;
	}

	public void setB_code(String b_code) {
		this.b_code = b_code;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public String getB_type() {
		return b_type;
	}

	public void setB_type(String b_type) {
		this.b_type = b_type;
	}

	public Date getMo_date() {
		return mo_date;
	}

	public void setMo_date(Date mo_date) {
		this.mo_date = mo_date;
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

	public String getMh_name() {
		return mh_name;
	}

	public void setMh_name(String mh_name) {
		this.mh_name = mh_name;
	}

	public String getMh_addr() {
		return mh_addr;
	}

	public void setMh_addr(String mh_addr) {
		this.mh_addr = mh_addr;
	}

	public int getBd_price() {
		return bd_price;
	}

	public void setBd_price(int bd_price) {
		this.bd_price = bd_price;
	}

	public String getS_section() {
		return s_section;
	}

	public void setS_section(String s_section) {
		this.s_section = s_section;
	}

	public int getS_position() {
		return s_position;
	}

	public void setS_position(int s_position) {
		this.s_position = s_position;
	}

	public int getS_row() {
		return s_row;
	}

	public void setS_row(int s_row) {
		this.s_row = s_row;
	}

	public int getS_floor() {
		return s_floor;
	}

	public void setS_floor(int s_floor) {
		this.s_floor = s_floor;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	
	
}
