package com.muse.partner.model;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.muse.seat.model.SeatDTO;
import com.muse.seat.model.SeatLayoutDTO;

public class PartnerDAOImple implements PartnerDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;

	public PartnerDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public List<ActorDTO> SeachActorList(String ma_name) {
		List<ActorDTO> list = sqlMap.selectList("selectActorName", ma_name);

		return list;
	}

	@Override
	public List<MusicalDTO> SeachMusicalList(@Param("pr_code") String pr_code,
			@Param("seachMusical") String seachMusical) {
		List<MusicalDTO> list = sqlMap.selectList("selectMusicalList",
				Map.of("pr_code", pr_code, "seachMusical", seachMusical));
		return list;
	}

	@Override
	public MusicalDTO getMusicalDateSelect(String m_code) {
		MusicalDTO dto = sqlMap.selectOne("selectStartEndDate", m_code);

		return dto;
	}

	@Override
	public int insertMusicalDate(@Param("m_code") String m_code, @Param("mo_date") String mo_date,
			@Param("mo_time") String mo_time) {
		Map<String, Object> params = new HashMap<>();
		params.put("m_code", m_code);
		params.put("mo_date", mo_date);
		params.put("mo_time", mo_time);

		int result = sqlMap.insert("insetMuscialDate", params);

		return result;
	}

	@Override
	public List<MusicalOptionDTO> getMusicalDateSelcetOption(String m_code) {
		List<MusicalOptionDTO> list = sqlMap.selectList("selectOptionList", m_code);
		return list;
	}

	@Override
	public List<MusicalOptionDTO> getMusicalTimeSelcetOption(String m_code, String mo_date) {
		Map<String, Object> params = new HashMap<>();
		params.put("m_code", m_code);
		params.put("mo_date", mo_date);

		// Map을 파라미터로 넘겨서 SQL 쿼리 실행
		List<MusicalOptionDTO> list = sqlMap.selectList("selectTimeOptionList", params);
		return list;
	}

	@Override
	public int insertCasting(String ma_code, String mc_char, String m_code, String mo_date, String mo_time) {
		Map<String, Object> params = new HashMap<>();
		params.put("m_code", m_code);
		params.put("ma_code", ma_code);
		params.put("mc_char", mc_char);
		params.put("mo_date", mo_date);
		params.put("mo_time", mo_time);
		int result = sqlMap.insert("insertCasting", params);
		return result;
	}

	@Override
	public int insertTicketNotice(String m_code, String rs_code, String on_type, String on_open, String on_muse_open,
			String on_info, String on_sale, String on_content, String on_casting, String on_etc) {
		Map<String, Object> params = new HashMap<>();
		params.put("m_code", m_code);
		params.put("rs_code", rs_code);
		params.put("on_type", on_type);
		params.put("on_open", on_open);
		params.put("on_muse_open", on_muse_open);
		params.put("on_info", on_info);
		params.put("on_sale", on_sale);
		params.put("on_content", on_content);
		params.put("on_casting", on_casting);
		params.put("on_etc", on_etc);
		int result = sqlMap.insert("insertTicketNotice", params);
		return result;
	}

	@Override
	public List<MusicalHallDTO> getMusicalHallList() {
		List<MusicalHallDTO> list = sqlMap.selectList("selectMusicalHallList");
		return list;
	}

	@Override
	public List<SeatGradeDTO> selectSeatGrade() {
		List<SeatGradeDTO> list = sqlMap.selectList("selectSeatGradeList");
		return list;
	}

	@Override
	public int insertSelectSeats(List<SeatDTO> seatList) {
		int result = 0;
		for (int i = 0; i < seatList.size(); i++) {
			result += sqlMap.insert("SelectSeatList", seatList.get(i));
		}
		return result;
	}

	@Override
	public int insertMusical(MusicalDTO DTO) {
		int result = sqlMap.insert("insertMusical", DTO);
		return result;
	}

	@Override
	public PartnerDTO getPartnerInfo(String pr_code) {

		PartnerDTO dto = sqlMap.selectOne("selectPartner", pr_code);
		return dto;
	}

	@Override
	public int partnerInsert(PartnerDTO dto) {
		int result = sqlMap.insert("partnerInsert", dto);
		return result;
	}

	@Override
	public List<MusicalReviewDTO> seachReview(String pr_code) {
		List<MusicalReviewDTO> list = sqlMap.selectList("reviewList", pr_code);
		return list;
	}

	@Override
	public int seachCodeMax(String idx, String table) {
		Map<String, Object> params = new HashMap<>();
		params.put("table", table);
		params.put("code", idx);
		int result = sqlMap.selectOne("seachCode", params);
		return result;
	}

	@Override
	public int InsertServiceRequest(ServiceRequestDTO dto) {
		int result = sqlMap.insert("insertservRe", dto);
		return result;
	}

	@Override
	public String MaxMcode() {
		String m_code = sqlMap.selectOne("maxMcode");
		return m_code;
	}

	@Override
	public List<MusicalReviewDTO> seachMusicalReview(String pr_code, String m_code) {

		Map<String, Object> params = new HashMap<>();
		params.put("pr_code", pr_code);
		params.put("m_code", m_code);
		List<MusicalReviewDTO> list = sqlMap.selectList("reviewMuscialList", params);
		System.out.println("뮤지컬 이름으로 리뷰 리스트 접근확인");
		return list;
	}


	@Override
	public int updateBestReveiw(String mr_code) {
		int result = sqlMap.update("updateReview", mr_code);
		return result;
	}

	@Override
	public int deleteReviewRe(BbsDeleteRequestDTO dto) {
		int result = sqlMap.insert("reveiwDelRe", dto);
		return result;
	}

	@Override
	public List<MusicalDTO> getMusicalList(String pr_code) {
		Map<String, Object> params = new HashMap<>();
		params.put("pr_code", pr_code);
		List<MusicalDTO> list = sqlMap.selectList("getMusicalList", params);
		return list;
	}

	@Override
	public MemberDTO getusersInfo(String u_id) {
		MemberDTO dto = sqlMap.selectOne("getusersInfo", u_id);
		return dto;
	}

//좌석 관련 dao
	@Override
	public List<SeatLayoutDTO> seatLayoutSelectPartner(int mhl_code) {

		return sqlMap.selectList("seatLayoutSelectPartner",mhl_code);
	}

	@Override
	public List<String> sectionSelectPartner(int mhl_code) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("sectionSelectPartner",mhl_code);
	}

	@Override
	public List<Integer> bindByallFloorSelectPartner(int mhl_code) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("bindByallFloorSelectPartner",mhl_code);
	}

	@Override
	public Map<Integer, Integer> max_rowSelectPartner(int mhl_code) {
		List<Map<String, Object>> resultList = sqlMap.selectList("max_rowSelectPartner",mhl_code);

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
	public List<SeatDTO> getRealSeatPartner() {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getRealSeatPartner");
	}

	@Override
	public void insertDummySeatsPartner(List<SeatDTO> seatList) {

		for (int i = 0; i < seatList.size(); i++) {
			sqlMap.insert("insertSeatListPartner", seatList.get(i));

		}
	}
	@Override
	public SeatDTO selectLayout(String mh_code) {
		SeatDTO DTO = sqlMap.selectOne("selectLayout", mh_code);
		return DTO;
	}

@Override
public int updateBestReveiw(String mr_code) {
	int result = sqlMap.update("updateReview",mr_code);
	return result;
}
@Override
public int deleteReviewRe(BbsDeleteRequestDTO dto) {
	int result = sqlMap.insert("reveiwDelRe",dto);
	return result;
}
@Override
public List<MusicalDTO> getMusicalList(String pr_code) {
	Map<String, Object> params = new HashMap<>();
	params.put("pr_code", pr_code);
	List<MusicalDTO> list = sqlMap.selectList("getMusicalList",params);
	return list;
}

}
