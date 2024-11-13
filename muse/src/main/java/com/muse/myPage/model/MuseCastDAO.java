package com.muse.myPage.model;

import java.util.List;
import java.util.Map;

import com.muse.partner.model.ActorDTO;
import com.muse.partner.model.MusicalDTO;

public interface MuseCastDAO {
	int getLikeActorCount(String u_id);
	int getLikeMusicalCount(String u_id);
	
	List<MyLikeActorDTO> getLikeActorList(String u_id);
	List<MyLikeMusicalDTO> getLikeMusicalList(String u_id);
	
	List<ActorDTO> getSearchActor(Map<String, Object> map);
	List<MusicalDTO> getSearchMusical(Map<String, Object> map);
	
	int insertLikeActorList(Map<String, Object> map);
	int deleteLikeActorList(Map<String, Object> map);
	
	int insertLikeMusicalList(Map<String, Object> map);
	int deleteLikeMusicalList(Map<String, Object> map);
}
