package com.globalin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.globalin.domain.UserVO;
@Controller
public class ChatController {

	private Logger log = LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public void chat(Model model) {
		
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getUserName());
		
		model.addAttribute("userid", user.getUserName());
	}
}