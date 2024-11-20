package com.muse.admin.model;

public class StatsDTO {

	
	private String m_title;
	private String m_code;
	
	private String pr_code;
	private String pr_name;
	
	private int count; // sum 한 숫자
	
	
	
	public StatsDTO() {
		super();
	}



	public String getM_title() {
		return m_title;
	}



	public void setM_title(String m_title) {
		this.m_title = m_title;
	}



	public String getM_code() {
		return m_code;
	}



	public void setM_code(String m_code) {
		this.m_code = m_code;
	}



	public String getPr_code() {
		return pr_code;
	}



	public void setPr_code(String pr_code) {
		this.pr_code = pr_code;
	}



	public String getPr_name() {
		return pr_name;
	}



	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}
		
	
	
	
}
