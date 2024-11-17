package com.muse.review.model;

import java.sql.Date;

public class MusicalReviewDTO {
	
	private String mr_code ;//공연리뷰번호
	private String b_code ; //예매번호
	private double mr_score; //별점
	private String mr_title; //제목
	private String mr_content; //내용
	private Date mr_date; //작성일
	private String mr_state; //베스트리뷰선정유무

	// 예매번호로 가져와아햐는 데이터
	// 공연명,관람일시
	private String m_title; //공연명
	private String mo_date; //관람일시, mo_date _mo_time
	private String u_id; // 작성자
	
	
	
	public MusicalReviewDTO() {
		super();
	}
	
	
	
	public String getMr_code() {
		return mr_code;
	}
	public void setMr_code(String mr_code) {
		this.mr_code = mr_code;
	}
	public String getB_code() {
		return b_code;
	}
	public void setB_code(String b_code) {
		this.b_code = b_code;
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
	public String getMr_state() {
		return mr_state;
	}
	public void setMr_state(String mr_state) {
		this.mr_state = mr_state;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getMo_date() {
		return mo_date;
	}
	public void setMo_date(String mo_date) {
		this.mo_date = mo_date;
	}



	public String getU_id() {
		return u_id;
	}



	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
	
	
	
	
	
}
