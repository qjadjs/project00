package com.globalin.dao;

import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;

public interface UserDao {
	
	//회원가입처리
	void register(UserVO userVO) throws Exception;
	
	//로그인 처리
	UserVO login(LoginDTO loginDTO) throws Exception;
	
	//회원정보 가져오기
	public UserVO getUser(String userId) throws Exception;

	//회원정보 수정
	
	//회원정보 삭제
	
	
}
