package com.muse.reserv.model;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.muse.partner.model.MusicalDTO;
import com.muse.seat.model.SeatDTO;
import com.muse.seat.model.SeatLayoutDTO;

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
	public List<String> getMusicalDate(String m_code) {
		List<String> playDate = sqlMap.selectList("getMusicalDate",m_code);
		return playDate;
	}
	
	@Override
	public List<String> getMusicalTimeByDate(String selectedDate, String m_code) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("selectedDate", selectedDate);
	    params.put("m_code", m_code);
	    return sqlMap.selectList("getMusicalTimeByDate", params);
	}

	 @Override public int getMusicalMaxTicket(String m_code) { 
		 return sqlMap.selectOne("getMusicalMaxTicket", m_code); 
	 }

	 // 좌석 
	 
	 @Override
		public List<SeatLayoutDTO> seatLayoutSelect(int sl_bind, int mhl_code) {
			Map<String,Integer> map = new HashMap<>();
			map.put("sl_bind", sl_bind);
			map.put("mhl_code", mhl_code);
			
			return sqlMap.selectList("seatLayoutSelectReserv",map);
		}
		
		@Override
		public List<String> sectionSelect(int sl_bind, int mhl_code) {
			Map<String,Integer> map = new HashMap<>();
			map.put("sl_bind", sl_bind);
			map.put("mhl_code", mhl_code);
			
			return sqlMap.selectList("sectionSelectReserv",map);
		}
		
		@Override
		public List<Integer> bindByallFloorSelect(int sl_bind, int mhl_code) {
			Map<String,Integer> map = new HashMap<>();
			map.put("sl_bind", sl_bind);
			map.put("mhl_code", mhl_code);
			
			return sqlMap.selectList("bindByallFloorSelectReserv",map);
		}
		
		@Override
		public Map<Integer, Integer> max_rowSelect(int mhl_code) {
			 List<Map<String, Object>> resultList = sqlMap.selectList("max_rowSelectReserv",mhl_code);

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
		public List<SeatDTO> getRealSeat(String m_code) {
			
			return sqlMap.selectList("getRealSeatReserv",m_code);
		}
		
		@Override
		public int getMhl_code(String mh_code) {
			return sqlMap.selectOne("getMhl_codeReserv",mh_code);
		}


	 


}
