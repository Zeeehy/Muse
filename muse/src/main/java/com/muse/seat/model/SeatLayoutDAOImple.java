package com.muse.seat.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class SeatLayoutDAOImple implements SeatLayoutDAO{
	
	private SqlSessionTemplate sqlMap;
	
	
	public SeatLayoutDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List<SeatLayoutDTO> seatLayoutSelect() {
		
		return sqlMap.selectList("seatLayoutSelect");
	}
	
	@Override
	public List<String> sectionSelect() {
		// TODO Auto-generated method stub
		return sqlMap.selectList("sectionSelect");
	}
	
	@Override
	public List<Integer> bindByallFloorSelect() {
		// TODO Auto-generated method stub
		return sqlMap.selectList("bindByallFloorSelect");
	}
	
	@Override
	public Map<Integer, Integer> max_rowSelect() {
		 List<Map<String, Object>> resultList = sqlMap.selectList("max_rowSelect");

		    // 결과를 키-값 쌍으로 저장할 Map 생성
		    Map<Integer, Integer> maxRowMap = new HashMap<>();

		    // 각 결과를 순회하면서 키와 값을 맵에 저장
		    for (Map<String, Object> result : resultList) {
		        BigDecimal slFloorKey = (BigDecimal) result.get("sl_floor_key");
		        BigDecimal maxRow = (BigDecimal) result.get("max_row");

		        // BigDecimal을 int로 변환하여 사용
		        maxRowMap.put(slFloorKey.intValue(), maxRow.intValue());
		    }

		    return maxRowMap;
	}
	
	@Override
	public List<SeatDTO> getRealSeat() {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getRealSeat");
	}

	@Override
	public void insertDummySeats(List<SeatDTO> seatList) {
		
		for(int i=0; i<seatList.size(); i++) {
			sqlMap.insert("insertSeatList", seatList.get(i));

		}
	}
	
	

}
