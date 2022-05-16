package com.globalin.dao;

import com.globalin.domain.UserVO;

public interface UserDao {

	//회원가입 처리
	public void register(UserVO userVO);
}
