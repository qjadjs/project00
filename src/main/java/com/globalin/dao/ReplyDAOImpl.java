package com.globalin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	private static final String NameSpace = "mappers.reply.replyMapper";

	private Logger log = LoggerFactory.getLogger(ReplyDAOImpl.class);

	private final SqlSession sqlSession;
	
	public ReplyDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

//댓글 작성
	@Override
	public void insert(ReplyVO vo) throws Exception {
		sqlSession.insert(NameSpace + ".insert", vo);
	}
//댓글 조회
	@Override
	public List<ReplyVO> read(int bno) throws Exception {
		return sqlSession.selectList(NameSpace + ".read", bno);
	}

	@Override
	public void delete(int rno) throws Exception {
		sqlSession.delete(NameSpace + ".delete", rno);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		sqlSession.update(NameSpace + ".update", vo);
	}

	@Override
	public List<ReplyVO> getListWithPaging(Criteria cri, int bno) {
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("cri", cri);
		log.info("cri : " + cri);
		paramMap.put("bno", bno);
		return sqlSession.selectList(NameSpace + ".getListWithPaging", paramMap);
	}

	@Override
	public int getCountByBno(int bno) {
		return sqlSession.selectOne(NameSpace + ".getCountByBno", bno);
	}
	
	@Override
	public int getBno(int rno) {
		return sqlSession.selectOne(NameSpace + ".getBno", rno);
	}

	@Override
	public List<ReplyVO> userReplyList(String userId) throws Exception {
		return sqlSession.selectList(NameSpace +".userReplyList", userId);
	}
	//선택된 댓글 조회
	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		return sqlSession.selectOne(NameSpace + ".selectReply", rno);
	}
	
}
