package com.muse.review.model;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.muse.seat.model.SeatDTO;
import com.muse.seat.model.SeatLayoutDTO;

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
	public int addPoint(String s_id,String mr_code,int point,int cat) {
		
		Map<String,Object> map = new HashMap<>();
		map.put("u_id", s_id);
		map.put("mr_code", mr_code);
		map.put("point", point);
		map.put("cat", cat);
		
		
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

	
	@Override
	public String getMh_name(String mh_code) {
		String mh_name = sqlMap.selectOne("getMh_name",mh_code);
		return mh_name;
	}

	@Override
	public String getM_name(String m_code) {
		String m_title = sqlMap.selectOne("getM_name",m_code);
		return m_title;
	}

	
	
	// ----------------------- 좌석 ------------------------------

	@Override
	public List<SeatLayoutDTO> seatLayoutSelect(int sl_bind, int mhl_code) {
		Map<String,Integer> map = new HashMap<>();
		map.put("sl_bind", sl_bind);
		map.put("mhl_code", mhl_code);
		
		return sqlMap.selectList("seatLayoutSelectReview",map);
	}
	
	@Override
	public List<String> sectionSelect(int sl_bind, int mhl_code) {
		Map<String,Integer> map = new HashMap<>();
		map.put("sl_bind", sl_bind);
		map.put("mhl_code", mhl_code);
		
		return sqlMap.selectList("sectionSelectReview",map);
	}
	
	@Override
	public List<Integer> bindByallFloorSelect(int sl_bind, int mhl_code) {
		Map<String,Integer> map = new HashMap<>();
		map.put("sl_bind", sl_bind);
		map.put("mhl_code", mhl_code);
		
		return sqlMap.selectList("bindByallFloorSelectReview",map);
	}
	
	@Override
	public Map<Integer, Integer> max_rowSelect(int mhl_code) {
		 List<Map<String, Object>> resultList = sqlMap.selectList("max_rowSelectReview",mhl_code);

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
		
		return sqlMap.selectList("getRealSeatReview",m_code);
	}

	@Override
	public int getMhl_code(String mh_code) {
	
		return sqlMap.selectOne("getMhl_code",mh_code);
	}

	@Override
	public List<SeatReviewDTO> srShowListByHall(String s_section, int s_row, int s_floor, int s_position, String mh_code) {
		
		Map<String,Object> map = new HashMap<>();
		map.put("s_section", s_section);
		map.put("s_row", s_row);
		map.put("s_floor", s_floor);
		map.put("s_position", s_position);
		map.put("mh_code", mh_code);
		
		return sqlMap.selectList("srShowListByHall",map);
	}
	
	@Override
	public List<SeatReviewDTO> srShowListByM(String s_section, int s_row, int s_floor, int s_position, String mh_code,String m_code) {
		
		Map<String,Object> map = new HashMap<>();
		map.put("s_section", s_section);
		map.put("s_row", s_row);
		map.put("s_floor", s_floor);
		map.put("s_position", s_position);
		map.put("mh_code", mh_code);
		map.put("m_code", m_code);
		
		return sqlMap.selectList("srShowListByM",map);
	}

	@Override
	public double srShowAvgByHall(String s_section, int s_row, int s_floor, int s_position, String mh_code) {
		Map<String,Object> map = new HashMap<>();
		map.put("s_section", s_section);
		map.put("s_row", s_row);
		map.put("s_floor", s_floor);
		map.put("s_position", s_position);
		map.put("mh_code", mh_code);
		
		return sqlMap.selectOne("srShowAvgByHall",map);
	}

	@Override
	public double srShowAvgByM(String s_section, int s_row, int s_floor, int s_position, String mh_code,
			String m_code) {
		
		Map<String,Object> map = new HashMap<>();
		map.put("s_section", s_section);
		map.put("s_row", s_row);
		map.put("s_floor", s_floor);
		map.put("s_position", s_position);
		map.put("mh_code", mh_code);
		map.put("m_code", m_code);
		
		return sqlMap.selectOne("srShowAvgByM",map);
	}

	@Override
	public List<SeatDTO> getRealSeatByHall(String mh_code) {
		return sqlMap.selectList("getRealSeatByHall",mh_code);
	}

	@Override
	public List<SeatDTO> getRealSeatByM(String m_code) {
		return sqlMap.selectList("getRealSeatByM",m_code);
	}

	// ----------------------- 좌석 ------------------------------
	
}
