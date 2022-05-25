package com.globalin.service;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;

public interface UserService {

	// 회원가입 처리
	public void register(UserVO userVO) throws Exception;

	// 로그인처리
	public UserVO login(LoginDTO loginDTO) throws Exception;

	//로그인정보 유지
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;
	
	//세션키 검증
	public UserVO checkLoginBefore(String value) throws Exception;
	
	//회원정보 보기
	public UserVO readMember(String userId);
		
	//회원정보 수정
	public void updateMember(UserVO userVO);
	//회원정보 삭제
	public void deleteMember(UserVO userVO);

	public void idOverlap(String userId, HttpServletResponse response) throws Exception;

}
