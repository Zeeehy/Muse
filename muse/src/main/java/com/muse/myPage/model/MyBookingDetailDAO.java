package com.muse.myPage.model;

import java.util.List;

public interface MyBookingDetailDAO {
	List<MyBookingDetailDTO> getLikeBookingDetailList(String b_code);
}
