package com.muse.myPage.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MPassDAOImpl implements MPassDAO{
	
	@Autowired
    private SqlSessionTemplate sqlMap;
	
	public MPassDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public MPassDTO getMPass(String u_id) {
		MPassDTO dto = sqlMap.selectOne("selectMPass", u_id);
		
		return dto;
	}
	
	@Override
	public int getMPassRemainDays(String u_id) {
		int mpRemainDays = sqlMap.selectOne("selectMPassRemainDays", u_id);
		
		return mpRemainDays;
	}
}
