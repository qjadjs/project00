package com.globalin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.globalin.dao.BoardDAO;
import com.globalin.dao.ReplyDAO;
import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyPage;
import com.globalin.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	private final ReplyDAO replyDao;

	private final BoardDAO boardDao;

	@Inject
	public ReplyServiceImpl(ReplyDAO replyDao, BoardDAO boardDao) {
		this.replyDao = replyDao;
		this.boardDao = boardDao;
	}

	@Transactional
	@Override
	public void register(ReplyVO vo) throws Exception {
		replyDao.insert(vo);
		boardDao.updateReplyCnt(vo.getBno(), 1);
	}

	
	@Override
	public List<ReplyVO> get(int bno) throws Exception {
		return replyDao.read(bno);
	}

	@Override
	public void modify(ReplyVO vo) throws Exception {
		replyDao.update(vo);
	}

	//@Transactional
	@Override
	public void remove(ReplyVO vo) throws Exception {
		replyDao.delete(vo);
		boardDao.updateReplyCnt(vo.getBno(), -1);
		
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int bno) {
		return replyDao.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPage getListPage(Criteria cri, int bno) {
		ReplyPage page = new ReplyPage();

		page.setReplyCnt(replyDao.getCountByBno(bno));
		page.setList(replyDao.getListWithPaging(cri, bno));

		return page;
	}

	@Override
	public List<ReplyVO> userReplyList(String userId) throws Exception {
		return replyDao.userReplyList(userId);
	}

	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		return replyDao.selectReply(rno);
	}
}
