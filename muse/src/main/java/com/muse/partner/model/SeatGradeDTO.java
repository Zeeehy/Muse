package com.muse.partner.model;

public class SeatGradeDTO {

	private String sg_code;
	private String sg_name;
	private String sp_code;
	private String m_code;
	private int sp_price;
	
	public SeatGradeDTO() {
		// TODO Auto-generated constructor stub
	}

	public SeatGradeDTO(String sg_code, String sg_name, String sp_code, String m_code, int sp_price) {
		super();
		this.sg_code = sg_code;
		this.sg_name = sg_name;
		this.sp_code = sp_code;
		this.m_code = m_code;
		this.sp_price = sp_price;
	}

	public String getSg_code() {
		return sg_code;
	}

	public void setSg_code(String sg_code) {
		this.sg_code = sg_code;
	}

	public String getSg_name() {
		return sg_name;
	}

	public void setSg_name(String sg_name) {
		this.sg_name = sg_name;
	}

	public String getSp_code() {
		return sp_code;
	}

	public void setSp_code(String sp_code) {
		this.sp_code = sp_code;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public int getSp_price() {
		return sp_price;
	}

	public void setSp_price(int sp_price) {
		this.sp_price = sp_price;
	}
	
	

	
}
