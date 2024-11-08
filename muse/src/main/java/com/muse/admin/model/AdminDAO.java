package com.muse.admin.model;

import java.util.List;

public interface AdminDAO {

	List<BannerDTO> bannerList();
	List<BannerDTO> addBannerList();
	int addBanner(String m_code);
	int deleteBanner(String m_code);
	
	List<PartnerDTO> partnerRequestList();
	PartnerDTO partnerRequest(String pr_code);
	int partnerRequestEnd(int rs_code,String pr_code);
}
