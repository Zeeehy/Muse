package com.muse.myPage.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MuseCalendarDAOImpl implements MuseCalendarDAO {
	
	@Autowired
    private SqlSessionTemplate sqlMap;
	
	public MuseCalendarDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

}
