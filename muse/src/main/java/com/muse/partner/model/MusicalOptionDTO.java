package com.muse.partner.model;

public class MusicalOptionDTO {

	private String mo_code;
	private String m_code;
	private String mo_date;
	private String mo_time;

	
	public MusicalOptionDTO() {
		// TODO Auto-generated constructor stub
	}
	public MusicalOptionDTO(String mo_code, String m_code, String mo_date, String mo_time) {
		super();
		this.mo_code = mo_code;
		this.m_code = m_code;
		this.mo_date = mo_date;
		this.mo_time = mo_time;
	}

	public String getMo_code() {
		return mo_code;
	}

	public void setMo_code(String mo_code) {
		this.mo_code = mo_code;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public String getMo_date() {
		return mo_date;
	}

	public void setMo_date(String mo_date) {
		this.mo_date = mo_date;
	}

	public String getMo_time() {
		return mo_time;
	}

	public void setMo_time(String mo_time) {
		this.mo_time = mo_time;
	}

	
}
