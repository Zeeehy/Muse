package com.muse.myPage.model;

import java.util.List;

public interface MyReviewListDAO {
	List<MySeatReviewDTO> getSeatReviewList(String u_id);
	List<MyMusicalReviewDTO> getMusicalReviewList(String u_id);
}
