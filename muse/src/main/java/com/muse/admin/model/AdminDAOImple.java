package com.muse.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.muse.review.model.MusicalReviewDTO;

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


	
	
	
	public List<PartnerDTO> partnerRequestList() {
		List<PartnerDTO> lists = sqlMap.selectList("partnerRequestList");
		return lists;
	}

	
	public PartnerDTO partnerRequest(String pr_code) {
		PartnerDTO dto = sqlMap.selectOne("partnerRequest",pr_code);
		return dto;
	}


	public int partnerRequestEnd(int rs_code,String pr_code) {
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("rs_code", rs_code);
		map.put("pr_code", pr_code);
		
		int result = sqlMap.update("partnerRequestEnd",map);
		return result;
	}


	@Override
	public List<MusicalReviewDTO> adminReviewList() {
		List<MusicalReviewDTO> lists = sqlMap.selectList("adminReviewList");
		return lists;
	}


	@Override
	public int adminDeleteReview(String mr_code, int mr_state) {
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("mr_code", mr_code);
		
		if(mr_state==2) {
			map.put("mr_state", 0);//차단풀기
		}
		else {
			map.put("mr_state",2); // 차단하기
		}
		
		
		int result = sqlMap.update("adminDeleteReview",map);
		return result;
	}

	
	
}
