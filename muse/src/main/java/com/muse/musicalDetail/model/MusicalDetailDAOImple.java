package com.muse.musicalDetail.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.muse.admin.model.PartnerDTO;
import com.muse.openNotice.model.OpenNoticeDTO;
import com.muse.partner.model.MusicalHallDTO;
import com.muse.partner.model.MusicalOptionDTO;
import com.muse.review.model.MusicalReviewDTO;

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
	
	@Override
	public List<MusicalDetailCastDTO> getCastingWithLike(String m_code, String u_id) {
		Map<String,Object> params = createParams(m_code,u_id);
		
		return sqlMap.selectList("getCastingWithLike", params);
	}
	
	@Override
	public int insertLikeActor(String ma_code, String u_id) {
		 Map<String, Object> params = new HashMap<>();
	        params.put("ma_code", ma_code);
	        params.put("u_id", u_id); 
	        
		return sqlMap.insert("insertLikeActor",params);
	}
	
	@Override
	public int deleteLikeActor(String ma_code, String u_id) {
		 Map<String, Object> params = new HashMap<>();
	        params.put("ma_code", ma_code);
	        params.put("u_id", u_id); 
	        
		return sqlMap.delete("deleteLikeActor",params);
	}
	
	@Override
	public List<Date> getScreenDay(String m_code) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getScreenDay",m_code);
	}
	
	@Override
	public List<String> getStartTime(String m_code) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getStartTime",m_code);
	}
	
	@Override
	public List<String> getAllChar(String m_code) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getAllChar",m_code);
	}

	@Override
	public List<MusicalDetailCastDTO> getRoundActor(Map paramMap) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getRoundActor",paramMap);
	}
	
	@Override
	public List<Date> getRoundDOW(Map paramMap) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getRoundDOW",paramMap);
	}
	
	@Override
	public int countMusicalReview(String m_code) {
		return sqlMap.selectOne("countMusicalReview", m_code);
	}
	
	@Override
	public double getMusicalReviewAVG(String m_code) {
		Double result = sqlMap.selectOne("getMusicalReviewAVG",m_code);
	    return (result != null) ? result : 0.0;
	}
	
	@Override
	public List<MusicalReviewDTO> getMusicalReviews(Map paramMap) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getMusicalReviews",paramMap);
	}
	
	@Override
	public List<MusicalReviewDTO> getBestReviewsByMusical(Map paramMap) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getBestReviewsByMusical",paramMap);
	}
	
	@Override
	public List<String> getRound(Map paramMap) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getRound",paramMap);
	}
	
	@Override
	public List<String> getSelectedRoundActors(Map paramMap) {
		
		return sqlMap.selectList("getSelectedRoundActors",paramMap);
	}
	
	@Override
	public int insertLikeMusicalReview(Map paramMap) {
		// TODO Auto-generated method stub
		return sqlMap.insert("insertLikeMusicalReview",paramMap);
	}
	
	@Override
	public int deleteLikeMusicalReview(Map paramMap) {
		// TODO Auto-generated method stub
		return sqlMap.insert("deleteLikeMusicalReview",paramMap);
	}
	
	@Override
	public int countLikeMusicalReview(String mr_code) {
			
		return sqlMap.selectOne("countLikeMusicalReview",mr_code);
	}
	
	@Override
	public PartnerDTO getPartnerInfoByMusical(String m_code) {
		PartnerDTO dto = sqlMap.selectOne("getPartnerInfoByMusical",m_code);
		return dto;
	}
	
	@Override
	public MusicalHallDTO getMusicalHallInfo(String m_code) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getMusicalHallInfo",m_code);
	}
	
	@Override
	public List<MusicalOptionDTO> getRecentMusicalOption(String m_code) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getRecentMusicalOption",m_code);
	}
	
	@Override
	public List<MusicalOptionDTO> getNextMonthMusicalOption(Map paramMap) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getNextMonthMusicalOption",paramMap);
	}
	
	@Override
	public MusicalOptionDTO getMaxMusicalOption(String m_code) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getMaxMusicalOption",m_code);
	}
	
	
	@Override
	public OpenNoticeDTO getOpenTime(String m_code) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getOpenTime",m_code);
	}
	

}
