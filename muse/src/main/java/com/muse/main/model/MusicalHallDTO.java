package com.muse.main.model;

public class MusicalHallDTO  {

	private String mh_name;
	private String mh_addr;
	private String mh_img;
	// 해당 뮤지컬 홀에서 공연중인 뮤지컬 리스트 
	private String mh_musicalList;
	
	public MusicalHallDTO() {
		super();
	}

	public MusicalHallDTO(String mh_name, String mh_addr, String mh_img, String mh_musicalList) {
		super();
		this.mh_name = mh_name;
		this.mh_addr = mh_addr;
		this.mh_img = mh_img;
		this.mh_musicalList = mh_musicalList;
	}

	public String getMh_name() {
		return mh_name;
	}

	public void setMh_name(String mh_name) {
		this.mh_name = mh_name;
	}

	public String getMh_addr() {
		return mh_addr;
	}

	public void setMh_addr(String mh_addr) {
		this.mh_addr = mh_addr;
	}

	public String getMh_img() {
		return mh_img;
	}
  
	public void setMh_img(String mh_img) {
		this.mh_img = mh_img;
	}

	public String getMh_musicalList() {
		return mh_musicalList;
	}

	public void setMh_musicalList(String mh_musicalList) {
		this.mh_musicalList = mh_musicalList;
	}

}
