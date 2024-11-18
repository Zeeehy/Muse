package com.muse.myPage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MyBookingListDAOImpl implements MyBookingListDAO{
	
	@Autowired
    private SqlSessionTemplate sqlMap;
	
	public MyBookingListDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List<MyBookingListDTO> getBookingList(String u_id) {
		List<MyBookingListDTO> bookingList = sqlMap.selectList("selectBookingList",u_id);
	    
		return bookingList;
	}
	
	@Override
	public List<MyBookingListDTO> getBookingDay(Map<String, Object> map) {
		List<MyBookingListDTO> bookingList = sqlMap.selectList("selectBookingDayList",map);
	    
		return bookingList;
	}
	
	@Override
	public List<MyBookingListDTO> getBookingMonth(Map<String, Object> map) {
		List<MyBookingListDTO> bookingList = sqlMap.selectList("selectBookingMonthList",map);
	    
		return bookingList;	
	}
	
	@Override
	public List<MyBookingListDTO> getBookingReserve(Map<String, Object> map) {
		List<MyBookingListDTO> bookingList = sqlMap.selectList("selectBookingReserveList",map);
	    
		return bookingList;
	}
	
	@Override
	public List<MyBookingListDTO> getBookingPerform(Map<String, Object> map) {
		List<MyBookingListDTO> bookingList = sqlMap.selectList("selectBookingPerformList",map);
	    
		return bookingList;
	
	}
	
	@Override
	public int getMusicalReviewDateCheck(String b_code) {
		int musicalReviewDateCheck = sqlMap.selectOne("selectMusicalReviewDateCheck",b_code);
		return musicalReviewDateCheck;
	}
	
	@Override
	public int getMusicalReviewCount(String b_code) {
		int musicalReviewCount = sqlMap.selectOne("selectMusicalReviewCount",b_code);
		return musicalReviewCount;
	}
}
