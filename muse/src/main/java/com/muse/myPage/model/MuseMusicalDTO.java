package com.muse.myPage.model;

public class MuseMusicalDTO {
	private String m_code;
	private String m_title;
	private String m_poster;
	private String on_open;
	private String on_muse_open;
	
	public MuseMusicalDTO() {
		// TODO Auto-generated constructor stub
	}

	public MuseMusicalDTO(String m_code, String m_title, String m_poster, String on_open, String on_muse_open) {
		super();
		this.m_code = m_code;
		this.m_title = m_title;
		this.m_poster = m_poster;
		this.on_open = on_open;
		this.on_muse_open = on_muse_open;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
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
	
	
}
