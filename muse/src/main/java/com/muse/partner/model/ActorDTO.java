package com.muse.partner.model;

public class ActorDTO {

	
	public ActorDTO() {
		// TODO Auto-generated constructor stub
	}
	
	private String ma_code;
	private String ma_name;
	private String ma_img;
	private String ma_birth;
	
	public ActorDTO(String ma_code, String ma_name, String ma_img, String ma_birth) {
		super();
		this.ma_code = ma_code;
		this.ma_name = ma_name;
		this.ma_img = ma_img;
		this.ma_birth = ma_birth;
	}
	
	public String getMa_code() {
		return ma_code;
	}
	public void setMa_code(String ma_code) {
		this.ma_code = ma_code;
	}
	public String getMa_name() {
		return ma_name;
	}
	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
	}
	public String getma_img() {
		return ma_img;
	}
	public void setma_img(String ma_img) {
		this.ma_img = ma_img;
	}
	public String getMa_birth() {
		return ma_birth;
	}
	public void setMa_birth(String ma_birth) {
		this.ma_birth = ma_birth;
	}
	
}
