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
import org.apache.ibatis.annotations.Param;
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
import com.globalin.dao.LikeDAO;
import com.globalin.domain.BoardVO;
import com.globalin.domain.Criteria;
import com.globalin.domain.Page;
import com.globalin.domain.ReplyVO;
import com.globalin.domain.SearchCriteria;
import com.globalin.domain.SelectVO;
import com.globalin.domain.UserVO;
import com.globalin.service.BoardService;
import com.globalin.service.DisLikeService;
import com.globalin.service.LikeService;
import com.globalin.service.ReplyService;
import com.globalin.service.SelectService;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private ReplyService replyService;

	private BoardService service;

	private BoardDAO dao;

	private LikeDAO Ldao;

	private LikeService Lservice;

	private DisLikeService Dservice;

	private SelectService Sservice;

	@Inject
	public BoardController(ReplyService replyService, BoardService service, BoardDAO dao, LikeDAO Ldao,
			LikeService Lservice, DisLikeService Dservice, SelectService Sservice) {
		this.replyService = replyService;
		this.service = service;
		this.dao = dao;
		this.Ldao = Ldao;
		this.Lservice = Lservice;
		this.Dservice = Dservice;
		this.Sservice = Sservice;
	}

	private static Logger log = LoggerFactory.getLogger(BoardController.class);

//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public void list(Criteria cri, Model model) {
//		log.info("list : " + cri);
//		model.addAttribute("list", service.getList(cri));
//		int total = service.getTotalCount(cri);
//		log.info("total : " + total);
//		model.addAttribute("pageMaker", new Page(cri, total));
//	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Criteria cri, Model model) {
		log.info("l"
				+ "ist : " + cri);
		if(cri.getBtype() == 0) {
			List<BoardVO> list = service.getList(cri);
			model.addAttribute("list", list);
			log.info("list : " + list);
			int total = service.getTotalCount(cri);
			log.info("total : " + total);
			model.addAttribute("pageMaker", new Page(cri, total));
		}else if (cri.getBtype() != 0) {
			List<BoardVO> list = service.getListWithType(cri);
			model.addAttribute("list", list);
			log.info("list : " + list);
			int total = service.getTotalCountType(cri.getBtype());
			log.info("total : " + total);
			model.addAttribute("pageMaker", new Page(cri, total));
		}
	}

	@RequestMapping(value = "/listCheck", method = RequestMethod.POST)
	@ResponseBody
	public Criteria listWithType(Criteria cri, int btype) {
		log.info("cri : " + cri);
		cri.setBtype(btype);
		return cri;
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

		List<ReplyVO> replyList = replyService.get(board.getBno());
		model.addAttribute("replyList", replyList);

		return "/board/get";

	}

	@ResponseBody
	@RequestMapping(value = "/updateLike", method = RequestMethod.POST)
	public int updateLike(int bno, String userId) throws Exception {

		int likeCheck = Lservice.likeCheck(bno, userId);
		int dislikeCheck = Dservice.DislikeCheck(bno, userId);
		if (likeCheck == 0 && dislikeCheck != 1) {
			// 좋아요 처음누름
			Lservice.insertLike(bno, userId); // like테이블 삽입
			Lservice.updateLike(bno); // 게시판테이블 +1
			Lservice.updateLikeCheck(bno, userId);// like테이블 구분자 1
		} else if (likeCheck == 1) {
			Lservice.updateLikeCheckCancel(bno, userId); // like테이블 구분자0
			Lservice.updateLikeCancel(bno); // 게시판테이블 - 1
			Lservice.deleteLike(bno, userId); // like테이블 삭제
		}
		return likeCheck;
	}

	@ResponseBody
	@RequestMapping(value = "/updateDisLike", method = RequestMethod.POST)
	public int updateDisLike(int bno, String userId) throws Exception {

		int likeCheck = Lservice.likeCheck(bno, userId);
		int dislikeCheck = Dservice.DislikeCheck(bno, userId);
		if (dislikeCheck == 0 && likeCheck != 1) {
			// 좋아요 처음누름
			Dservice.insertDisLike(bno, userId); // like테이블 삽입
			Dservice.updateDisLike(bno); // 게시판테이블 +1
			Dservice.updateDisLikeCheck(bno, userId);// like테이블 구분자 1
		} else if (dislikeCheck == 1) {
			Dservice.updateDisLikeCheckCancel(bno, userId); // like테이블 구분자0
			Dservice.updateDisLikeCancel(bno); // 게시판테이블 - 1
			Dservice.deleteDisLike(bno, userId); // like테이블 삭제
		}
		return dislikeCheck;
	}

	@ResponseBody
	@RequestMapping(value = "/updateSelectA", method = RequestMethod.POST)
	public int updateSelectA(int bno, String userId, String stype) throws Exception {
		log.info("bno : " + bno + ", userId : " + userId + ", stype : " + stype);
		int selectCheck = Sservice.selectCheck(bno, userId);
		log.info("selectCheck : " + selectCheck);
		SelectVO selectType = Sservice.selectType(bno, userId);
		log.info("selectType : " + selectType);
		if (selectCheck == 0) {
			Sservice.insertSelect(bno, userId, stype); // select테이블 삽입
			Sservice.updateSelectAtype(bno); // 게시판테이블 +1
			Sservice.updateSelectCheck(bno, userId);// select테이블 구분자 1
			int AllCount = Sservice.selectAllCount(bno);
			log.info("AllCount : " + AllCount);
			int SCount = Sservice.selectCountCheck(bno, stype);
			log.info("SCount : " + SCount);
			float persent = ((float) SCount / (float) AllCount) * 100;
			log.info("persent : " + persent);
		} else if (selectCheck == 1 && (selectType.getStype().equals("a"))) {
			return selectCheck;
		}
		return selectCheck;
	}

	@ResponseBody
	@RequestMapping(value = "/updateSelectB", method = RequestMethod.POST)
	public int updateSelectB(int bno, String userId, String stype) throws Exception {
		log.info("bno : " + bno + ", userId : " + userId + ", stype : " + stype);
		int selectCheck = Sservice.selectCheck(bno, userId);
		log.info("selectCheck : " + selectCheck);
		SelectVO selectType = Sservice.selectType(bno, userId);
		log.info("selectType : " + selectType);
		if (selectCheck == 0) {
			Sservice.insertSelect(bno, userId, stype); // select테이블 삽입
			Sservice.updateSelectBtype(bno);// 게시판테이블 +1
			Sservice.updateSelectCheck(bno, userId);// select테이블 구분자 1
			int AllCount = Sservice.selectAllCount(bno);
			log.info("AllCount : " + AllCount);
			int SCount = Sservice.selectCountCheck(bno, stype);
			log.info("SCount : " + SCount);
			float persent = ((float) SCount / (float) AllCount) * 100;
			log.info("persent : " + persent);
		} else if (selectCheck == 1 && (selectType.getStype().equals("b"))) {
		
		}
		return selectCheck;
	}

	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();

		String fileRoot = "C:\\temp\\"; // 외부경로로 저장을 희망할때.

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.addProperty("url", "/image/" + savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}

	// 댓글 수정 Get
	@RequestMapping(value = "/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(ReplyVO replyVO, Criteria cri, Model model) throws Exception {
		log.info("reply");

		model.addAttribute("replyUpdate", replyService.selectReply(replyVO.getRno()));
		model.addAttribute("cri", cri);

		return "board/replyUpdateView";

	}

	// 댓글 수정 POST
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO replyVO, Criteria cri, RedirectAttributes rttr) throws Exception {
		log.info("reply");

		replyService.modify(replyVO);

		rttr.addAttribute("bno", replyVO.getBno());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board/get";
	}

	// 댓글 삭제 GET
	@RequestMapping(value = "/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(ReplyVO replyVO, Criteria cri, Model model) throws Exception {
		log.info("reply");

		model.addAttribute("replyDelete", replyService.selectReply(replyVO.getRno()));
		model.addAttribute("cri", cri);
		replyService.remove(replyVO);
		return "board/replyDeleteView";
	}

}