package com.globalin.dao;




import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.globalin.domain.UserVO;
@Repository
public class UserDaoImpl implements UserDao {

	private static final String NAMESPACE ="mappers.user.UserMapper";
	
	private SqlSession sqlSession;

	@Autowired
	public UserDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	//회원가입 처리
	public void register(UserVO userVO) throws Exception {
		sqlSession.insert(NAMESPACE+".register", userVO);
	}
}
