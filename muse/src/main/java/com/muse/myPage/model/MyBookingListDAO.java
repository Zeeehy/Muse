package com.muse.myPage.model;

import java.util.List;
import java.util.Map;

public interface MyBookingListDAO {
	List<MyBookingListDTO> getBookingList(String u_id);
	List<MyBookingListDTO> getBookingDay(Map<String, Object> map);
	List<MyBookingListDTO> getBookingMonth(Map<String, Object> map);
	List<MyBookingListDTO> getBookingReserve(Map<String, Object> map);
	List<MyBookingListDTO> getBookingPerform(Map<String, Object> map);
	int getMusicalReviewCount(String b_code);
	int getMusicalReviewDateCheck(String b_code);
}
