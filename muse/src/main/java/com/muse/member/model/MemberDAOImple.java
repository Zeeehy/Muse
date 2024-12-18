package com.muse.member.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {
	
	final int NOT_ID = 1;
	final int NOT_PWD = 2;
	final int LOGIN_OK = 3;
	final int ERROR = -1;
	
	private SqlSessionTemplate sqlMap;

	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	// 로그인 메서드
	 @Override
	    public int loginCheck(String u_id, String u_pwd) {
	        try {
	            // Mapper에서 정의한 SQL 쿼리를 호출
	            MemberDTO member = sqlMap.selectOne("login", u_id);

	            if (member != null) {
	                if (member.getU_pwd().equals(u_pwd)) {
	                    return LOGIN_OK;
	                } else {
	                    return NOT_PWD;
	                }
	            } else {
	                return NOT_ID;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            return ERROR;
	        }
	    }

	 // 로그인 후 세션처리 메서드 
	@Override
		public MemberDTO getUserInfo(String u_id) {
			// Mapper에서 정의한 SQL 쿼리를 호출
	        MemberDTO dto = sqlMap.selectOne("loginSession", u_id);
			return dto;
		}
	


	// 회원가입
	@Override
	public int Join(MemberDTO memberDTO) {
	    // MyBatis 매퍼 호출
	    int check = sqlMap.insert("join", memberDTO);
	    // System.out.println(check);
	    return check ;  // 삽입 성공 시 1 반환	       
	}
	
	// 회원가입을 위한 아이디 체크
	@Override
	public int idCheck(String u_id) {
		int idResult = sqlMap.selectOne("idCheck",u_id);
		// System.out.println(idResult);
		return idResult;
	}

	// 회원가입을 위한 비밀번호 체크
	@Override
	public int pwdCheck(String u_pwd) {
		int pwdResult = sqlMap.selectOne("pwdCheck",u_pwd);
		// System.out.println(pwdResult);
		return pwdResult;
	}

	// 비밀번호 찾기를 위한 아이디 확인
	@Override
	public int find_idCheck(String u_id) {
		int findpwdResult = sqlMap.selectOne("findpwd_idCheck",u_id);
		return findpwdResult;
	}

	// 비밀번호 찾기를 위한 이메일 및 이름 확인 
	@Override
	public String checkNameAndEmail(Map<String, Object> params) {
		String findpwdName = sqlMap.selectOne("findpwd_emailCheck",params);
		return  findpwdName;
	}

	// 비밀번호 찾기 최종 : 비밀번호 재설정  
	@Override
	public int UpdatePwd(Map<String, Object> params) {
		int check = sqlMap.update("findpwd_update",params);		
		return check;
	}

	// 아이디 찾기를 위한 이메일 및 이름 확인 
	@Override
	public String idcheckNameAndEmail(String email) {
		String findidName = sqlMap.selectOne("findid_emailCheck",email);
		return findidName;
	}

	// 아이디 찾기를 위한 아이디 저장  
	@Override
	public String find_id(String email) {
		String find_id = sqlMap.selectOne("findid_id",email);
		return find_id;
	}
	
}
