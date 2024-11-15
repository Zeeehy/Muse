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


	@Override
	public List<OpenNoticeDTO> openRequestList() {
		List<OpenNoticeDTO> lists = sqlMap.selectList("openRequestList");
		return lists;
	}
	
	@Override
	public OpenNoticeDTO openRequest(String on_code) {
		OpenNoticeDTO dto = sqlMap.selectOne("openRequest",on_code);
		return dto;
	}
	
	

	@Override
	public int openRequestEnd(String on_code, int rs_code) {
		
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("on_code", on_code);
		map.put("rs_code", rs_code);
		
		int result;
		
		result = sqlMap.update("openRequestEnd",map);
		
		
		return result;
	}

	
	
	@Override
	public List<OpenNoticeDTO> openApplyList() {
		List<OpenNoticeDTO> lists = sqlMap.selectList("openApplyList");
		return lists;
	}


	@Override
	public OpenNoticeDTO openApply(String on_code) {
		OpenNoticeDTO dto = sqlMap.selectOne("openApply",on_code);
		return dto;
	}


	@Override
	public int openApplyEnd(String on_code) {
		
		return sqlMap.update("openApplyEnd",on_code);
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
