package com.muse.main.model;

import java.sql.Date;

public class MusicalActorDTO  {

	private String ma_name;
	private String ma_img;
	private Date ma_birth;
	// 해당 배우가 공연중인 뮤지컬 리스트 
	private String ma_musicalList;
	
	
	public MusicalActorDTO() {
		super();
	}

	public MusicalActorDTO(String ma_name, String ma_img, Date ma_birth,String ma_musicalList) {
		super();
		this.ma_name = ma_name;
		this.ma_img = ma_img;
		this.ma_birth = ma_birth;
		this.ma_musicalList = ma_musicalList;
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

	public Date getMa_birth() {
		return ma_birth;
	}

	public void setMa_birth(Date ma_birth) {
		this.ma_birth = ma_birth;
	}

	public String getMa_musicalList() {
		return ma_musicalList;
	}

	public void setMa_musicalList(String ma_musicalList) {
		this.ma_musicalList = ma_musicalList;
	}
	
}
