package com.muse.myPage.model;


import java.util.List;
import java.util.Map;

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
	
	@Override
	public int getRefundRemainDate(String b_code) {
		int refundRemainDate = sqlMap.selectOne("selectRefundRemainDate",b_code);
		return refundRemainDate;
	}
	
	@Override
	public int getSeatReviewCount(String bd_code) {
		int seatReviewCount = sqlMap.selectOne("selectSeatReviewCount",bd_code);
		return seatReviewCount;
	}
	
	@Override
	public MyBookingDetailDTO getBookingDetail(String bd_code) {
		MyBookingDetailDTO bookingDetail = sqlMap.selectOne("selectBookingDetail",bd_code);
	    
		return bookingDetail;
	}
	
	 @Override
	public String insertBookingRefund(String bd_code) {
		sqlMap.insert("insertBookingRefund",bd_code);
		String r_code=sqlMap.selectOne("selectRefundRCode", bd_code);
		return r_code;
	}
	 
	@Override
	public int insertBookingRefundDetail(Map<String, Object> map) {
		int result = sqlMap.insert("insertBookingRefundDetail",map);
		
		return result;
	}
	
	@Override
	public int updateBookingDetailState(String bd_code) {
		int result = sqlMap.update("updateBookingDetailState",bd_code);
		
		return result;
	}
	
	@Override
	public int updateBookingState(String b_code) {
		int result = sqlMap.update("updateBookingState",b_code);
		
		return result;
	}
	
	@Override
	public int getBookingStates(String b_code) {
		List<Integer> bookingStates=sqlMap.selectList("selectBookingStates",b_code);
		if (bookingStates.contains(1)) {
		    return 1;
		}
		return 0;
	}
	
	@Override
	public String getRefundDate(String bd_code) {
		String refundDate=sqlMap.selectOne("selectRefundDate",bd_code);
		return null;
	}
}
