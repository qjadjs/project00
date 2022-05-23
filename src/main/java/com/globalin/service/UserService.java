package com.globalin.service;

import java.util.Date;

import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;

public interface UserService {

	// 회원가입 처리
	void register(UserVO userVO) throws Exception;

	// 로그인처리
	UserVO login(LoginDTO loginDTO) throws Exception;

	//로그인정보 유지
	void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;
	
	//세션키 검증
	UserVO checkLoginBefore(String value) throws Exception;
	
	//회원정보 보기
	public UserVO readMember(String userId);
		
	//회원정보 수정
	public void updateMember(UserVO userVO);
	//회원정보 삭제
	public void deleteMember(UserVO userVO);


}
