package com.muse.myPage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MyPointDAOImpl implements MyPointDAO{
	
	@Autowired
    private SqlSessionTemplate sqlMap;
	
	public MyPointDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List<MyPointDTO> getPointList(String u_id) {
		List<MyPointDTO> pointList = sqlMap.selectList("selectMyPointList",u_id);
	    
		return pointList;
	}
	
	@Override
	public int getPointSum(String u_id) {
		int pointSum = sqlMap.selectOne("selectMyPointSum",u_id);
		return pointSum;
	}
	
	@Override
	public List<MyPointDTO> getPointDay(Map<String, Object> map) {
		List<MyPointDTO> pointList = sqlMap.selectList("selectPointDayList",map);
	    
		return pointList;
	}
	
	@Override
	public List<MyPointDTO> getPointMonth(Map<String, Object> map) {
		List<MyPointDTO> pointList = sqlMap.selectList("selectPointMonthList",map);
	    
		return pointList;
	}
	
	@Override
	public List<MyPointDTO> getPointAdd(Map<String, Object> map) {
		List<MyPointDTO> pointList = sqlMap.selectList("selectPointAddList",map);
	    
		return pointList;
	}
	
	@Override
	public List<MyPointDTO> getPointUse(Map<String, Object> map) {
		List<MyPointDTO> pointList = sqlMap.selectList("selectPointUseList",map);
	    
		return pointList;
	}
	
	@Override
	public String getPointDetail(int pt_code, String pt_categorycode) {
		String point_detail="";
		if(pt_code==1) {
			point_detail=sqlMap.selectOne("selectPointDetailBooking",pt_categorycode);
    	} else if(pt_code==2) {
    		point_detail=sqlMap.selectOne("selectPointDetailSeat",pt_categorycode);
    	} else if(pt_code==3) {
    		point_detail=sqlMap.selectOne("selectPointDetailMusical",pt_categorycode);
    	} else{
    		point_detail=sqlMap.selectOne("selectPointDetailRefund",pt_categorycode);
    	}
		
		return point_detail;
	}
}
