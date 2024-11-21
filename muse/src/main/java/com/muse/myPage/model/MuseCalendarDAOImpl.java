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
	public List<MuseCalendarDTO> getCalendarActorCast(String u_id) {
		List<MuseCalendarDTO> calendarActorCast =sqlMap.selectList("selectCalendarActorList",u_id);
		return calendarActorCast;
	}

	@Override
	public List<MuseCalendarDTO> getCalendarBooking(String u_id) {
		List<MuseCalendarDTO> calendarBooking =sqlMap.selectList("selectCalendarBookingList",u_id);
		return calendarBooking;
	}
}
