package com.globalin.controller;


import java.util.List;

import javax.inject.Inject;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.dao.BoardDAO;
import com.globalin.domain.BoardVO;
import com.globalin.domain.Criteria;
import com.globalin.domain.Page;
import com.globalin.domain.ReplyVO;
import com.globalin.domain.SearchCriteria;
import com.globalin.service.BoardService;

import com.globalin.service.ReplyService;

import com.google.gson.JsonObject;


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

	@Inject
	public BoardController(BoardService service,ReplyService replyService) {
		this.service = service;
		this.replyService =replyService;
	}
	
	private ReplyService replyService; 


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
	
	// 댓글 작성
	@RequestMapping(value = "/new", method = RequestMethod.POST) 
	public String register(ReplyVO replyVO, SearchCriteria scri, RedirectAttributes rttr) throws Exception { 
		log.info("reply");
		
		replyService.register(replyVO);
		
		rttr.addAttribute("bno", replyVO.getBno());
		rttr.addAttribute("pageNum", scri.getPageNum());
		rttr.addAttribute("amount", scri.getAmount());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/get";
	}

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public String get(@RequestParam("bno") int bno, Criteria cri, Model model) throws Exception {
		log.info(" get or modify : " + bno);
		log.info("cri : " + cri);
		BoardVO board = service.read(bno);
		model.addAttribute("cri", cri);
		model.addAttribute("board", board);

		List<ReplyVO> replyList = replyService.get(bno);
		model.addAttribute("replyList", replyList);
		
		return "/board/get";

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
		board.setContent(board.getContent().replaceAll(System.getProperty("line.separator"), " "));
		model.addAttribute("cri", cri);
		model.addAttribute("board", board);

		return "/board/get";

	}

	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		

		String fileRoot = "C:\\temp\\"; // 외부경로로 저장을 희망할때.

		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "C://temp/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	
}