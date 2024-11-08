package com.muse.myPage.model;

import java.util.List;
import java.util.Map;

public interface MyBookingListDAO {
	List<MyBookingListDTO> getBookingList(String u_id);
	List<MyBookingListDTO> getBookingDay(String u_id, int day);
	List<MyBookingListDTO> getBookingMonth(String u_id, int month);
	List<MyBookingListDTO> getBookingReserve(Map<String, Object> map);
	List<MyBookingListDTO> getBookingPerform(String u_id, String bookingdate);
}
