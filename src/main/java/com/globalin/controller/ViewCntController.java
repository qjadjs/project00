package com.globalin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.globalin.service.BoardService;

public class ViewCntController {
	
	@Autowired
	private BoardService service;
	
	private void viewCountUp(int bno, HttpServletRequest request, HttpServletResponse response) {

	    Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
	            }
	        }
	    }

	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("[" + bno + "]")) {
	            service.updateViewCnt(bno);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + bno + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
	        }
	    } else {
	    	service.updateViewCnt(bno);
	        Cookie newCookie = new Cookie("postView","[" + bno + "]");
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	    }
	}


}
