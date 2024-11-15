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

    
}
