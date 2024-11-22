package com.muse.admin.model;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import com.muse.rank.model.RankDTO;
import com.muse.review.model.MusicalReviewDTO;

public interface AdminDAO {

	int goAdminLogin(String a_id,String a_pwd);
	
	List<RankDTO> getWeekRank();
	int getTodayTicket();
	int getTodayPrice();
	int getInsertCount();
	int getOpenCount();
	int getOpenApply();
	int getInsertApply();
	
	
	List<ServiceRequestDTO> addRequestList(int rt_code);
	MusicalDTO addRequest(String sr_code);
	int addRequestEnd(String sr_code, int rs_code);
	
	List<OpenNoticeDTO> openRequestList();
	OpenNoticeDTO openRequest(String on_code);
	int openRequestEnd(String on_code,int rs_code);
	
	
	List<ServiceRequestDTO> addApplyList();
	MusicalDTO addApply(String sr_code);
	int addApplyEnd(String sr_code);
	
	List<OpenNoticeDTO> openApplyList();
	OpenNoticeDTO openApply(String on_code);
	int openApplyEnd(String on_code);
	
	
	List<BannerDTO> bannerList();
	List<BannerDTO> addBannerList();
	int addBanner(String m_code);
	int deleteBanner(String m_code);
	
	List<MusicalReviewDTO> adminReviewList(int cp,int listsize);
	int getTotalCnt();
	int adminDeleteReview(String mr_code,int mr_state);
	List<MusicalReviewDTO> adminSearchReviewList(String search_word);
	
	
	List<RequestListDTO> pReviewList();
	int pReview(String bdr_code,int bdr_state);
	int pReviewDelete(String bdr_code);
	
	List<PartnerDTO> partnerRequestList();
	PartnerDTO partnerRequest(String pr_code);
	int partnerRequestEnd(int rs_code,String pr_code);
	
	
	HashMap<String,BigDecimal> musePassStats();
	List<MemberStatsDTO> memberStats();
	List<StatsDTO> partnerStats();
	List<StatsDTO> rankingStats();
	List<StatsDTO> rankingStatsTime(int time);
}


