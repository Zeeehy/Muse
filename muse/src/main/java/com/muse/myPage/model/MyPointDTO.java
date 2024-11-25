package com.muse.myPage.model;

import java.sql.Date;

public class MyPointDTO {
	private String pt_code;
	private String u_id;
	private int pt_category;
	private String pt_categorycode;
	private int pt_point;
	private Date pt_date;
	
	public MyPointDTO() {
		// TODO Auto-generated constructor stub
	}

	public MyPointDTO(String pt_code, String u_id, int pt_category, String pt_categorycode, int pt_point,
			Date pt_date) {
		super();
		this.pt_code = pt_code;
		this.u_id = u_id;
		this.pt_category = pt_category;
		this.pt_categorycode = pt_categorycode;
		this.pt_point = pt_point;
		this.pt_date = pt_date;
	}

	public String getPt_code() {
		return pt_code;
	}

	public void setPt_code(String pt_code) {
		this.pt_code = pt_code;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getPt_category() {
		return pt_category;
	}

	public void setPt_category(int pt_category) {
		this.pt_category = pt_category;
	}

	public String getPt_categorycode() {
		return pt_categorycode;
	}

	public void setPt_categorycode(String pt_categorycode) {
		this.pt_categorycode = pt_categorycode;
	}

	public int getPt_point() {
		return pt_point;
	}

	public void setPt_point(int pt_point) {
		this.pt_point = pt_point;
	}

	public Date getPt_date() {
		return pt_date;
	}

	public void setPt_date(Date pt_date) {
		this.pt_date = pt_date;
	}
	
	
	
}
