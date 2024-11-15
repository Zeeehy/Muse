package com.muse.partner.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.muse.seat.model.SeatDTO;

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
	public List<MusicalDTO> SeachMusicalList(@Param("mh_code") String mh_code,
			@Param("seachMusical") String seachMusical) {
		List<MusicalDTO> list = sqlMap.selectList("selectMusicalList",
				Map.of("mh_code", mh_code, "seachMusical", seachMusical));
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
		List<MusicalOptionDTO> list = sqlMap.selectList("selectOptionList",m_code);
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
		int result = sqlMap.insert("insertCasting",params);
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
		params.put("on_info",on_info);
		params.put("on_sale",on_sale);
		params.put("on_content", on_content);
		params.put("on_casting", on_casting);
		params.put("on_etc", on_etc);
		int result = sqlMap.insert("insertTicketNotice",params);
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
		int result=0;
		for(int i=0; i<seatList.size(); i++) {
			result+=sqlMap.insert("SelectSeatList", seatList.get(i));
		}
		return result;
	}
}
