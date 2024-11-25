package com.muse.myPage.model;

import java.util.List;
import java.util.Map;

public interface MyBookingDetailDAO {
	List<MyBookingDetailDTO> getLikeBookingDetailList(String b_code);
	MyBookingDetailDTO getBookingDetail(String bd_code);
	int getRefundRemainDate(String b_code);
	int getSeatReviewCount(String bd_code);
	String insertBookingRefund(String bd_code);
	int insertBookingRefundDetail(Map<String,Object> map);
	int updateBookingDetailState(String bd_code);
	int updateBookingState(String b_code);
	int getBookingStates(String b_code);
	String getRefundDate(String bd_code);
}
