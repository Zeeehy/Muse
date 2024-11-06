package com.muse.myPage.model;

import java.sql.Date;

public class MyPageUserDTO {
	private String u_id;
	private String u_pwd;
	private String u_name;
	private String u_email;
	private String u_pnum;
	private int u_age;
	private int u_mpass;
	private java.sql.Date u_date;
	private int u_out;
	
	public MyPageUserDTO() {
		// TODO Auto-generated constructor stub
	}

	public MyPageUserDTO(String u_id, String u_pwd, String u_name, String u_email, String u_pnum, int u_age,
			int u_mpass, Date u_date, int u_out) {
		super();
		this.u_id = u_id;
		this.u_pwd = u_pwd;
		this.u_name = u_name;
		this.u_email = u_email;
		this.u_pnum = u_pnum;
		this.u_age = u_age;
		this.u_mpass = u_mpass;
		this.u_date = u_date;
		this.u_out = u_out;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_pnum() {
		return u_pnum;
	}

	public void setU_pnum(String u_pnum) {
		this.u_pnum = u_pnum;
	}

	public int getU_age() {
		return u_age;
	}

	public void setU_age(int u_age) {
		this.u_age = u_age;
	}

	public int getU_mpass() {
		return u_mpass;
	}

	public void setU_mpass(int u_mpass) {
		this.u_mpass = u_mpass;
	}

	public java.sql.Date getU_date() {
		return u_date;
	}

	public void setU_date(java.sql.Date u_date) {
		this.u_date = u_date;
	}

	public int getU_out() {
		return u_out;
	}

	public void setU_out(int u_out) {
		this.u_out = u_out;
	}
	
	
}
