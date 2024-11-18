package com.muse.myPage.model;

import java.sql.Date;

public class MyBookingDetailDTO {
	private String b_code;
	private Date b_date;
	private String b_type;
	private String b_state;
	private Date mo_date;
	private String m_poster;
	private String m_title;
	private String mh_name;
	private String mh_addr;
	private String bd_code;
	private int bd_state;
	private int bd_price;
	private int d_num;
	private String d_name;
	private String s_section;
	private int s_position;
	private int s_row;
	private int s_floor;
	private String sg_name;
	private int sp_price;
	private String u_name;
	private int refund_state;
	private int review_state;

	public MyBookingDetailDTO() {
		// TODO Auto-generated constructor stub
	}

	public MyBookingDetailDTO(String b_code, Date b_date, String b_type, String b_state, Date mo_date, String m_poster,
			String m_title, String mh_name, String mh_addr, String bd_code, int bd_state, int bd_price, int d_num,
			String d_name, String s_section, int s_position, int s_row, int s_floor, String sg_name, int sp_price,
			String u_name, int refund_state, int review_state) {
		super();
		this.b_code = b_code;
		this.b_date = b_date;
		this.b_type = b_type;
		this.b_state = b_state;
		this.mo_date = mo_date;
		this.m_poster = m_poster;
		this.m_title = m_title;
		this.mh_name = mh_name;
		this.mh_addr = mh_addr;
		this.bd_code = bd_code;
		this.bd_state = bd_state;
		this.bd_price = bd_price;
		this.d_num = d_num;
		this.d_name = d_name;
		this.s_section = s_section;
		this.s_position = s_position;
		this.s_row = s_row;
		this.s_floor = s_floor;
		this.sg_name = sg_name;
		this.sp_price = sp_price;
		this.u_name = u_name;
		this.refund_state = refund_state;
		this.review_state = review_state;
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

	public String getB_state() {
		return b_state;
	}

	public void setB_state(String b_state) {
		this.b_state = b_state;
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

	public String getBd_code() {
		return bd_code;
	}

	public void setBd_code(String bd_code) {
		this.bd_code = bd_code;
	}

	public int getBd_state() {
		return bd_state;
	}

	public void setBd_state(int bd_state) {
		this.bd_state = bd_state;
	}

	public int getBd_price() {
		return bd_price;
	}

	public void setBd_price(int bd_price) {
		this.bd_price = bd_price;
	}

	public int getD_num() {
		return d_num;
	}

	public void setD_num(int d_num) {
		this.d_num = d_num;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
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

	public String getSg_name() {
		return sg_name;
	}

	public void setSg_name(String sg_name) {
		this.sg_name = sg_name;
	}

	public int getSp_price() {
		return sp_price;
	}

	public void setSp_price(int sp_price) {
		this.sp_price = sp_price;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public int getRefund_state() {
		return refund_state;
	}

	public void setRefund_state(int refund_state) {
		this.refund_state = refund_state;
	}

	public int getReview_state() {
		return review_state;
	}

	public void setReview_state(int review_state) {
		this.review_state = review_state;
	}


}
