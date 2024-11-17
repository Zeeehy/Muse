package com.muse.admin.model;

import java.sql.Date;

public class RequestListDTO {

	private String bdr_code; 
	private String pr_code; //파트너코드
	private String mr_code; //뮤지컬리뷰코드
	private String bdr_reason; //삭제요청사유
	private double mr_score; //리뷰평점
	private String mr_title; //리뷰제목
	private String mr_content; //리뷰내용
	private Date mr_date; //리뷰작성날짜
	private String m_title; //뮤지컬이름
	private String u_id; //작성자이름
	private String pr_name; //파트너명
	
	
	
	public RequestListDTO() {
		super();
	}
	
	
	
	public String getBdr_code() {
		return bdr_code;
	}
	public void setBdr_code(String bdr_code) {
		this.bdr_code = bdr_code;
	}
	public String getPr_code() {
		return pr_code;
	}
	public void setPr_code(String pr_code) {
		this.pr_code = pr_code;
	}
	public String getMr_code() {
		return mr_code;
	}
	public void setMr_code(String mr_code) {
		this.mr_code = mr_code;
	}
	public String getBdr_reason() {
		return bdr_reason;
	}
	public void setBdr_reason(String bdr_reason) {
		this.bdr_reason = bdr_reason;
	}
	public double getMr_score() {
		return mr_score;
	}
	public void setMr_score(double mr_score) {
		this.mr_score = mr_score;
	}
	public String getMr_title() {
		return mr_title;
	}
	public void setMr_title(String mr_title) {
		this.mr_title = mr_title;
	}
	public String getMr_content() {
		return mr_content;
	}
	public void setMr_content(String mr_content) {
		this.mr_content = mr_content;
	}
	public Date getMr_date() {
		return mr_date;
	}
	public void setMr_date(Date mr_date) {
		this.mr_date = mr_date;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getPr_name() {
		return pr_name;
	}
	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}
	
	
	
	
	
}
