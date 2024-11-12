package com.muse.musicalDetail.model;

import java.sql.Date;

public class MusicalDetailDTO {

	private String m_code;            // M_CODE
    private String mh_code;           // MH_CODE
    private String pr_code;           // PR_CODE
    private String m_title;           // M_TITLE
    private Date m_startdate;         // M_STARTDATE
    private Date m_enddate;           // M_ENDDATE
    private int m_time;               // M_TIME
    private int m_intime;             // M_INTIME
    private int m_maxticket;          // M_MAXTICKET
    private String m_age;             // M_AGE
    private Date m_opendate;          // M_OPENDATE
    private int m_opentime;           // M_OPENTIME
    private String m_notice;          // M_NOTICE
    private String m_poster;          // M_POSTER
    private String m_detailimg;       // M_DETAILIMG
    private int m_calender;           // M_CALENDER
    private int m_single;             // M_SINGLE
    private int m_viewstate;          // M_VIEWSTATE
    private int m_ref;                // M_REF
    
	public MusicalDetailDTO() {
		super();
	}

	public MusicalDetailDTO(String m_code, String mh_code, String pr_code, String m_title, Date m_startdate,
			Date m_enddate, int m_time, int m_intime, int m_maxticket, String m_age, Date m_opendate, int m_opentime,
			String m_notice, String m_poster, String m_detailimg, int m_calender, int m_single, int m_viewstate,
			int m_ref) {
		super();
		this.m_code = m_code;
		this.mh_code = mh_code;
		this.pr_code = pr_code;
		this.m_title = m_title;
		this.m_startdate = m_startdate;
		this.m_enddate = m_enddate;
		this.m_time = m_time;
		this.m_intime = m_intime;
		this.m_maxticket = m_maxticket;
		this.m_age = m_age;
		this.m_opendate = m_opendate;
		this.m_opentime = m_opentime;
		this.m_notice = m_notice;
		this.m_poster = m_poster;
		this.m_detailimg = m_detailimg;
		this.m_calender = m_calender;
		this.m_single = m_single;
		this.m_viewstate = m_viewstate;
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

	public int getM_time() {
		return m_time;
	}

	public void setM_time(int m_time) {
		this.m_time = m_time;
	}

	public int getM_intime() {
		return m_intime;
	}

	public void setM_intime(int m_intime) {
		this.m_intime = m_intime;
	}

	public int getM_maxticket() {
		return m_maxticket;
	}

	public void setM_maxticket(int m_maxticket) {
		this.m_maxticket = m_maxticket;
	}

	public String getM_age() {
		return m_age;
	}

	public void setM_age(String m_age) {
		this.m_age = m_age;
	}

	public Date getM_opendate() {
		return m_opendate;
	}

	public void setM_opendate(Date m_opendate) {
		this.m_opendate = m_opendate;
	}

	public int getM_opentime() {
		return m_opentime;
	}

	public void setM_opentime(int m_opentime) {
		this.m_opentime = m_opentime;
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

	public String getM_detailimg() {
		return m_detailimg;
	}

	public void setM_detailimg(String m_detailimg) {
		this.m_detailimg = m_detailimg;
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

	public int getM_viewstate() {
		return m_viewstate;
	}

	public void setM_viewstate(int m_viewstate) {
		this.m_viewstate = m_viewstate;
	}

	public int getM_ref() {
		return m_ref;
	}

	public void setM_ref(int m_ref) {
		this.m_ref = m_ref;
	}

	@Override
	public String toString() {
		return "MusicalDetailDTO [m_code=" + m_code + ", mh_code=" + mh_code + ", pr_code=" + pr_code + ", m_title="
				+ m_title + ", m_startdate=" + m_startdate + ", m_enddate=" + m_enddate + ", m_time=" + m_time
				+ ", m_intime=" + m_intime + ", m_maxticket=" + m_maxticket + ", m_age=" + m_age + ", m_opendate="
				+ m_opendate + ", m_opentime=" + m_opentime + ", m_notice=" + m_notice + ", m_poster=" + m_poster
				+ ", m_detailimg=" + m_detailimg + ", m_calender=" + m_calender + ", m_single=" + m_single
				+ ", m_viewstate=" + m_viewstate + ", m_ref=" + m_ref + "]";
	}
    
    
	
	
}
