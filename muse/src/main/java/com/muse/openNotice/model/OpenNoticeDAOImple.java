package com.muse.openNotice.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.muse.partner.model.PartnerDTO;

public class OpenNoticeDAOImple implements OpenNoticeDAO{

	private SqlSessionTemplate sqlMap;

	public OpenNoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	

	@Override
	public List<OpenNoticeDTO> getOpenNoticeList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getOpenNoticeList",paramMap);
	}
	
	@Override
	public int countOpenNotice() {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("countOpenNotice");
	}
	
	@Override
	public int increaseReadNum(String on_code) {
		// TODO Auto-generated method stub
		return sqlMap.update("increaseReadNum", on_code);
	}
	
	@Override
	public OpenNoticeDTO getNoticeDetail(String on_code) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getNoticeDetail", on_code);
	}
	
	@Override
	public PartnerDTO getPartnerByOpenNotice(String on_code) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getPartnerByOpenNotice",on_code);
	}
}
