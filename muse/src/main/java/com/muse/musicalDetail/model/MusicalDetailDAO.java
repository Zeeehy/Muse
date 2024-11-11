package com.muse.musicalDetail.model;

import org.apache.ibatis.annotations.Param;

public interface MusicalDetailDAO {

	public MusicalDetailDTO getMusicalBasicInfo(String m_code);
	public int checkLikeMusical(String m_code, String u_id);
	public int countLikeMusical(String m_code);
	public int insertLikeMusical(String m_code, String u_id);
	public int deleteLikeMusical(String m_code, String u_id);
	
}
