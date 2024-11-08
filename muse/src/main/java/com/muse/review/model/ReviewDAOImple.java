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
	
	
}
