package com.muse.member.model;

import java.util.Map;

public interface MemberDAO {
	
	// 로그인 메서드
	public int loginCheck(String u_id, String u_pwd);
	public MemberDTO getUserInfo(String u_id);

	// 회원가입 메서드 
	public int Join(MemberDTO memberDTO);
	public int idCheck(String u_id);
	public int pwdCheck(String u_pwd);
	
	// 아이디 찾기
	public String find_id(String email);
	
	// 비밀번호 찾기 
	public int find_idCheck(String u_id);
	public String checkNameAndEmail(Map<String, Object> params);
	public String idcheckNameAndEmail(String email);
	public int UpdatePwd(Map<String, Object> params);
}
