package com.muse.member.model;

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

	@Override
	public MemberDTO getUserInfo(String u_id) {
		// Mapper에서 정의한 SQL 쿼리를 호출
        MemberDTO dto = sqlMap.selectOne("loginSession", u_id);
		return dto;
	}

}
