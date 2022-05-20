package com.globalin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;
import com.globalin.service.UserService;

@Controller
@RequestMapping("/user")
public class UserLoginController {
	
	private static Logger log = LoggerFactory.getLogger(UserLoginController.class);
	
	private UserService userService;
	
	@Inject
	public UserLoginController(UserService userService) {
		this.userService = userService;
	}

	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		return "/user/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
		log.info(loginDTO.toString());
		UserVO userVO = userService.login(loginDTO);
		if (userVO == null || !BCrypt.checkpw(loginDTO.getUserPw(), userVO.getUserPw())) {
			return;
		}
		model.addAttribute("user", userVO);
	}

}
