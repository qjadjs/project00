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
<<<<<<< HEAD
	public List<ReplyVO> get(int rno) throws Exception {
		return (List<ReplyVO>) replyDao.read(rno);
=======
	public List<ReplyVO> get(int bno) throws Exception {
		return replyDao.read(bno);
>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git
	}

	@Override
	public void modify(ReplyVO vo) throws Exception {
		replyDao.update(vo);
	}

	@Override
	public void remove(int rno) throws Exception {
		int bno = replyDao.getBno(rno);
		replyDao.delete(rno);
		boardDao.updateReplyCnt(bno, -1);
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

}
