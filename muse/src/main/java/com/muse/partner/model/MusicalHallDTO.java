package com.muse.partner.model;

public class MusicalHallDTO {

	
	
	private String mh_code;
	private String mh_name;
	private String mh_addr;
	private String mh_img;
	private double mh_x;
	private double mh_y;
	public MusicalHallDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public MusicalHallDTO(String mh_code, String mh_name, String mh_addr, String mh_img) {
		super();
		this.mh_code = mh_code;
		this.mh_name = mh_name;
		this.mh_addr = mh_addr;
		this.mh_img = mh_img;
	}


	public String getMh_code() {
		return mh_code;
	}
	public void setMh_code(String mh_code) {
		this.mh_code = mh_code;
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


	public double getMh_x() {
		return mh_x;
	}


	public void setMh_x(double mh_x) {
		this.mh_x = mh_x;
	}


	public double getMh_y() {
		return mh_y;
	}


	public void setMh_y(double mh_y) {
		this.mh_y = mh_y;
	}
	
	
	
}
