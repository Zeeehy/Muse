package com.muse.myPage.model;

import java.util.List;

public interface MPassDAO {
	MPassDTO getMPass(String u_id);
	int getMyUMPass(String u_id);
	int getMPassRemainDays(String u_id);
	List<MuseMusicalDTO> getMuseMusical();
}
