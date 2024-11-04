package com.muse.admin.model;

import org.mybatis.spring.SqlSessionTemplate;

public class AdminDAOImple implements AdminDAO {
	
	private SqlSessionTemplate sqlMap;

	public AdminDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	
	
}
