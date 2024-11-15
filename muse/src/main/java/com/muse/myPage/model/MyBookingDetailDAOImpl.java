package com.muse.myPage.model;


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
	public MyBookingDetailDTO getLikeBookingDetail(String b_code) {
		MyBookingDetailDTO bookingDetail = sqlMap.selectOne("selectMyBookingDetail",b_code);
	    
		return bookingDetail;
	}
}
