package com.globalin.service;

import java.util.List;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyPage;
import com.globalin.domain.ReplyVO;

public interface ReplyService {
<<<<<<< HEAD
	void register(ReplyVO vo) throws Exception;
=======
	
	public void register(ReplyVO vo)throws Exception;
>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git

<<<<<<< HEAD
	List<ReplyVO> get(int bno) throws Exception;
=======
	public List<ReplyVO> get(int bno) throws Exception;
>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git

	void modify(ReplyVO vo) throws Exception;

	void remove(int rno) throws Exception;

	List<ReplyVO> getList(Criteria cri, int bno);

	ReplyPage getListPage(Criteria cri, int bno);
}
