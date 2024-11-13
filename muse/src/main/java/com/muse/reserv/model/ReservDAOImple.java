package com.muse.reserv.model;

import java.util.HashMap;
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
	public Map<String, Object> getMusicalInfo(String mh_code) {
		Map<String,Object> musicalInfo = sqlMap.selectOne("getMusicalInfo",mh_code);
		return musicalInfo;
	}
	
	@Override
	public List<String> getMusicalDate(String mh_code) {
		List<String> playDate = sqlMap.selectList("getMusicalDate",mh_code);
		return playDate;
	}
	
	@Override
	public List<String> getMusicalTimeByDate(String selectedDate, String mh_code) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("selectedDate", selectedDate);
	    params.put("mh_code", mh_code);
	    return sqlMap.selectList("getMusicalTimeByDate", params);
	}

	 @Override public int getMusicalMaxTicket(String mh_code) { 
		 return sqlMap.selectOne("getMusicalMaxTicket", mh_code); 
	 }
	 
	 @Override
	public List<Map<String, Object>> getMusicalSeatList() {
		 return sqlMap.selectList("getMusicalSeatList");
	}


}
