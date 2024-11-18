package com.muse.myPage.model;

import java.util.List;

public interface MyBookingDetailDAO {
	List<MyBookingDetailDTO> getLikeBookingDetailList(String b_code);
	int getRefundRemainDate(String b_code);
	int getSeatReviewCount(String bd_code);
}
