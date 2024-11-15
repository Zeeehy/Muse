package com.muse.partner.model;

public class ServiceRequestDTO {

	private String sr_code;
	private String rs_code;
	private String rt_code;
	private String m_code;
	private String sr_date;
	private String sr_etc;
	private String sr_reason;
	
	public ServiceRequestDTO() {
		// TODO Auto-generated constructor stub
	}

	public ServiceRequestDTO(String sr_code, String rs_code, String rt_code, String m_code, String sr_date,
			String sr_etc, String sr_reason) {
		super();
		this.sr_code = sr_code;
		this.rs_code = rs_code;
		this.rt_code = rt_code;
		this.m_code = m_code;
		this.sr_date = sr_date;
		this.sr_etc = sr_etc;
		this.sr_reason = sr_reason;
	}

	public String getSr_code() {
		return sr_code;
	}

	public void setSr_code(String sr_code) {
		this.sr_code = sr_code;
	}

	public String getRs_code() {
		return rs_code;
	}

	public void setRs_code(String rs_code) {
		this.rs_code = rs_code;
	}

	public String getRt_code() {
		return rt_code;
	}

	public void setRt_code(String rt_code) {
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

	public String getSr_etc() {
		return sr_etc;
	}

	public void setSr_etc(String sr_etc) {
		this.sr_etc = sr_etc;
	}

	public String getSr_reason() {
		return sr_reason;
	}

	public void setSr_reason(String sr_reason) {
		this.sr_reason = sr_reason;
	}
	
	
}
