package com.globalin.service;



import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.dao.UserDao;
import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
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
	
	//로그인정보 유지
	@Override
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception {
		userDao.keepLogin(userId, sessionId, sessionLimit);
		
	}
	//세션키 검증
	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		return userDao.checkUserWithSessionKey(value);
	}
	

	@Override
	public void deleteMember(UserVO userVO) {
		// TODO Auto-generated method stub
		try {
			userDao.deleteMember(userVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//회원정보 보기
	@Override
	public UserVO readMember(String userId) {
		System.out.println("S : readMember()실행");
		UserVO userVO = null;
		
		try {
			userVO = userDao.readMember(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userVO;
	}

	//회원정보 수정
	@Override
	public void updateMember(UserVO userVO) {
		
		try {
			userDao.updateMember(userVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

		
}