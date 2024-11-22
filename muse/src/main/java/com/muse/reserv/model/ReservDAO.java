package com.muse.reserv.model;

import java.util.List;
import java.util.Map;

import com.muse.partner.model.MusicalDTO;
import com.muse.seat.model.SeatDTO;
import com.muse.seat.model.SeatLayoutDTO;

public interface ReservDAO {
	
	Map<String,Object> getMusicalInfo(String mh_code);
	List<String> getMusicalDate(String m_code);
    List<String> getMusicalTimeByDate(String selectedDate,String m_code); 
    int getMusicalMaxTicket(String m_code);
    List<Map<String, Object>> getMusicalPrice(String m_code);
    
    // 좌석 가져오기
    public List<SeatLayoutDTO> seatLayoutSelect(int sl_bind, int mhl_code);
	public List<String> sectionSelect(int sl_bind, int mhl_code);
	public List<Integer> bindByallFloorSelect(int sl_bind, int mhl_code);
	public Map<Integer, Integer> max_rowSelect(int mhl_code);
	public List<SeatDTO> getRealSeat(String m_code);
	public List<SeatDTO> getRealSeatOnlyReserv(Map<String, Object> params);

	int getMhl_code(String mh_code);
	
	// 잔여석
    public Map<String, Integer> getRemainingSeat(Map<String, Object> params);
    
    // 예매된 좌석
    List<String> getBookedSeats(Map<String, Object> params);

    // 좌석리뷰
	double getMusicalSeatByHall(String s_code, String mh_code, String s_section, String s_row, String s_position, String s_floor);
	
	// 포인트 조회
	int getPoint(String s_id);
	
	// 포인트 사용
	int usePoint(String s_id, Map<String,Object> params);
	
	// 결제 후 포인트 사용 내역 인서트
	Map<String, Object> insertUsePoint(Map<String, Object> pointInfo);
	 
	// 세션으로 회원정보 가져오기
	Map<String,Object> getMemberInfo(String s_id);
	
	// 예매
	String insertBooking(Map<String, Object> params);
	
	// 예매상세를 위한 b_code
	String getBookingCode();
	
	// 예매상세
	int insertBookingDetail(Map<String, Object> params);
	
	String getOptionCode(Map<String, Object> params);
	
	Integer getSeatCodeForReserv(Map<String, Object>params);
}
