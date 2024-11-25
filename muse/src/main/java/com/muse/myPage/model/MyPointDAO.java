package com.muse.myPage.model;

import java.util.List;
import java.util.Map;

public interface MyPointDAO {
	List<MyPointDTO> getPointList(String u_id);
	int getPointSum(String u_id);
	List<MyPointDTO> getPointDay(Map<String, Object> map);
	List<MyPointDTO> getPointMonth(Map<String, Object> map);
	List<MyPointDTO> getPointAdd(Map<String, Object> map);
	List<MyPointDTO> getPointUse(Map<String, Object> map);
}
