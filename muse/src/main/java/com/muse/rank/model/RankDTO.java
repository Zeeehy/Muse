package com.muse.rank.model;

import java.sql.Date;

public class RankDTO {
 
	private String m_code;
	private String m_poster;
	private String m_title;
	private String mh_name;
	private Date m_startdate;
	private Date m_enddate;
	private double booking_rate; 
    private int rank;
    
    public RankDTO() {
		super();
	}

	public RankDTO(String m_code, String m_poster, String m_title, String mh_name, Date m_startdate,
			Date m_enddate, double booking_rate, int rank) {
		super();
		this.m_code = m_code;
		this.m_poster = m_poster;
		this.m_title = m_title;
		this.mh_name = mh_name;
		this.m_startdate = m_startdate;
		this.m_enddate = m_enddate;
		this.booking_rate = booking_rate;
		this.rank = rank;
	}

	
	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
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

	public String getMh_name() {
		return mh_name;
	}

	public void setMh_name(String mh_name) {
		this.mh_name = mh_name;
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

	public double getBooking_rate() {
		return booking_rate;
	}

	public void setBooking_rate(double booking_rate) {
		this.booking_rate = booking_rate;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}
}
