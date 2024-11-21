package com.muse.myPage.model;

public class MySeatReviewDTO {
	private String sr_code;
	private String bd_code;
	private double sr_score;
	private String sr_content;
	private String sr_date;
	private String s_section;
	private int s_position;
	private int s_row;
	private int s_floor;
	private String mh_name;
	private String mh_addr;
	
	public MySeatReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public MySeatReviewDTO(String sr_code, String bd_code, double sr_score, String sr_content, String sr_date,
			String s_section, int s_position, int s_row, int s_floor, String mh_name, String mh_addr) {
		super();
		this.sr_code = sr_code;
		this.bd_code = bd_code;
		this.sr_score = sr_score;
		this.sr_content = sr_content;
		this.sr_date = sr_date;
		this.s_section = s_section;
		this.s_position = s_position;
		this.s_row = s_row;
		this.s_floor = s_floor;
		this.mh_name = mh_name;
		this.mh_addr = mh_addr;
	}

	public String getSr_code() {
		return sr_code;
	}

	public void setSr_code(String sr_code) {
		this.sr_code = sr_code;
	}

	public String getBd_code() {
		return bd_code;
	}

	public void setBd_code(String bd_code) {
		this.bd_code = bd_code;
	}

	public double getSr_score() {
		return sr_score;
	}

	public void setSr_score(double sr_score) {
		this.sr_score = sr_score;
	}

	public String getSr_content() {
		return sr_content;
	}

	public void setSr_content(String sr_content) {
		this.sr_content = sr_content;
	}

	public String getSr_date() {
		return sr_date;
	}

	public void setSr_date(String sr_date) {
		this.sr_date = sr_date;
	}

	public String getS_section() {
		return s_section;
	}

	public void setS_section(String s_section) {
		this.s_section = s_section;
	}

	public int getS_position() {
		return s_position;
	}

	public void setS_position(int s_position) {
		this.s_position = s_position;
	}

	public int getS_row() {
		return s_row;
	}

	public void setS_row(int s_row) {
		this.s_row = s_row;
	}

	public int getS_floor() {
		return s_floor;
	}

	public void setS_floor(int s_floor) {
		this.s_floor = s_floor;
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
	
	
}
