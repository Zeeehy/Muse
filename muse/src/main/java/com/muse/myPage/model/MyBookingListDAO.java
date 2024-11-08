package com.muse.myPage.model;

import java.util.List;

public interface MyBookingListDAO {
	List<MyBookingListDTO> getBookingList(String u_id);
}
