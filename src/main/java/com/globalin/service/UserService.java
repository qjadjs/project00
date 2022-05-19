package com.globalin.service;

import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;

public interface UserService {

	//회원가입 처리
	void register(UserVO userVO) throws Exception;
	
	//로그인처리
	UserVO login(LoginDTO loginDTO) throws Exception;
}
