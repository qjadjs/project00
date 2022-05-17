package com.globalin.dao;




import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.globalin.domain.UserVO;
@Repository
public class UserDaoImpl implements UserDao {

	private static String NAMESPACE ="com.globalin.mapper.UserMapper";
	
	private SqlSessionFactory sqlSessionFactory;

	@Autowired
	public UserDaoImpl(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	
	//회원가입 처리
	public void register(UserVO userVO) throws Exception {
		sqlSessionFactory.openSession().insert(NAMESPACE + ".register", userVO);
	}
}
