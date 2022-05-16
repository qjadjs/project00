package com.globalin.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.dao.UserDao;
import com.globalin.domain.UserVO;
import com.globalin.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	public final UserDao userDao;

	@Inject
	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
	}
	
	//회원가입 처리
	@Override
	public void register(UserVO userVO) {
		userDao.register(userVO);
	}

}
