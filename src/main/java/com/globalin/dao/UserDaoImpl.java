package com.globalin.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.globalin.domain.UserVO;

public class UserDaoImpl implements UserDao {

	private static final String NAMESPACE ="com.globalin.mapper.UserMapper";
	
	private final SqlSession sqlSession;

	@Inject
	public UserDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	//회원가입 처리
	public void register(UserVO userVO) {
		sqlSession.insert(NAMESPACE + ".register", userVO);
	}
}
