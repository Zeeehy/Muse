package com.muse.myPage.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MyPageUserDAOImpl implements MyPageUserDAO{

	@Autowired
    private SqlSessionTemplate sqlMap;
	
	public MyPageUserDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public MyPageUserDTO getUserInfo(String u_id) {
		MyPageUserDTO dto = sqlMap.selectOne("userInfo", u_id);
		
		return dto;
	}
	
	@Override
	public int updateUserInfo(MyPageUserDTO dto) {
		int result = sqlMap.update("updateUserInfo", dto);
		
		return result;
	}
	
	@Override
	public int updateUserPwd(MyPageUserDTO dto) {
		int result = sqlMap.update("updateUserPwd", dto);
		
		return result;
	}
}
