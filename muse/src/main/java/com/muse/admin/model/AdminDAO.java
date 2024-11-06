package com.muse.admin.model;

import java.util.List;

public interface AdminDAO {

	List<BannerDTO> bannerList();
	List<BannerDTO> addBannerList();
	int addBanner(String m_code);
	int deleteBanner(String m_code);
}
