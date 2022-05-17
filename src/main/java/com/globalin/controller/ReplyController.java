package com.globalin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyPage;
import com.globalin.domain.ReplyVO;
import com.globalin.service.ReplyService;

@RestController
@RequestMapping("/replies/")
public class ReplyController {

	@Autowired
	private ReplyService service;

	
//	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		int result = service.register(vo);
		
		if (result == 1) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping(value = "/{rno}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") int rno) {
		return new ResponseEntity<ReplyVO>(service.get(rno), HttpStatus.OK);

	}

	@DeleteMapping(value = "/{rno}", 
			produces = { MediaType.TEXT_PLAIN_VALUE }
			)
//	@PreAuthorize("principal.username == #vo.replyer")
	public ResponseEntity<String> remove(@RequestBody ReplyVO vo,@PathVariable("rno") int rno) {
		return service.remove(rno) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PutMapping(value = "/{rno}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE }
	)
//	@PreAuthorize("principal.username == #vo.replyer")
	public ResponseEntity<String> modify(@PathVariable("rno") int rno, @RequestBody ReplyVO vo) {
		vo.setRno(rno);

		return service.modify(vo) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/pages/{bno}/{page}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPage> getList(@PathVariable("page") int page, @PathVariable("bno") int bno) {

		Criteria cri = new Criteria();
		cri.setPageNum(page);
		cri.setAmount(10);
		System.out.println(service.getListPage(cri, bno));
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
}
