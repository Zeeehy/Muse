package com.muse.partner.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

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
		List<MusicalDTO> list = sqlMap.selectList("selectMusicalList",Map.of("mh_code", mh_code, "seachMusical", seachMusical));
		return list;
	}

}
