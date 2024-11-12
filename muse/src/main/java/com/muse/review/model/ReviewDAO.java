package com.muse.review.model;

import java.util.List;

public interface ReviewDAO {

	List<SeatReviewDTO> srSearchResult(String searchTag,String searchWord);
	
	String getWriterId(String b_code);
	MusicalReviewDTO mrWrite(String b_code);
	int mrWriteEnd(MusicalReviewDTO dto);
	int getMr_code();
	int addPoint(String s_id,String mr_code,int point);
	
	int srWriteEnd(SeatReviewDTO dto);
	int getSr_code();
	
	String getWriterIdByBdCode(String bd_code);
	SeatReviewDTO srWrite(String bd_code);
}
