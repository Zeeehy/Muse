package com.muse.review.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ReviewDAOImple implements ReviewDAO {

	private SqlSessionTemplate sqlMap;

	public ReviewDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<SeatReviewDTO> srSearchResult(String searchTag,String searchWord){	

		List<SeatReviewDTO> list =null;
		if(searchTag.equals("m_title")) {
			list = sqlMap.selectList("srSearchResultM","%"+searchWord+"%");
		}
		else if(searchTag.equals("mh_name")) {
			list = sqlMap.selectList("srSearchResultMH","%"+searchWord+"%");
		}
		
		
		return list;
	}

	
	public String getWriterId(String b_code) {
		String w_id = sqlMap.selectOne("getWriterId",b_code);
		return w_id;
	}


	public MusicalReviewDTO mrWrite(String b_code) {
		MusicalReviewDTO dto = sqlMap.selectOne("mrWrite",b_code);
		return dto;
	}


	public int mrWriteEnd(MusicalReviewDTO dto) {
		int result = sqlMap.insert("mrWriteEnd",dto);
		return result;
	}
	
	@Override
	public int getMr_code() {
		int mr_code = sqlMap.selectOne("getMr_code");
		return mr_code;
	}

	@Override
	public int addPoint(String s_id,String mr_code,int point) {
		
		Map<String,Object> map = new HashMap<>();
		map.put("u_id", s_id);
		map.put("mr_code", mr_code);
		map.put("point", point);
		
		
		int point2 =sqlMap.insert("addPoint",map);
		return point2;
	}

	@Override
	public String getWriterIdByBdCode(String bd_code) {
		String w_id = sqlMap.selectOne("getWriterIdByBdCode",bd_code);
		return w_id;
	}

	@Override
	public SeatReviewDTO srWrite(String bd_code) {
		SeatReviewDTO dto = sqlMap.selectOne("srWrite",bd_code);
		return dto;
	}

	@Override
	public int srWriteEnd(SeatReviewDTO dto) {
		int result = sqlMap.insert("srWriteEnd",dto);
		return result;
	}

	@Override
	public int getSr_code() {
		int result = sqlMap.selectOne("getSr_code");
		return result;
	}


	
	
}
