package com.muse.review.model;

public interface ReviewDAO {

	String getWriterId(String b_code);
	MusicalReviewDTO mrWrite(String b_code);
	int mrWriteEnd(MusicalReviewDTO dto);
}
