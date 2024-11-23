package com.muse.partner.model;

public class ServiceRequestDTO {

	private String sr_code;
	private int rs_code;
	private int rt_code;
	private String m_code;
	private String sr_date;
	private String sr_reason;
	private String rs_etc;
	public ServiceRequestDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ServiceRequestDTO(String sr_code, int rs_code, int rt_code, String m_code, String sr_date, String sr_reason,
			String rs_etc) {
		super();
		this.sr_code = sr_code;
		this.rs_code = rs_code;
		this.rt_code = rt_code;
		this.m_code = m_code;
		this.sr_date = sr_date;
		this.sr_reason = sr_reason;
		this.rs_etc = rs_etc;
	}

	public String getSr_code() {
		return sr_code;
	}
	public void setSr_code(String sr_code) {
		this.sr_code = sr_code;
	}
	public int getRs_code() {
		return rs_code;
	}
	public void setRs_code(int rs_code) {
		this.rs_code = rs_code;
	}
	public int getRt_code() {
		return rt_code;
	}
	public void setRt_code(int rt_code) {
		this.rt_code = rt_code;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public String getSr_date() {
		return sr_date;
	}
	public void setSr_date(String sr_date) {
		this.sr_date = sr_date;
	}
	public String getSr_reason() {
		return sr_reason;
	}
	public void setSr_reason(String sr_reason) {
		this.sr_reason = sr_reason;
	}
	public String getRs_etc() {
		return rs_etc;
	}
	public void setRs_etc(String rs_etc) {
		this.rs_etc = rs_etc;
	}
 
	
	
	
}
