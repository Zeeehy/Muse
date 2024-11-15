package com.muse.myPage.model;

import java.sql.Date;

public class MyLikeActorDTO {
	private String la_code;
	private String ma_code;
	private String ma_name;
	private String ma_img;
	private Date la_date;
	
	public MyLikeActorDTO() {
		// TODO Auto-generated constructor stub
	}

	public MyLikeActorDTO(String la_code, String ma_code, String ma_name, String ma_img, Date la_date) {
		super();
		this.la_code = la_code;
		this.ma_code = ma_code;
		this.ma_name = ma_name;
		this.ma_img = ma_img;
		this.la_date = la_date;
	}

	public String getLa_code() {
		return la_code;
	}

	public void setLa_code(String la_code) {
		this.la_code = la_code;
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

	public String getMa_img() {
		return ma_img;
	}

	public void setMa_img(String ma_img) {
		this.ma_img = ma_img;
	}

	public Date getLa_date() {
		return la_date;
	}

	public void setLa_date(Date la_date) {
		this.la_date = la_date;
	}
	
	
}
