package com.muse.partner.model;

import java.util.List;

public interface PartnerDAO {

	public List<ActorDTO> SeachActorList(String ma_name);//actor팝업 배우검색
	
	public List<MusicalDTO> SeachMusicalList(String mh_code,String seachMusical);
	
	public MusicalDTO getMusicalDateSelect(String m_code);
	
	public int insertMusicalDate(String m_code, String mo_date,String mo_time);
	
	public List<MusicalOptionDTO> getMusicalDateSelcetOption(String m_code);
	
	public List<MusicalOptionDTO> getMusicalTimeSelcetOption(String m_code,String mo_date);
	
	public int insertCasting(String ma_code,String mc_char,String m_code, String mo_date,String mo_time);
}
