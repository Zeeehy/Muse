package com.muse.myPage.model;


public interface MPassDAO {
	MPassDTO getMPass(String u_id);
	int getMPassRemainDays(String u_id);
}
