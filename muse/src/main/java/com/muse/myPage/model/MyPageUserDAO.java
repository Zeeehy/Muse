package com.muse.myPage.model;

public interface MyPageUserDAO {
	
	public MyPageUserDTO getUserInfo(String u_id);
	public int updateUserInfo(MyPageUserDTO dto);
	public int updateUserPwd(MyPageUserDTO dto);
}
