package com.globalin.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyPage;
import com.globalin.domain.ReplyVO;
import com.globalin.service.ReplyService;



@RestController
@RequestMapping("/replies/")
public class ReplyController {

	private ReplyService service;

	@Inject
	public ReplyController(ReplyService service) {
		this.service = service;
	}

	//Reply Register
	/*
	@RequestMapping(value = "/new", method = RequestMethod.POST) 
	public String register(@RequestBody ReplyVO replyVO) { 
		ResponseEntity<String> entity = null; 
		
		try { 
			service.register (replyVO); 
		
		entity = new ResponseEntity<String>("regSuccess", HttpStatus.OK); 
		
		} catch (Exception e) { e.printStackTrace(); 
		
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); 
		} return entity; 
		
	}
*/
	
	//Reply Get 
	@RequestMapping(value = "/{bno}", method = RequestMethod.GET) 
	public ResponseEntity<List<ReplyVO>> get(@PathVariable("bno") int bno) { 
		ResponseEntity<List<ReplyVO>> entity = null; 
		try { 
			entity = new ResponseEntity<List<ReplyVO>>(service.get(bno), HttpStatus.OK);
			
		} catch (Exception e) { e.printStackTrace();
		entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST); 
		} return entity; 
		
	}

/*
	@RequestMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE }, method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@RequestBody ReplyVO vo, @PathVariable("rno") int rno) {
		return service.remove(rno) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
*/
	//Reply Delete 
	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rno") int rno) { 
		ResponseEntity<String> entity = null; try { service.remove(rno); 
		
		entity = new ResponseEntity<String>("delSuccess", HttpStatus.OK);
		
		} catch (Exception e) { e.printStackTrace(); 
		
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); 
		
		} return entity; 
	} 
	

	/*
	@RequestMapping(value = "/{rno}", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE }, method = RequestMethod.PUT)
	public ResponseEntity<String> modify(@PathVariable("rno") int rno, @RequestBody ReplyVO vo) {
		vo.setRno(rno);

		return service.modify(vo) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	*/
	
	//Reply Modify 
	@RequestMapping(value = "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH}) 
	public ResponseEntity<String> update(@PathVariable("rno") int rno, 
			@RequestBody ReplyVO replyVO) { ResponseEntity<String> entity = null; try { 
				replyVO.setRno(rno);
				service.modify(replyVO);
				entity = new ResponseEntity<String>("modSuccess", HttpStatus.OK); 
				} catch (Exception e) { 
					e.printStackTrace(); 
					entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
					
		} return entity; 
	}


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
