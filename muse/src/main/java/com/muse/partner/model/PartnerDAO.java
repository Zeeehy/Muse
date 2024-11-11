package com.muse.partner.model;

import java.util.List;

public interface PartnerDAO {

	public List<ActorDTO> SeachActorList(String ma_name);//actor팝업 배우검색
	
	public List<MusicalDTO> SeachMusicalList(String mh_code,String seachMusical);
	
	public MusicalDTO getMusicalDateSelect(String m_code);
}
