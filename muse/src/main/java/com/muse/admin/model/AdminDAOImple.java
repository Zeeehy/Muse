package com.muse.admin.model;

import org.mybatis.spring.SqlSessionTemplate;

public class AdminDAOImple implements AdminDAO {
	
	private SqlSessionTemplate sqlMap;

	public AdminDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public AdminDTO practice() {
		AdminDTO dto = sqlMap.selectOne("practice");
		return dto;
	}
	
	
}
