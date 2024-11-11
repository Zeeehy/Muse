package com.muse.reserv.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.muse.partner.model.MusicalDTO;

public class ReservDAOImple implements ReservDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public ReservDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public Map<String, Object> getMusicalInfo() {
		Map<String,Object> musicalInfo = sqlMap.selectOne("getMusicalInfo");
		return musicalInfo;
	}
	
	@Override
	public List<String> getMusicalDate() {
		List<String> playDate = sqlMap.selectList("getMusicalDate");
		return playDate;
	}
	
	@Override
	public List<String> getMusicalTimeByDate(String selectedDate) {
	    return sqlMap.selectList("getMusicalTimeByDate", selectedDate);
	}

}
