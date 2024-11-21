package com.muse.myPage.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MyReviewListDAOImpl implements MyReviewListDAO{

	@Autowired
    private SqlSessionTemplate sqlMap;
	
	public MyReviewListDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List<MyMusicalReviewDTO> getMusicalReviewList(String u_id) {
		List<MyMusicalReviewDTO> musicalReview = sqlMap.selectList("selectMusicalReviewList",u_id);
	    
		return musicalReview;
	}
	
	@Override
	public List<MySeatReviewDTO> getSeatReviewList(String u_id) {
		List<MySeatReviewDTO> seatReview = sqlMap.selectList("selectSeatReviewList",u_id);
	    
		return seatReview;
	}
}
