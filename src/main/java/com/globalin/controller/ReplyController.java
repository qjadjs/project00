package com.globalin.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyPage;
import com.globalin.domain.ReplyVO;
import com.globalin.service.BoardService;
import com.globalin.service.ReplyService;



@RestController
@RequestMapping("/replies/*")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	
	@Autowired
	private BoardController boardService;
	private ReplyService service;

	@Inject
	public ReplyController(ReplyService service) {
		this.service = service;
	}

	//Reply Register

	@RequestMapping(value = "/new", method = RequestMethod.POST) 
	public ResponseEntity<String> register(@RequestBody ReplyVO replyVO) { 
		ResponseEntity<String> entity = null; 
		
		try { 
			service.register (replyVO); 
		
		entity = new ResponseEntity<String>("Success.", HttpStatus.OK); 
		
		} catch (Exception e) { e.printStackTrace(); 
		
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); 
		} return entity;
		
	}
	
	// 페이지 처리된 리스트 GET
	@RequestMapping(value = "/all/{bno}/{page}", produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE }, method = RequestMethod.GET)
	public ResponseEntity<ReplyPage> getList(@PathVariable("page") int page, @PathVariable("bno") int bno) {

		Criteria cri = new Criteria();
		cri.setPageNum(page);
		cri.setAmount(10);
		System.out.println(service.getListPage(cri, bno));
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
}
