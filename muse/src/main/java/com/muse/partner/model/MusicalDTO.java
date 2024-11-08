package com.muse.partner.model;

import oracle.sql.DATE;

public class MusicalDTO {

	private String m_code;
	private String mh_code;
	private String pr_code;
	private String m_title;
	private DATE m_startDate;
	private DATE m_endDate;
	private int m_time;
	private int m_inTime;
	private int m_maxTicet;
	private String m_age;
	private DATE m_openDate;
	private int m_openTime;
	private String m_notice;
	private String m_poster;
	private String m_detailImg;
	private int m_calender;
	private int m_single;
	private int m_viewState;
	private int m_ref;

	public MusicalDTO(String m_code, String mh_code, String pr_code, String m_title, DATE m_startDate, DATE m_endDate,
			int m_time, int m_inTime, int m_maxTicet, String m_age, DATE m_openDate, int m_openTime, String m_notice,
			String m_poster, String m_detailImg, int m_calender, int m_single, int m_viewState, int m_ref) {
		super();
		this.m_code = m_code;
		this.mh_code = mh_code;
		this.pr_code = pr_code;
		this.m_title = m_title;
		this.m_startDate = m_startDate;
		this.m_endDate = m_endDate;
		this.m_time = m_time;
		this.m_inTime = m_inTime;
		this.m_maxTicet = m_maxTicet;
		this.m_age = m_age;
		this.m_openDate = m_openDate;
		this.m_openTime = m_openTime;
		this.m_notice = m_notice;
		this.m_poster = m_poster;
		this.m_detailImg = m_detailImg;
		this.m_calender = m_calender;
		this.m_single = m_single;
		this.m_viewState = m_viewState;
		this.m_ref = m_ref;
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

	public String getPr_code() {
		return pr_code;
	}

	public void setPr_code(String pr_code) {
		this.pr_code = pr_code;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public DATE getM_startDate() {
		return m_startDate;
	}

	public void setM_startDate(DATE m_startDate) {
		this.m_startDate = m_startDate;
	}

	public DATE getM_endDate() {
		return m_endDate;
	}

	public void setM_endDate(DATE m_endDate) {
		this.m_endDate = m_endDate;
	}

	public int getM_time() {
		return m_time;
	}

	public void setM_time(int m_time) {
		this.m_time = m_time;
	}

	public int getM_inTime() {
		return m_inTime;
	}

	public void setM_inTime(int m_inTime) {
		this.m_inTime = m_inTime;
	}

	public int getM_maxTicet() {
		return m_maxTicet;
	}

	public void setM_maxTicet(int m_maxTicet) {
		this.m_maxTicet = m_maxTicet;
	}

	public String getM_age() {
		return m_age;
	}

	public void setM_age(String m_age) {
		this.m_age = m_age;
	}

	public DATE getM_openDate() {
		return m_openDate;
	}

	public void setM_openDate(DATE m_openDate) {
		this.m_openDate = m_openDate;
	}

	public int getM_openTime() {
		return m_openTime;
	}

	public void setM_openTime(int m_openTime) {
		this.m_openTime = m_openTime;
	}

	public String getM_notice() {
		return m_notice;
	}

	public void setM_notice(String m_notice) {
		this.m_notice = m_notice;
	}

	public String getM_poster() {
		return m_poster;
	}

	public void setM_poster(String m_poster) {
		this.m_poster = m_poster;
	}

	public String getM_detailImg() {
		return m_detailImg;
	}

	public void setM_detailImg(String m_detailImg) {
		this.m_detailImg = m_detailImg;
	}

	public int getM_calender() {
		return m_calender;
	}

	public void setM_calender(int m_calender) {
		this.m_calender = m_calender;
	}

	public int getM_single() {
		return m_single;
	}

	public void setM_single(int m_single) {
		this.m_single = m_single;
	}

	public int getM_viewState() {
		return m_viewState;
	}

	public void setM_viewState(int m_viewState) {
		this.m_viewState = m_viewState;
	}

	public int getM_ref() {
		return m_ref;
	}

	public void setM_ref(int m_ref) {
		this.m_ref = m_ref;
	}

	public MusicalDTO() {
		// TODO Auto-generated constructor stub
	}

}
