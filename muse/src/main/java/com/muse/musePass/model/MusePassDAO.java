package com.muse.musePass.model;

import java.util.Map;

public interface MusePassDAO {

	public int insertMusePass(Map<String,Object> paramMap);
	public int updateMusePassOn(String u_id);
	public int checkPassJoin(String u_id);
	public int updateMPassRange(String u_id);
	public int insertPassPoint(String u_id);
	
}
