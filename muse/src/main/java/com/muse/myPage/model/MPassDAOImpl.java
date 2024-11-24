package com.muse.myPage.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MPassDAOImpl implements MPassDAO{
	
	@Autowired
    private SqlSessionTemplate sqlMap;
	
	public MPassDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public MPassDTO getMPass(String u_id) {
		MPassDTO dto = sqlMap.selectOne("selectMPass", u_id);
		
		return dto;
	}
	
	@Override
	public int getMyUMPass(String u_id) {
		int u_mpass = sqlMap.selectOne("selectMyUMpass", u_id);
		return u_mpass;
	}
	
	@Override
	public int getMPassRemainDays(String u_id) {
		int mpRemainDays = 0;
		if(sqlMap.selectOne("selectMPassRemainDays", u_id)!=null) {
			mpRemainDays = sqlMap.selectOne("selectMPassRemainDays", u_id);
		}
		
		return mpRemainDays;
	}
	
	@Override
	public List<MuseMusicalDTO> getMuseMusical() {
		List<MuseMusicalDTO> museMusical=sqlMap.selectList("selectMuseMusical");
		return museMusical;
	}
}
