package com.globalin.service;

import java.util.List;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyPage;
import com.globalin.domain.ReplyVO;

public interface ReplyService {
	void register(ReplyVO vo);

	List<ReplyVO> get(int rno);

	void modify(ReplyVO vo);

	void remove(int rno);

	List<ReplyVO> getList(Criteria cri, int bno);

	ReplyPage getListPage(Criteria cri, int bno);
}
