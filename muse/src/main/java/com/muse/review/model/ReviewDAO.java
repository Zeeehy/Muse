package com.muse.review.model;

import java.util.List;
import java.util.Map;

import com.muse.seat.model.SeatDTO;
import com.muse.seat.model.SeatLayoutDTO;

public interface ReviewDAO {

	List<SeatReviewDTO> srSearchResult(String searchTag,String searchWord);
	
	String getWriterId(String b_code);
	MusicalReviewDTO mrWrite(String b_code);
	int mrWriteEnd(MusicalReviewDTO dto);
	int getMr_code();
	int addPoint(String s_id,String mr_code,int point);
	
	int srWriteEnd(SeatReviewDTO dto);
	int getSr_code();
	
	String getWriterIdByBdCode(String bd_code);
	SeatReviewDTO srWrite(String bd_code);
	
	String getMh_name(String mh_code);
	String getM_name(String m_code);
	
	
	
	//좌석
	public List<SeatLayoutDTO> seatLayoutSelect(int sl_bind, int mhl_code);
	public List<String> sectionSelect(int sl_bind, int mhl_code);
	public List<Integer> bindByallFloorSelect(int sl_bind, int mhl_code);
	public Map<Integer, Integer> max_rowSelect(int mhl_code);
	public List<SeatDTO> getRealSeat(String m_code);
	int getMhl_code(String mh_code);
	
	List<SeatReviewDTO> srShowListByHall(String s_section,int s_row,int s_floor, int s_position, String mh_code);
	List<SeatReviewDTO> srShowListByM( String s_section,int s_row,int s_floor, int s_position, String mh_code,String m_code);
	double srShowAvgByHall(String s_section,int s_row,int s_floor, int s_position, String mh_code);
	double srShowAvgByM(String s_section,int s_row,int s_floor, int s_position, String mh_code,String m_code);
	
	public List<SeatDTO> getRealSeatByHall(String mh_code);
	public List<SeatDTO> getRealSeatByM(String m_code);
}

