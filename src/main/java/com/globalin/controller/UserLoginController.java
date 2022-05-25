package com.globalin.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.util.WebUtils;

import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;
import com.globalin.service.UserService;

@Controller
@RequestMapping("/user")
public class UserLoginController {

	private static Logger log = LoggerFactory.getLogger(UserLoginController.class);

	@Autowired
	private UserService userService;

	@Inject
	public UserLoginController(UserService userService) {
		this.userService = userService;
	}

	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		log.info(loginDTO.toString());
		return "/user/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
		log.info(loginDTO.toString());
		UserVO userVO = userService.login(loginDTO);
		if (userVO == null) return;
		
		model.addAttribute("user", userVO);

		// 로그인 유지를 선택할경우
		if (loginDTO.isUseCookie()) {
			int amount = 60 * 60 * 24 * 7; // 7일
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정
			userService.keepLogin(userVO.getUserId(), httpSession.getId(), sessionLimit);
		}
	}

	// 로그아웃기능
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		Object object = httpSession.getAttribute("login");
		if (object != null) {
			UserVO userVO = (UserVO) object;
			httpSession.removeAttribute("login");
			httpSession.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				userService.keepLogin(userVO.getUserId(), "none", new Date());
			}
		}
		return "/user/logout";
	}

}
