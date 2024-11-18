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
		Integer result = sqlMap.selectOne("getMusicalMaxTicket", m_code);
		return result != null ? result : 0; // null일 경우 0 반환
	 }
	 
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
		public List<SeatDTO> getRealSeatOnlyReserv(Map<String, Object> params) {
			// TODO Auto-generated method stub
			return sqlMap.selectList("getRealSeatOnlyReserv",params);
		}
		
		@Override
		public int getMhl_code(String mh_code) {
			return sqlMap.selectOne("getMhl_codeReserv",mh_code);
		}

		@Override
		public List<Map<String, Object>> getMusicalPrice(String m_code) {
	        return sqlMap.selectList("getMusicalPrice", m_code);
	    }

		@Override
		public Map<String, Integer> getRemainingSeat(Map<String, Object> params) {
		    Map<String, Integer> remainingSeats = new HashMap<>();
		    try {
		        System.out.println("SQL 실행 전 파라미터: " + params);
		        List<Map<String, Object>> resultList = sqlMap.selectList("getRemainingSeat", params);
		        System.out.println("SQL 실행 결과 raw data: " + resultList); // SQL 결과 원본 확인
		        
		        if(resultList != null && !resultList.isEmpty()) {
		            for(Map<String, Object> row : resultList) {
		                System.out.println("현재 처리중인 row: " + row); // 각 행의 데이터 확인
		                
		                String grade = (String) row.get("GRADE");  // Oracle은 대문자로 반환할 수 있음
		                if(grade == null) {
		                    grade = (String) row.get("grade");     // 소문자로도 시도
		                }
		                
		                Number countNum = (Number) row.get("COUNT");
		                if(countNum == null) {
		                    countNum = (Number) row.get("count");
		                }
		                
		                if(grade != null && countNum != null) {
		                    int count = countNum.intValue();
		                    remainingSeats.put(grade, count);
		                    System.out.println(String.format("매핑됨: grade=%s, count=%d", grade, count));
		                }
		            }
		        }
		        
		        System.out.println("최종 매핑 결과: " + remainingSeats);
		        
		    } catch(Exception e) {
		        e.printStackTrace();
		        System.out.println("잔여석 조회 중 에러 발생: " + e.getMessage());
		    }
		    
		    return remainingSeats;
		}
		
		@Override
		public List<String> getBookedSeats(Map<String, Object> params) {
		    return sqlMap.selectList("getBookedSeats", params);
		}
		
		@Override
		public double getMusicalSeatByHall(String s_code, String m_code) {
			Map<String,Object> map = new HashMap<>();
			map.put("s_code", s_code);
			map.put("m_code", m_code);
			
			Double avg = sqlMap.selectOne("getMusicalSeatByHall",map);
			System.out.println("nullCheck"+avg);
			return avg==null?0.0:avg;
		}
		
		/*
		 * @Override public List<Map<String, Object>> getMusicalSeatPrice(String mCode)
		 * { return sqlMap.selectList("getMusicalSeatPrice", mCode); }
		 */
		
		
		@Override
		public int getPoint(String s_id) {
			return sqlMap.selectOne("getPoint", s_id);
		}
		
		@Override
	    public int usePoint(String s_id, Map<String,Object> params) {
			return sqlMap.update("point.updatePoint", params);
	    }

}
