package com.muse.myPage.model;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MyBookingDetailDAOImpl implements MyBookingDetailDAO{
	@Autowired
    private SqlSessionTemplate sqlMap;
	
	public MyBookingDetailDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List<MyBookingDetailDTO> getLikeBookingDetailList(String b_code) {
		List<MyBookingDetailDTO> bookingDetail = sqlMap.selectList("selectMyBookingDetailList",b_code);
	    
		return bookingDetail;
	}
}
