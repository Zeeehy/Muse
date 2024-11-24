package com.muse.myPage.model;

import java.util.List;

public interface MyPointDAO {
	List<MyPointDTO> getPointList(String u_id);
	int getPointSum(String u_id);
}
