package com.muse.review.model;

import java.util.List;

public interface ReviewDAO {

	List<SeatReviewDTO> srSearchResult(String searchTag,String searchWord);
	
	
	String getWriterId(String b_code);
	MusicalReviewDTO mrWrite(String b_code);
	int mrWriteEnd(MusicalReviewDTO dto);
}
