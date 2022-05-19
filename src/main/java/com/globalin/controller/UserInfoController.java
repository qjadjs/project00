package com.globalin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.globalin.domain.UserVO;
import com.globalin.service.UserService;

@Controller
@RequestMapping("/user")
public class UserInfoController {

	private static Logger log = LoggerFactory.getLogger(UserLoginController.class);


	private UserService userService;

	// 회원 정보 페이지
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(HttpSession session, Model model) throws Exception {
		Object userObj = session.getAttribute("login");
		UserVO userVO = (UserVO) userObj;
		String userId = userVO.getUserId();
		return "user/profile";
		
	}

}
