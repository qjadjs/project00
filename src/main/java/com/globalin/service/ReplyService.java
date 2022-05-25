package com.globalin.service;

import java.util.List;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyPage;
import com.globalin.domain.ReplyVO;

public interface ReplyService {
	
	public void register(ReplyVO vo)throws Exception;

	public List<ReplyVO> get(int bno) throws Exception;

	void modify(ReplyVO vo);

	void remove(int rno);

	List<ReplyVO> getList(Criteria cri, int bno);

	ReplyPage getListPage(Criteria cri, int bno);
}
