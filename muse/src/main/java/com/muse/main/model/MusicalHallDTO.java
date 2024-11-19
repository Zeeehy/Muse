package com.muse.main.model;


public class MusicalHallDTO  {

	private String mh_name;
	private String mh_addr;
	private String mh_img;
	
	public MusicalHallDTO() {
		super();
	}

	public MusicalHallDTO(String mh_name, String mh_addr, String mh_img) {
		super();
		this.mh_name = mh_name;
		this.mh_addr = mh_addr;
		this.mh_img = mh_img;
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

}
