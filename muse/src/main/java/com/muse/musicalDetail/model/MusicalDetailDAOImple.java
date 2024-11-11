package com.muse.musicalDetail.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class MusicalDetailDAOImple implements MusicalDetailDAO{
	
	private SqlSessionTemplate sqlMap;
	
	
	public MusicalDetailDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
    // 파라미터 맵을 생성하는 공통 메서드
    private Map<String, Object> createParams(String m_code, String u_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("m_code", m_code);
        params.put("u_id", u_id);
        return params;
    }
	
	@Override
	public MusicalDetailDTO getMusicalBasicInfo(String m_code) {
		
		return sqlMap.selectOne("getMusicalBasicInfo",m_code);
	}
	
	@Override
	public int checkLikeMusical(String m_code, String u_id) {
		
		Map<String,Object> params = createParams(m_code,u_id);

		return sqlMap.selectOne("checkLikeMusical",params);
	}
	
	@Override
	public int countLikeMusical(String m_code) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("countLikeMusical",m_code);
	}
	
	@Override
	public int insertLikeMusical(String m_code, String u_id) {
		Map<String,Object> params = createParams(m_code,u_id);
		
		return sqlMap.insert("insertLikeMusical", params);
	}
	
	@Override
	public int deleteLikeMusical(String m_code, String u_id) {
		Map<String,Object> params = createParams(m_code,u_id);
		
		return sqlMap.delete("deleteLikeMusical", params);
	}
	
	

}
