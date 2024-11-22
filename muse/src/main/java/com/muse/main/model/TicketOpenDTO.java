package com.muse.main.model;


public class TicketOpenDTO  {
	
	private String m_poster;
	private String m_title;
	private String on_code;
	private String on_open;
	private String on_muse_open;
	private String on_type;
	
	
	public TicketOpenDTO() {
		super();
	}
	
	public TicketOpenDTO(String m_poster, String m_title, String on_open, String on_muse_open, String on_code) {
		super();
		this.m_poster = m_poster;
		this.m_title = m_title;
		this.on_open = on_open;
		this.on_muse_open = on_muse_open;
		this.on_code = on_code;
	}

	public TicketOpenDTO(String m_poster, String m_title, String on_open, String on_muse_open, String on_type,
			String on_code) {
		super();
		this.m_poster = m_poster;
		this.m_title = m_title;
		this.on_open = on_open;
		this.on_muse_open = on_muse_open;
		this.on_type = on_type;
		this.on_code = on_code;
	}

	public String getM_poster() {
		return m_poster;
	}

	public void setM_poster(String m_poster) {
		this.m_poster = m_poster;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
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

	public String getOn_type() {
		return on_type;
	}

	public void setOn_type(String on_type) {
		this.on_type = on_type;
	}

	public String getOn_code() {
		return on_code;
	}

	public void setOn_code(String on_code) {
		this.on_code = on_code;
	}	

}
