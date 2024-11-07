package com.muse.myPage.model;

import java.util.List;

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
}
