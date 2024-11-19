package com.muse.partner.model;

public class BbsDeleteRequestDTO {

	private String bdr_code;
	private String pr_code;
	private int bdr_type;
	private String bdr_key;
	private String bdr_reason;
	private int bdr_state;
	public BbsDeleteRequestDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public BbsDeleteRequestDTO(String bdr_code, String pr_code, int bdr_type, String bdr_key, String bdr_reason,
			int bdr_state) {
		super();
		this.bdr_code = bdr_code;
		this.pr_code = pr_code;
		this.bdr_type = bdr_type;
		this.bdr_key = bdr_key;
		this.bdr_reason = bdr_reason;
		this.bdr_state = bdr_state;
	}


	public String getBdr_code() {
		return bdr_code;
	}
	public void setBdr_code(String bdr_code) {
		this.bdr_code = bdr_code;
	}
	public String getPr_code() {
		return pr_code;
	}
	public void setPr_code(String pr_code) {
		this.pr_code = pr_code;
	}
	public int getBdr_type() {
		return bdr_type;
	}
	public void setBdr_type(int bdr_type) {
		this.bdr_type = bdr_type;
	}
	public String getBdr_key() {
		return bdr_key;
	}
	public void setBdr_key(String bdr_key) {
		this.bdr_key = bdr_key;
	}
	public String getBdr_reason() {
		return bdr_reason;
	}
	public void setBdr_reason(String bdr_reason) {
		this.bdr_reason = bdr_reason;
	}
	public int getBdr_state() {
		return bdr_state;
	}
	public void setBdr_state(int bdr_state) {
		this.bdr_state = bdr_state;
	}
	
}
