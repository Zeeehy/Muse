package com.muse.musicalDetail.model;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MusicalDetailDAO {

	public MusicalDetailDTO getMusicalBasicInfo(String m_code);
	public int checkLikeMusical(String m_code, String u_id);
	public int countLikeMusical(String m_code);
	public int insertLikeMusical(String m_code, String u_id);
	public int deleteLikeMusical(String m_code, String u_id);
	public List<MusicalDetailCastDTO> getCastingWithLike(String m_code, String u_id);
	public int insertLikeActor (String ma_code, String u_id);
	public int deleteLikeActor (String ma_code, String u_id);
	public List<Date> getScreenDay(String m_code);
	public List<String> getStartTime(String m_code);
	public List<MusicalDetailCastDTO> getRoundActor(Map paramMap);
	public List<String> getAllChar(String m_code);
}
