package com.muse.seat.model;

public class SeatDTO {
    private int s_code; // 좌석 고유 코드
    private String sg_code; // 좌석 등급 코드
    private String m_code; // 뮤지컬 코드
    private int mhl_code; // 뮤지컬 홀 레이아웃 코드

    private int s_row; // 좌석 행
    private int s_position; // 좌석 위치
    private int s_floor;
    private String s_section;
    private String reservation_status;

    private double avg_score; //좌석 평균
    
	public SeatDTO() {
		super();
	}
	

	



	public SeatDTO(int s_code, String sg_code, String m_code, int mhl_code, int s_row, int s_position, int s_floor,
			String s_section, double avg_score) {
		super();
		this.s_code = s_code;
		this.sg_code = sg_code;
		this.m_code = m_code;
		this.mhl_code = mhl_code;
		this.s_row = s_row;
		this.s_position = s_position;
		this.s_floor = s_floor;
		this.s_section = s_section;
		this.avg_score = avg_score;
	}

	


	public SeatDTO(int s_code, String sg_code, String m_code, int mhl_code, int s_row, int s_position, int s_floor,
			String s_section, String reservation_status) {
		super();
		this.s_code = s_code;
		this.sg_code = sg_code;
		this.m_code = m_code;
		this.mhl_code = mhl_code;
		this.s_row = s_row;
		this.s_position = s_position;
		this.s_floor = s_floor;
		this.s_section = s_section;
		this.reservation_status = reservation_status;
	}


	public String getReservation_status() {
		return reservation_status;
	}


	public void setReservation_status(String reservation_status) {
		this.reservation_status = reservation_status;
	}





	public int getS_code() {
		return s_code;
	}
	public void setS_code(int s_code) {
		this.s_code = s_code;
	}
	public String getSg_code() {
		return sg_code;
	}
	public void setSg_code(String sg_code) {
		this.sg_code = sg_code;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public int getS_row() {
		return s_row;
	}
	public void setS_row(int s_row) {
		this.s_row = s_row;
	}
	public int getS_position() {
		return s_position;
	}
	public void setS_position(int s_position) {
		this.s_position = s_position;
	}
	public int getMhl_code() {
		return mhl_code;
	}
	public void setMhl_code(int mhl_code) {
		this.mhl_code = mhl_code;
	}
	
	public int getS_floor() {
		return s_floor;
	}



	public void setS_floor(int s_floor) {
		this.s_floor = s_floor;
	}



	public String getS_section() {
		return s_section;
	}



	public void setS_section(String s_section) {
		this.s_section = s_section;
	}

	
	

	public double getAvg_score() {
		return avg_score;
	}


	public void setAvg_score(double avg_score) {
		this.avg_score = avg_score;
	}


	@Override
	public String toString() {
		return "SeatDTO [s_code=" + s_code + ", sg_code=" + sg_code + ", m_code=" + m_code + ", mhl_code=" + mhl_code
				+ ", s_row=" + s_row + ", s_position=" + s_position + ", s_floor=" + s_floor + ", s_section="
				+ s_section + ", reservation_status=" + reservation_status + "]";
	}



	

    
    
}
