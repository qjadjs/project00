package com.globalin.commons.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	private static final Logger log = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession httpSession = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("user");

		if (userVO != null) {
			log.info("new login success");
			httpSession.setAttribute(LOGIN, userVO);
		
			if (request.getParameter("useCookie") != null) {
				log.info("remember me...");
				// 쿠키 생성
				Cookie loginCookie = new Cookie("loginCookie", httpSession.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60 * 60 * 24 * 7); 
				// 전송
				response.addCookie(loginCookie);
			}
			Object destination = httpSession.getAttribute("destination");
			Object redirectURI = httpSession.getAttribute("redirectURI");
			response.sendRedirect(destination != null ? (String) destination : (String) redirectURI);		
		}
		}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession httpSession = request.getSession();
		// 기존의 로그인 정보 제거
		if (httpSession.getAttribute(LOGIN) != null) {
			log.info("clear login data before");
			httpSession.removeAttribute(LOGIN);
		}
		return true;
	}
}
