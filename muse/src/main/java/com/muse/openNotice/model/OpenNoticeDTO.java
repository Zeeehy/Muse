package com.muse.openNotice.model;

public class OpenNoticeDTO {

	private String on_code;
	private String m_code;
	private int rs_code;
	private String on_type;
	private String on_open;
	private String on_muse_open;
	private String on_info;
	private String on_sale;
	private String on_content;
	private String on_casting;
	private String on_img;
	private String on_etc;
	private String on_readnum;
	private String on_viewstate;
	private String m_title;
	
	
	public OpenNoticeDTO() {
		super();
	}





	public OpenNoticeDTO(String on_code, String m_code, int rs_code, String on_type, String on_open,
			String on_muse_open, String on_info, String on_sale, String on_content, String on_casting, String on_img,
			String on_etc, String on_readnum, String on_viewstate, String m_title) {
		super();
		this.on_code = on_code;
		this.m_code = m_code;
		this.rs_code = rs_code;
		this.on_type = on_type;
		this.on_open = on_open;
		this.on_muse_open = on_muse_open;
		this.on_info = on_info;
		this.on_sale = on_sale;
		this.on_content = on_content;
		this.on_casting = on_casting;
		this.on_img = on_img;
		this.on_etc = on_etc;
		this.on_readnum = on_readnum;
		this.on_viewstate = on_viewstate;
		this.m_title = m_title;
	}





	public String getOn_code() {
		return on_code;
	}


	public void setOn_code(String on_code) {
		this.on_code = on_code;
	}


	public String getM_code() {
		return m_code;
	}


	public void setM_code(String m_code) {
		this.m_code = m_code;
	}


	public int getRs_code() {
		return rs_code;
	}


	public void setRs_code(int rs_code) {
		this.rs_code = rs_code;
	}


	public String getOn_type() {
		return on_type;
	}


	public void setOn_type(String on_type) {
		this.on_type = on_type;
	}


	public String getOn_open() {
		return on_open;
	}


	public void setOn_open(String on_open) {
		this.on_open = on_open;
	}


	public String getOn_muse_open() {
		return on_muse_open;
	}


	public void setOn_muse_open(String on_muse_open) {
		this.on_muse_open = on_muse_open;
	}


	public String getOn_info() {
		return on_info;
	}


	public void setOn_info(String on_info) {
		this.on_info = on_info;
	}


	public String getOn_sale() {
		return on_sale;
	}


	public void setOn_sale(String on_sale) {
		this.on_sale = on_sale;
	}


	public String getOn_content() {
		return on_content;
	}


	public void setOn_content(String on_content) {
		this.on_content = on_content;
	}


	public String getOn_casting() {
		return on_casting;
	}


	public void setOn_casting(String on_casting) {
		this.on_casting = on_casting;
	}


	public String getOn_img() {
		return on_img;
	}


	public void setOn_img(String on_img) {
		this.on_img = on_img;
	}


	public String getOn_etc() {
		return on_etc;
	}


	public void setOn_etc(String on_etc) {
		this.on_etc = on_etc;
	}


	public String getOn_readnum() {
		return on_readnum;
	}


	public void setOn_readnum(String on_readnum) {
		this.on_readnum = on_readnum;
	}


	public String getOn_viewstate() {
		return on_viewstate;
	}


	public void setOn_viewstate(String on_viewstate) {
		this.on_viewstate = on_viewstate;
	}

	

	public String getM_title() {
		return m_title;
	}


	public void setM_title(String m_title) {
		this.m_title = m_title;
	}


	@Override
	public String toString() {
		return "OpenNoticeDTO [on_code=" + on_code + ", m_code=" + m_code + ", rs_code=" + rs_code + ", on_type="
				+ on_type + ", on_open=" + on_open + ", on_muse_open=" + on_muse_open + ", on_info=" + on_info
				+ ", on_sale=" + on_sale + ", on_content=" + on_content + ", on_casting=" + on_casting + ", on_img="
				+ on_img + ", on_etc=" + on_etc + ", on_readnum=" + on_readnum + ", on_viewstate=" + on_viewstate
				+ ", m_title=" + m_title + "]";
	}


	
	
	
	
	
}
