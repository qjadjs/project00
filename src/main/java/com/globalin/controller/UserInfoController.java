package com.globalin.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.domain.BoardVO;
import com.globalin.domain.LoginDTO;
import com.globalin.domain.ReplyVO;
import com.globalin.domain.UserVO;
import com.globalin.service.BoardService;
import com.globalin.service.ReplyService;
import com.globalin.service.UserService;

@Controller
@RequestMapping("/user")
public class UserInfoController {

	private static Logger log = LoggerFactory.getLogger(UserLoginController.class);

	private UserService userService;
	private BoardService boardService;
	private ReplyService replyService;
	
	@Inject
	public UserInfoController(UserService userService, BoardService boardService,ReplyService replyService) {
		this.boardService = boardService;
		this.replyService = replyService;
		this.userService = userService;
	}

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
		List<BoardVO> userBoardList = boardService.userBoardList(id);
		List<ReplyVO> userReplyList = replyService.userReplyList(id);
		//정보저장 후 페이지 이동
		model.addAttribute("user", userVO);
		log.info("C: 회원정보보기 GET의 VO "+ userVO);
		model.addAttribute("userBoardList", userBoardList);
		log.info("C: 회원정보보기 GET의 userBoardList "+ userBoardList);
		model.addAttribute("userReplyList", userReplyList);
		log.info("C: 회원정보보기 GET의 userReplyList "+ userReplyList);
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
	public String updatePOST(UserVO userVO ,HttpSession session, Model model) throws Exception{
		log.info("C: 회원정보수정 입력페이지 POST");
		userService.updateMember(userVO);
		log.info("회원정보 수정 " + userVO);
		model.addAttribute("user", userVO);
		log.info("C: 회원정보보기 GET의 VO "+ userVO);
		return "/user/updatePost";
	}
	/* 내가 쓴 개시물 보기 */
	@RequestMapping(value="/MyBoard", method = RequestMethod.GET)
	public String MyBoardGET(HttpSession session, Model model) throws Exception{

		//세션 객체 안에 있는 ID정보 저장ser
				String id = (String) session.getAttribute("userId");
				log.info("C: 회원정보보기 GET의 아이디 "+ id);
				if(id == null) {
					return "redirect:/";
				}
				//서비스안의 회원정보보기 메서드 호출
				List<BoardVO> userBoardList = boardService.userBoardList(id);
				//정보저장 후 페이지 이동
				model.addAttribute("userBoardList", userBoardList);
				log.info("C: 회원정보보기 GET의 userBoardList "+ userBoardList);	
				
		return "/user/myboardList";
	}
	@RequestMapping(value="/MyReply", method = RequestMethod.GET)
	public String MyReplyGET(HttpSession session, Model model) throws Exception{

		//세션 객체 안에 있는 ID정보 저장ser
				String id = (String) session.getAttribute("userId");
				log.info("C: 회원정보보기 GET의 아이디 "+ id);
				if(id == null) {
					return "redirect:/";
				}
				//서비스안의 회원정보보기 메서드 호출
				List<ReplyVO> userReplyList = replyService.userReplyList(id);
				//정보저장 후 페이지 이동
				model.addAttribute("userReplyList", userReplyList);
				log.info("C: 회원정보보기 GET의 userReplyList "+ userReplyList);
				//서비스안의 회원정보보기 메서드 호출
				List<BoardVO> userBoardList = boardService.userBoardList(id);
				//정보저장 후 페이지 이동
				model.addAttribute("userBoardList", userBoardList);
				log.info("C: 회원정보보기 GET의 userBoardList "+ userBoardList);	
				
		return "/user/myreplyList";
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
		//4. 세션 초기화
		session.invalidate();
		// 5. 페이지 이동
		return "/user/deletePost";			
	}
	// 아이디 찾기 페이지 이동
		@RequestMapping(value="find_id_form")
		public String findIdView() {
			return "user/findId";
		}
		// 아이디 찾기 실행
		@RequestMapping(value="find_id", method=RequestMethod.POST)
		public String findIdAction(UserVO userVO, Model model) throws Exception {
			UserVO user = userService.findId(userVO);
			
			if(user == null) { 
				model.addAttribute("check", 1);
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("user", user.getUserId());
			}
			
			return "user/findId";
		}
		
		  // 비밀번호 찾기 페이지로 이동
		@RequestMapping(value="find_password_form")
		public String findPasswordView() {
			return "user/findPassword";
		}
		
	    // 비밀번호 찾기 실행
		@RequestMapping(value="find_password", method=RequestMethod.POST)
		public String findPasswordAction(UserVO vo, Model model) throws Exception {
			UserVO user = userService.findPassword(vo);
			
			if(user == null) { 
				model.addAttribute("check", 1);
				return "user/findPassword";
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("userId", user.getUserId());
			}
			
			return "user/updatepassword";
		}
		// 비밀번호 바꾸기 실행
			@RequestMapping(value="update_password", method = RequestMethod.POST)
			public String updatePasswordAction(UserVO userVO ,HttpSession session, Model model) throws Exception{
			String id = (String) session.getAttribute("userId");
			System.out.println(userVO);
			userService.updatePassword(userVO);
			model.addAttribute("user", userVO);
			return "user/findPasswordConfirm";
		}
		
		}
	
