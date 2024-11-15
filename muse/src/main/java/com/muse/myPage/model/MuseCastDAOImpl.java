package com.muse.myPage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.muse.partner.model.ActorDTO;
import com.muse.partner.model.MusicalDTO;

public class MuseCastDAOImpl implements MuseCastDAO{

	@Autowired
    private SqlSessionTemplate sqlMap;
	
	public MuseCastDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int getLikeActorCount(String u_id) {
		int count=sqlMap.selectOne("selectLikeActorCount",u_id);
		return count;
	}
	
	@Override
	public List<MyLikeActorDTO> getLikeActorList(String u_id) {
		List<MyLikeActorDTO> likeActorList = sqlMap.selectList("selectLikeActorList",u_id);
	    
		return likeActorList;
	}
	
	@Override
	public int getLikeMusicalCount(String u_id) {
		int count=sqlMap.selectOne("selectLikeMusicalCount",u_id);
		return count;
	}
	
	@Override
	public List<MyLikeMusicalDTO> getLikeMusicalList(String u_id) {
		List<MyLikeMusicalDTO> likeMusicalList = sqlMap.selectList("selectLikeMusicalList",u_id);
	    
		return likeMusicalList;
	}
	
	@Override
	public List<ActorDTO> getSearchActor(Map<String, Object> map) {
		List<ActorDTO> actorList = sqlMap.selectList("selectSearchActorList",map);
	    
		return actorList;
	}
	
	@Override
	public List<MusicalDTO> getSearchMusical(Map<String, Object> map) {
		List<MusicalDTO> musicalList = sqlMap.selectList("selectSearchMusicalList",map);
	    
		return musicalList;
	}
	
	@Override
	public int insertLikeActorList(Map<String, Object> map) {
		int count=sqlMap.insert("insertLikeActorList",map);
		return count;
	}
	
	@Override
	public int deleteLikeActorList(Map<String, Object> map) {
		int count=sqlMap.delete("deleteLikeActorList",map);
		return count;
	}
	
	@Override
	public int insertLikeMusicalList(Map<String, Object> map) {
		int count=sqlMap.insert("insertLikeMusicalList",map);
		return count;
	}
	
	@Override
	public int deleteLikeMusicalList(Map<String, Object> map) {
		int count=sqlMap.delete("deleteLikeMusicalList",map);
		return count;
	}
}
