package com.muse.myPage.model;

import java.sql.Date;

public class MuseCalendarDTO {
	private String calendar_title;
	private Date calendar_start;
	private Date calendar_end;
	private String calendar_color;
	
	public MuseCalendarDTO() {
		// TODO Auto-generated constructor stub
	}

	public MuseCalendarDTO(String calendar_title, Date calendar_start, Date calendar_end, String calendar_color) {
		super();
		this.calendar_title = calendar_title;
		this.calendar_start = calendar_start;
		this.calendar_end = calendar_end;
		this.calendar_color = calendar_color;
	}

	public String getCalendar_title() {
		return calendar_title;
	}

	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}

	public Date getCalendar_start() {
		return calendar_start;
	}

	public void setCalendar_start(Date calendar_start) {
		this.calendar_start = calendar_start;
	}

	public Date getCalendar_end() {
		return calendar_end;
	}

	public void setCalendar_end(Date calendar_end) {
		this.calendar_end = calendar_end;
	}

	public String getCalendar_color() {
		return calendar_color;
	}

	public void setCalendar_color(String calendar_color) {
		this.calendar_color = calendar_color;
	}
	
	
}
