package com.muse.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class AdminDAOImple implements AdminDAO {
	
	private SqlSessionTemplate sqlMap;

	public AdminDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	
	public List<BannerDTO> bannerList() {
		List<BannerDTO> lists = sqlMap.selectList("bannerList");
		return lists;
	}


	public List<BannerDTO> addBannerList() {
		List<BannerDTO> lists = sqlMap.selectList("addBannerList");
		return lists;
	}


	public int addBanner(String m_code) {
		int result = sqlMap.insert("addBanner", m_code);
		return result;
	}


	public int deleteBanner(String m_code) {
		int result = sqlMap.insert("deleteBanner", m_code);
		return result;
	}

	
	
}
