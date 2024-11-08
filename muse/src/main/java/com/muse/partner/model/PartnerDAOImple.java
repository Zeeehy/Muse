package com.muse.partner.model;

import java.util.List;

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
	
}
