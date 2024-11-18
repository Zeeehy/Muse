package com.muse.main.model;

import java.sql.Date;

public class MusicalActorDTO  {

	private String ma_name;
	private String ma_image;
	private Date ma_birth;
	
	
	public MusicalActorDTO() {
		super();
	}

	public MusicalActorDTO(String ma_name, String ma_image, Date ma_birth) {
		super();
		this.ma_name = ma_name;
		this.ma_image = ma_image;
		this.ma_birth = ma_birth;
	}

	public String getMa_name() {
		return ma_name;
	}

	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
	}

	public String getMa_image() {
		return ma_image;
	}

	public void setMa_image(String ma_image) {
		this.ma_image = ma_image;
	}

	public Date getMa_birth() {
		return ma_birth;
	}

	public void setMa_birth(Date ma_birth) {
		this.ma_birth = ma_birth;
	}
	
}
