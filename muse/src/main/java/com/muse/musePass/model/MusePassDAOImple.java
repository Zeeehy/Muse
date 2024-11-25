package com.muse.musePass.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MusePassDAOImple implements MusePassDAO {

	
	@Autowired
    private SqlSessionTemplate sqlMap;
	
	public MusePassDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
	@Override
	public int insertMusePass(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return sqlMap.insert("insertMusePass",paramMap);
	}
	
	@Override
	public int updateMusePassOn(String u_id) {
		// TODO Auto-generated method stub
		return sqlMap.update("updateMusePassOn",u_id);
	}
	
	@Override
	public int checkPassJoin(String u_id) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("checkPassJoin",u_id);
	}
	@Override
	public int updateMPassRange(String u_id) {
		// TODO Auto-generated method stub
		return sqlMap.update("updateMPassRange",u_id);
	}
	
	@Override
	public int insertPassPoint(String u_id) {
		return sqlMap.insert("insertPassPoint",u_id);
		
	}
}
