package com.globalin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.dao.BoardDAO;
import com.globalin.domain.BoardVO;
import com.globalin.domain.Criteria;
import com.globalin.domain.Page;
import com.globalin.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private BoardService service;

	private BoardDAO dao;

	@Inject
	public BoardController(BoardService service, BoardDAO dao) {
		this.service = service;
		this.dao = dao;
	}

	private static Logger log = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Criteria cri, Model model) {
		log.info("list : " + cri);
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotalCount(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new Page(cri, total));
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO board, RedirectAttributes rttr) throws Exception {
		log.info("write : " + board);
		service.create(board);
		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/board/list";
	}

//	@RequestMapping(value = "/get", method = RequestMethod.GET)
//	public String get(@RequestParam("bno") int bno, Criteria cri, Model model) throws Exception {
//		log.info(" get : " + bno);
//		log.info("cri : " + cri);
//		BoardVO board = service.read(bno);
//		model.addAttribute("cri", cri);
//		model.addAttribute("board", board);
//
//		return "/board/get";
//
//	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGet(@RequestParam("bno") int bno, Criteria cri, Model model) throws Exception {
		log.info("modify : " + bno);
		log.info("cri : " + cri);
		BoardVO board = service.read(bno);
		model.addAttribute("cri", cri);
		model.addAttribute("board", board);

		return "/board/modify";

	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception {
		log.info("modify : " + board);
		if (service.update(board) == true) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, Criteria cri, RedirectAttributes rttr, String writer)
			throws Exception {

		log.info("remove : " + bno);
		if (service.delete(bno) == true) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGet() {
		return "/board/write";
	}

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public String get(HttpServletRequest req, HttpServletResponse resp, @RequestParam("bno") int bno, Criteria cri,
			Model model) throws Exception {
		log.info(" get : " + bno);
		log.info("cri : " + cri);

		Cookie cookies[] = req.getCookies();
		Map mapCookie = new HashMap();
		if (req.getCookies() != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie obj = cookies[i];
				mapCookie.put(obj.getName(), obj.getValue());
			}
		}

		// 저장된 쿠키중에 read_count 만 불러오기
		String cookie_viewCnt = (String) mapCookie.get("viewCnt");
		// 저장될 새로운 쿠키값 생성
		String new_cookie_viewCnt = "|" + bno;

		// 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
		if (StringUtils.indexOfIgnoreCase(cookie_viewCnt, new_cookie_viewCnt) == -1) {
			// 없을 경우 쿠키 생성
			Cookie cookie = new Cookie("viewCnt", cookie_viewCnt + new_cookie_viewCnt);
			cookie.setMaxAge(60 * 60 * 24); // 초단위
			resp.addCookie(cookie);

			// 조회수 업데이트
			this.dao.updateViewCnt(bno);
		}

		BoardVO board = service.read(bno);
		model.addAttribute("cri", cri);
		model.addAttribute("board", board);

		return "/board/get";

	}

}