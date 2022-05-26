package com.globalin.service;



import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

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
		userDao.updateLoginDate(loginDTO.getUserId());
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
	//로그인 중복여부
	@Override
	public void idOverlap(String userId, HttpServletResponse response) throws Exception{
		UserVO userVO = new UserVO();
		userVO = userDao.idOverlap(userId);
		if(userVO == null) {
			//dao에서 select이 되지 않아야 true
			//id가 없어야 true(사용 가능)
			response.getWriter().print("1");
		}else {
			//id가 있으면 false(중복으로 사용 불가능)
			response.getWriter().print("0");
		}
		
	}

	@Override
	public UserVO findId(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return userDao.findId(userVO);
	}

	@Override
	public UserVO findPassword(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return userDao.findPassword(userVO);
	}

	@Override
	public void updatePassword(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		userDao.updatePassword(userVO);
	}
		
}