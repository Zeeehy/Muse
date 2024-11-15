package com.muse.main.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class MainDAOImple implements MainDAO {

	private SqlSessionTemplate sqlMap;

	public MainDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	// 메인 배너 부분
	@Override
	public List<MusicalDTO> main_banner() {	
		List<MusicalDTO> arr1 = sqlMap.selectList("main_banner");	
		return arr1;
	}

	// 메인 티켓 오픈 부분
	@Override
	public List<TicketOpenDTO> main_ticketopen() {
		List<TicketOpenDTO> arr2 = sqlMap.selectList("main_ticketopen");
		return arr2;
	}

	// 메인 베스트 리뷰 부분
	@Override
	public List<BestReviewDTO> main_bestreview() {
		List<BestReviewDTO> arr3 = sqlMap.selectList("main_bestreview");
		return arr3;
	}

	// 메인 뮤지컬 전체보기 부분
	@Override
	public List<MusicalDTO> main_musicallist(int page, int size) {
		 // 10개씩 가져오는 쿼리로 오프셋을 계산
	    int offset = (page - 1) * size+1; // 예: 1페이지이면 offset = 1, 2페이지이면 offset = 11
	    int limit = page * size;         // 예: 1페이지면 limit = 10, 2페이지면 limit = 20
	    Map<String, Integer> params = new HashMap<>();
	    params.put("offset", offset);
	    params.put("limit", limit);
		List<MusicalDTO> arr4 = sqlMap.selectList("main_musicallist", params);	
		return arr4;
	}

}
