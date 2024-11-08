package com.muse.partner.model;

import org.mybatis.spring.SqlSessionTemplate;

public class PartnerDAOImple implements PartnerDAO {

	
	private SqlSessionTemplate sqlMap;
	
	public PartnerDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
}
