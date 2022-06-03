package com.globalin.service;

import java.util.List;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyPage;
import com.globalin.domain.ReplyVO;

public interface ReplyService {
	void register(ReplyVO vo) throws Exception;
	
	//댓글 조회 
	List<ReplyVO> get(int bno) throws Exception;

	void modify(ReplyVO vo) throws Exception;

	void remove(int rno) throws Exception;

	List<ReplyVO> getList(Criteria cri, int bno);

	ReplyPage getListPage(Criteria cri, int bno);
	
	List<ReplyVO> userReplyList(String userId) throws Exception;
	
	//선택된 댓글 조회
	ReplyVO selectReply(int rno) throws Exception;
}
