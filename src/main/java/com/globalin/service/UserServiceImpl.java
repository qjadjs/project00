package com.globalin.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.dao.UserDao;
import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	public final UserDao userDao;

	@Autowired
	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
	}
	
	//회원가입 처리
	@Override
	public void register(UserVO userVO) throws Exception {
		userDao.register(userVO);
	}

	//로그인 처리
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		// TODO Auto-generated method stub
		return userDao.login(loginDTO);
	}
	//회원 정보 받아오기
	@Override
	public UserVO getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}
	

}