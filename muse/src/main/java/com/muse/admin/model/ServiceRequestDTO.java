package com.muse.admin.model;

import java.sql.Date;

public class ServiceRequestDTO {
	private String sr_code;//뮤지컬요청관리코드
	private int rt_code;//요청종류코드  (0:신규등록, 1:수정, 2:삭제, 3:연장)
	private int rs_code; //요청상태코드 (0:대기,1:승인,2:거절)
	private String  m_code;// 뮤지컬 코드
	private Date rs_date; //요청날짜
	private String rs_etc; //기타전달사항
	private String rs_reason; //거절시 사용하는 거절사유컬럼	
	
	
	//add 일때 필요한 것
	private String m_title;
	private String pr_name;
	private Date m_startdate;
	private Date m_enddate;
	private int m_single;
	private Date m_opendate;

	
	
	public ServiceRequestDTO() {
		super();
	}


	public String getSr_code() {
		return sr_code;
	}


	public void setSr_code(String sr_code) {
		this.sr_code = sr_code;
	}


	public int getRt_code() {
		return rt_code;
	}


	public void setRt_code(int rt_code) {
		this.rt_code = rt_code;
	}


	public int getRs_code() {
		return rs_code;
	}


	public void setRs_code(int rs_code) {
		this.rs_code = rs_code;
	}


	public String getM_code() {
		return m_code;
	}


	public void setM_code(String m_code) {
		this.m_code = m_code;
	}


	public Date getRs_date() {
		return rs_date;
	}


	public void setRs_date(Date rs_date) {
		this.rs_date = rs_date;
	}


	public String getRs_etc() {
		return rs_etc;
	}


	public void setRs_etc(String rs_etc) {
		this.rs_etc = rs_etc;
	}


	public String getRs_reason() {
		return rs_reason;
	}


	public void setRs_reason(String rs_reason) {
		this.rs_reason = rs_reason;
	}


	public String getM_title() {
		return m_title;
	}


	public void setM_title(String m_title) {
		this.m_title = m_title;
	}


	public String getPr_name() {
		return pr_name;
	}


	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
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


	public int getM_single() {
		return m_single;
	}


	public void setM_single(int m_single) {
		this.m_single = m_single;
	}


	public Date getM_opendate() {
		return m_opendate;
	}


	public void setM_opendate(Date m_opendate) {
		this.m_opendate = m_opendate;
	}
	
	
	
	

}
