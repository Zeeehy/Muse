package com.muse.openNotice.model;

import java.util.List;
import java.util.Map;

public interface OpenNoticeDAO {

	
	
	public List<OpenNoticeDTO> getOpenNoticeList(Map<String, Object> paramMap);
	public int countOpenNotice();
	public int increaseReadNum(String on_code);
	public OpenNoticeDTO getNoticeDetail(String on_code);
	
}
