package com.muse.partner.model;

public class SeatGradeDTO {

	private String sg_code;
	private String sg_name;
	
	public SeatGradeDTO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public SeatGradeDTO(String sg_code, String sg_name) {
		super();
		this.sg_code = sg_code;
		this.sg_name = sg_name;
	}



	public String getSg_code() {
		return sg_code;
	}

	public void setSg_code(String sg_code) {
		this.sg_code = sg_code;
	}

	public String getSg_name() {
		return sg_name;
	}

	public void setSg_name(String sg_name) {
		this.sg_name = sg_name;
	}
	
}
