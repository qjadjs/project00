package com.globalin.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;
import com.globalin.service.UserService;

@Controller
@RequestMapping("/user")
public class UserInfoController {

	private static Logger log = LoggerFactory.getLogger(UserLoginController.class);

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String infoGET(HttpSession session, Model model) throws Exception{

		//세션 객체 안에 있는 ID정보 저장ser
		String id = (String) session.getAttribute("userId");
		log.info("C: 회원정보보기 GET의 아이디 "+ id);
		if(id == null) {
			return "redirect:/";
		}
		//서비스안의 회원정보보기 메서드 호출
		UserVO userVO = userService.readMember(id);

		//정보저장 후 페이지 이동
		model.addAttribute("user", userVO);
		log.info("C: 회원정보보기 GET의 VO "+ userVO);
		
		return "/user/info";	
	}
	/* 회원정보 수정 */
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String updateGET(HttpSession session, Model model) throws Exception{

		//세션 객체 안에 있는 ID정보 저장ser
				String id = (String) session.getAttribute("userId");
				log.info("C: 회원정보보기 GET의 아이디 "+ id);
				if(id == null) {
					return "redirect:/";
				}
				//서비스안의 회원정보보기 메서드 호출
				UserVO userVO = userService.readMember(id);

				//정보저장 후 페이지 이동
				model.addAttribute("user", userVO);
				log.info("C: 회원정보보기 GET의 VO "+ userVO);
				
		return "/user/updateForm";
	}

	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String updatePOST(UserVO userVO ,HttpSession session) throws Exception{
		log.info("C: 회원정보수정 입력페이지 POST");
		userService.updateMember(userVO);
		log.info("회원정보 수정 " + userVO);
		return "/user/info";
	}

	/* 회원정보삭제 */
	// http://localhost:8088/test/member/delete

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteGET(UserVO userVO, HttpSession session, Model model) throws Exception{
		log.info("C: 회원정보 삭제 GET");
		String id = (String) session.getAttribute("userId");
		log.info(id);
		if(id == null) {
			return "redirect:/";
		}
		//서비스안의 회원정보보기 메서드 호출
				UserVO VO = userService.readMember(id);

				//정보저장 후 페이지 이동
				model.addAttribute("user", VO);
				log.info("C: 회원정보보기 GET의 VO "+ VO);
		return "/user/deleteForm";			
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletePOST(UserVO userVO, HttpSession session) throws Exception{
		log.info("C: 회원정보 삭제 POST");
		//1. 파라미터값 저장
		log.info("C: deleteForm전달정보 "+userVO);
		// 2. 전달받은 정보를 가지고 삭제 동작 처리이동
		// 3. service 객체 - 동작
		userService.deleteMember(userVO);
		// 5. 페이지 이동
		return "redirect:/";			
	}

}
