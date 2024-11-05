package com.muse.member.model;

public interface MemberDAO {
	
	// 로그인 메서드
	public int loginCheck(String u_id, String u_pwd);
	public MemberDTO getUserInfo(String u_id);

}
