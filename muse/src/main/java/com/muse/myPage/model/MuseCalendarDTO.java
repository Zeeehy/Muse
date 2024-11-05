package com.muse.myPage.model;

import java.sql.Date;

public class MuseCalendarDTO {
	private int calendar_No;
	private String calendar_Title;
	private String calendar_Memo;
	private Date calendar_Start;
	private Date calendar_End;
	
	public MuseCalendarDTO() {
		// TODO Auto-generated constructor stub
	}


	public MuseCalendarDTO(int calendar_No, String calendar_Title, String calendar_Memo, Date calendar_Start,
			Date calendar_End) {
		super();
		this.calendar_No = calendar_No;
		this.calendar_Title = calendar_Title;
		this.calendar_Memo = calendar_Memo;
		this.calendar_Start = calendar_Start;
		this.calendar_End = calendar_End;
	}

	public int getCalendar_No() {
		return calendar_No;
	}

	public void setCalendar_No(int calendar_No) {
		this.calendar_No = calendar_No;
	}

	public String getCalendar_Title() {
		return calendar_Title;
	}

	public void setCalendar_Title(String calendar_Title) {
		this.calendar_Title = calendar_Title;
	}

	public String getCalendar_Memo() {
		return calendar_Memo;
	}

	public void setCalendar_Memo(String calendar_Memo) {
		this.calendar_Memo = calendar_Memo;
	}

	public Date getCalendar_Start() {
		return calendar_Start;
	}

	public void setCalendar_Start(Date calendar_Start) {
		this.calendar_Start = calendar_Start;
	}

	public Date getCalendar_End() {
		return calendar_End;
	}

	public void setCalendar_End(Date calendar_End) {
		this.calendar_End = calendar_End;
	}
	
	
	
	
}
