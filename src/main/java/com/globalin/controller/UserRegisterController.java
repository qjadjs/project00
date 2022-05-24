package com.globalin.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.dao.UserDao;
import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;
import com.globalin.service.UserService;

@Controller
@RequestMapping("/user")
public class UserRegisterController {

	private static Logger log = LoggerFactory.getLogger(UserRegisterController.class);
	@Autowired
	private SqlSession sqlSession;

	private UserService userService;

	@Inject
	public UserRegisterController(UserService userService) {
		this.userService = userService;
	}
	// 회원가입 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		log.info("/register : 1" );
		return "/user/register";
	}

	// 회원가입 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UserVO userVO, RedirectAttributes redirectAttributes) throws Exception {
		//String hashedPw = BCrypt.hashpw(userVO.getUserPw(), BCrypt.gensalt());
	//	userVO.setUserPw(hashedPw);
		userService.register(userVO);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		return "redirect:/user/login";
	}
	//아이디 중복확인 처리
	@RequestMapping(value="/idOverlap", method=RequestMethod.POST)
	public void idOverlap(HttpServletResponse response, @RequestParam("userId") String userId) throws Exception {
		//@RequestParam는 요청의 특정 파라미터 값을 찾아낼 때 사용하는 어노테이션
		userService.idOverlap(userId, response);	//서비스에 있는 idOverlap 호출.
	}
		}