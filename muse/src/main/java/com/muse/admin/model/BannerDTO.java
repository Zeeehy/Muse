package com.muse.admin.model;

import java.sql.Date;

public class BannerDTO {
	
	private String b_code ; //����ڵ�, ��� ������� 1��
	private String m_code ; // ������ �ڵ�
	private Date b_date  ; // ��ʵ����
	
	//�߰������� dto�� �ʿ��� �÷�
	private String m_title;//�����̸�
	private String m_poster; //�����ͻ���
	private String pr_name; //���ۻ��
	
	
	
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
