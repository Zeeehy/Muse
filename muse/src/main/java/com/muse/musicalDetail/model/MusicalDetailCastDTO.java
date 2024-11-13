package com.muse.musicalDetail.model;

import java.sql.Date;

public class MusicalDetailCastDTO {

	private String ma_name;
	private String mc_char;
	private String ma_code;
	private String is_liked;
	private String ma_img;
	private String mo_code;
	private String m_code;
	private Date mo_date;
	private String mo_time;
	private String mc_code;
	
	
	public MusicalDetailCastDTO() {
		super();
	}
	public MusicalDetailCastDTO(String ma_name, String mc_char, String ma_code, String is_liked, String ma_img) {
		super();
		this.ma_name = ma_name;
		this.mc_char = mc_char;
		this.ma_code = ma_code;
		this.is_liked = is_liked;
		this.ma_img = ma_img;
	}
	
	
	
	
	public MusicalDetailCastDTO(String ma_name, String mc_char, String ma_code, String is_liked, String ma_img,
			String mo_code, String m_code, Date mo_date, String mo_time, String mc_code) {
		super();
		this.ma_name = ma_name;
		this.mc_char = mc_char;
		this.ma_code = ma_code;
		this.is_liked = is_liked;
		this.ma_img = ma_img;
		this.mo_code = mo_code;
		this.m_code = m_code;
		this.mo_date = mo_date;
		this.mo_time = mo_time;
		this.mc_code = mc_code;
	}
	
	
	public String getMo_code() {
		return mo_code;
	}
	public void setMo_code(String mo_code) {
		this.mo_code = mo_code;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public Date getMo_date() {
		return mo_date;
	}
	public void setMo_date(Date mo_date) {
		this.mo_date = mo_date;
	}
	public String getMo_time() {
		return mo_time;
	}
	public void setMo_time(String mo_time) {
		this.mo_time = mo_time;
	}
	public String getMc_code() {
		return mc_code;
	}
	public void setMc_code(String mc_code) {
		this.mc_code = mc_code;
	}
	public String getMa_name() {
		return ma_name;
	}
	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
	}
	public String getMc_char() {
		return mc_char;
	}
	public void setMc_char(String mc_char) {
		this.mc_char = mc_char;
	}
	public String getMa_code() {
		return ma_code;
	}
	public void setMa_code(String ma_code) {
		this.ma_code = ma_code;
	}
	public String getIs_liked() {
		return is_liked;
	}
	public void setIs_liked(String is_liked) {
		this.is_liked = is_liked;
	}
	public String getMa_img() {
		return ma_img;
	}
	public void setMa_img(String ma_img) {
		this.ma_img = ma_img;
	}
	@Override
	public String toString() {
		return "MusicalDetailCastDTO [ma_name=" + ma_name + ", mc_char=" + mc_char + ", ma_code=" + ma_code
				+ ", is_liked=" + is_liked + ", ma_img=" + ma_img + ", mo_code=" + mo_code + ", m_code=" + m_code
				+ ", mo_date=" + mo_date + ", mo_time=" + mo_time + ", mc_code=" + mc_code + "]";
	}
	
	
	
	
	
}
