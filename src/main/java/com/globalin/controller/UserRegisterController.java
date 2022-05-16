package com.globalin.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.domain.UserVO;
import com.globalin.service.UserService;

@Controller
@RequestMapping("/user")
public class UserRegisterController {

	private static Logger log = LoggerFactory.getLogger(UserRegisterController.class);

	@Autowired
	private UserService userservice;

	// 회원가입 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		log.info("회원 가입 페이지 진입");
		return "/user/register";
	}

	// 회원 가입 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(UserVO userVO, RedirectAttributes atts) {

		log.info("register 서비스 진입");

		// 회원가입 서비스 실행
		String hashedPw = BCrypt.hashpw(userVO.getUserPw(), BCrypt.gensalt());
		userVO.setUserPw(hashedPw);
		userservice.register(userVO);
		atts.addFlashAttribute("msg", "REGISTERED");
		return "redirect:/user/login";

	}

	 //로그인 페이지 (임시로 여기에 작성하고 추후 UserLoginController에서 다시 작성)
	@RequestMapping(value = "/login", method = RequestMethod.GET) public String login() throws Exception
	{ return "/user/login"; }

}
