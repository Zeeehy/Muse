package com.muse.admin.model;

import java.util.List;

import com.muse.review.model.MusicalReviewDTO;

public interface AdminDAO {

	List<BannerDTO> bannerList();
	List<BannerDTO> addBannerList();
	int addBanner(String m_code);
	int deleteBanner(String m_code);
	
	List<MusicalReviewDTO> adminReviewList();
	int adminDeleteReview(String mr_code,int mr_state);
	
	List<PartnerDTO> partnerRequestList();
	PartnerDTO partnerRequest(String pr_code);
	int partnerRequestEnd(int rs_code,String pr_code);
}
