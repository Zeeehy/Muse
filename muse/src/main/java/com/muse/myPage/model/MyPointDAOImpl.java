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
}
