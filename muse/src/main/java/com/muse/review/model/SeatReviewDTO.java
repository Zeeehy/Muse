package com.muse.review.model;

import java.sql.Date;

public class SeatReviewDTO {

	//검색
	private String mh_name; // 공연장이름
	private String m_title ; // 공연명
	
	//공연명 검색이면 공연명, 기간, 장소
	private Date m_startdate;
	private Date m_enddate;
	private String m_poster;
	private String m_code;
	
	//공연장이름 검색이면 공연장이름만
	private String mh_code;
	
	   
	//insert 용
	private String sr_code; //좌석리뷰코드
	private String bd_code; //예매상세코드
	private double sr_score;//별점
	private String sr_content; //상세내용
	private Date sr_date; //작성일
	
	
	private int s_floor; //층
	private String s_section; //구역
	private int s_row; //열
	private int s_position; //번호
	
	private String sr_seat; // 좌석 한줄로 연결

	public SeatReviewDTO() {
		super();
	}

	public String getMh_name() {
		return mh_name;
	}

	public void setMh_name(String mh_name) {
		this.mh_name = mh_name;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public Date getM_startdate() {
		return m_startdate;
	}

	public void setM_startdate(Date m_startdate) {
		this.m_startdate = m_startdate;
	}

	public Date getM_enddate() {
		return m_enddate;
	}

	public void setM_enddate(Date m_enddate) {
		this.m_enddate = m_enddate;
	}

	public String getM_poster() {
		return m_poster;
	}

	public void setM_poster(String m_poster) {
		this.m_poster = m_poster;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public String getMh_code() {
		return mh_code;
	}

	public void setMh_code(String mh_code) {
		this.mh_code = mh_code;
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

	public Date getSr_date() {
		return sr_date;
	}

	public void setSr_date(Date sr_date) {
		this.sr_date = sr_date;
	}

	public int getS_floor() {
		return s_floor;
	}

	public void setS_floor(int s_floor) {
		this.s_floor = s_floor;
	}

	public String getS_section() {
		return s_section;
	}

	public void setS_section(String s_section) {
		this.s_section = s_section;
	}

	public int getS_row() {
		return s_row;
	}

	public void setS_row(int s_row) {
		this.s_row = s_row;
	}

	public int getS_position() {
		return s_position;
	}

	public void setS_position(int s_position) {
		this.s_position = s_position;
	}

	public String getSr_seat() {
		return sr_seat;
	}

	public void setSr_seat(String sr_seat) {
		this.sr_seat = sr_seat;
	}

	
	
}
