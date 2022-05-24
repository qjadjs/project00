package com.globalin.controller;

import java.util.List;

import javax.inject.Inject;

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

import com.globalin.domain.BoardVO;
import com.globalin.domain.Criteria;
import com.globalin.domain.Page;
import com.globalin.domain.ReplyVO;
import com.globalin.service.BoardService;
import com.globalin.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private BoardService service;

	private static Logger log = LoggerFactory.getLogger(BoardController.class);

	@Inject
	public BoardController(BoardService service) {
		this.service = service;
	}
	@Inject
	ReplyService replyService;


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

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGet(@RequestParam("bno") int bno, Criteria cri, Model model) throws Exception {
		log.info(" get or modify : " + bno);
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

}