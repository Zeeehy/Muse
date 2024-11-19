package com.muse.admin.model;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.LinkedHashMap;
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


	@Override
	public HashMap<String, BigDecimal> musePassStats() {
		HashMap<String, BigDecimal> map = sqlMap.selectOne("musePassStats");
		
		return map;
	}


	@Override
	public List<RequestListDTO> pReviewList() {
		List<RequestListDTO> lists = sqlMap.selectList("pReviewList");
		return lists;
	}


	@Override
	public int pReview(String bdr_code, int bdr_state) {
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("bdr_code", bdr_code);
		map.put("bdr_state", bdr_state);
		
		int result = sqlMap.update("pReview",map);
		return result;
	}


	@Override
	public int pReviewDelete(String bdr_code) {
		int result = sqlMap.update("pReviewDelete",bdr_code);
		return result;
	}


	@Override
	public List<ServiceRequestDTO> addRequestList(int rt_code) {
		List<ServiceRequestDTO> lists = sqlMap.selectList("addRequestList",rt_code);
		return lists;
	}


	@Override
	public MusicalDTO addRequest(String sr_code) {
		MusicalDTO dto = sqlMap.selectOne("addRequest",sr_code);
		return dto;
	}


	@Override
	public int addRequestEnd(String sr_code, int rs_code) {
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("sr_code", sr_code);
		map.put("rs_code", rs_code);
		
		int result = sqlMap.update("addRequestEnd",map);
		return result;
	}


	@Override
	public List<ServiceRequestDTO> addApplyList() {
		List<ServiceRequestDTO> lists = sqlMap.selectList("addApplyList");
		return lists;
	}


	@Override
	public MusicalDTO addApply(String sr_code) {
		MusicalDTO dto = sqlMap.selectOne("addApply",sr_code);
		return dto;
	}


	@Override
	public int addApplyEnd(String sr_code) {
		
		return sqlMap.update("addApplyEnd",sr_code);
	}


	@Override
	public int goAdminLogin(String a_id, String a_pwd) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("a_id", a_id);
		map.put("a_pwd", a_pwd);
		
		return sqlMap.selectOne("goAdminLogin",map);
	}


	@Override
	public List<MemberStatsDTO> memberStats() {
		List<MemberStatsDTO> lists = sqlMap.selectList("memberStats");
		return lists;
	}

	
	
}
