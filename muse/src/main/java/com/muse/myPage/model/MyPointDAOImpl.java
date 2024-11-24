package com.muse.myPage.model;

import java.util.List;

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
}
