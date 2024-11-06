package com.muse.admin.model;

import java.sql.Date;

public class BannerDTO {
	
	private String b_code ; //배너코드, 등록 순서대로 1번
	private String m_code ; // 뮤지컬 코드
	private Date b_date  ; // 배너등록일
	
	//추가적으로 dto에 필요한 컬럼
	private String m_title;//공연이름
	private String m_poster; //포스터사진
	private String pr_name; //제작사명
	
	
	
	public BannerDTO() {
		super();
	}
	
	
	public String getB_code() {
		return b_code;
	}
	public void setB_code(String b_code) {
		this.b_code = b_code;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_poster() {
		return m_poster;
	}
	public void setM_poster(String m_poster) {
		this.m_poster = m_poster;
	}
	public String getPr_name() {
		return pr_name;
	}
	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}
	
	
	
	
}
