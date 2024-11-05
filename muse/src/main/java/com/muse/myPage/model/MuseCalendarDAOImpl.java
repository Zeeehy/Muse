package com.muse.myPage.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MuseCalendarDAOImpl implements MuseCalendarDAO {
	
	@Autowired
    private SqlSessionTemplate sqlMap;
	
	public MuseCalendarDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List<MuseCalendarDTO> getCalendar() {
		List<MuseCalendarDTO> calendar = sqlMap.selectList("calendarList");
	    
		return calendar;
	}

}
