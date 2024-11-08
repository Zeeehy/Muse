package com.muse.myPage.model;

import java.util.HashMap;
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
	public List<MyBookingListDTO> getBookingDay(String u_id, int day) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<MyBookingListDTO> getBookingMonth(String u_id, int month) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<MyBookingListDTO> getBookingReserve(Map<String, Object> map) {
		List<MyBookingListDTO> bookingList = sqlMap.selectList("selectBookingReserveList",map);
	    
		return bookingList;
	}
	
	@Override
	public List<MyBookingListDTO> getBookingPerform(String u_id, String bookingdate) {
		// TODO Auto-generated method stub
		return null;
	}
}
