package com.muse.partner.model;

public class MusicalCastingDTO {

	private String mc_code;
	private String ma_code;
	private String mo_code;
	private String mc_char;
	public MusicalCastingDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public MusicalCastingDTO(String mc_code, String ma_code, String mo_code, String mc_char) {
		super();
		this.mc_code = mc_code;
		this.ma_code = ma_code;
		this.mo_code = mo_code;
		this.mc_char = mc_char;
	}


	public String getMc_code() {
		return mc_code;
	}
	public void setMc_code(String mc_code) {
		this.mc_code = mc_code;
	}
	public String getMa_code() {
		return ma_code;
	}
	public void setMa_code(String ma_code) {
		this.ma_code = ma_code;
	}
	public String getMo_code() {
		return mo_code;
	}
	public void setMo_code(String mo_code) {
		this.mo_code = mo_code;
	}
	public String getMc_char() {
		return mc_char;
	}
	public void setMc_char(String mc_char) {
		this.mc_char = mc_char;
	}
	
	
	
}
