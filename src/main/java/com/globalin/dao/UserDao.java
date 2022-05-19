package com.globalin.dao;

import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;

public interface UserDao {
	
	//회원가입처리
	void register(UserVO userVO) throws Exception;
	
	//로그인 처리
	UserVO login(LoginDTO loginDTO) throws Exception;
}
