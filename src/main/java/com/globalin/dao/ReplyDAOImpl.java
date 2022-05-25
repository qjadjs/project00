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

	@Inject SqlSession sql;

	
	
//댓글 작성
	@Override
	public void insert(ReplyVO vo) throws Exception {

<<<<<<< HEAD
		sqlSession.insert(NameSpace + ".insert", vo);
=======
		sql.insert(NameSpace + ".insert", vo);
>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git
	}
//댓글 조회
	@Override
<<<<<<< HEAD
	public ReplyVO read(int bno) throws Exception {
		return sqlSession.selectOne(NameSpace + ".read", bno);
=======
	public List<ReplyVO> read(int bno) throws Exception {
		return sql.selectList(NameSpace + ".read", bno);
>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git
	}

	@Override
<<<<<<< HEAD
	public void delete(int rno) throws Exception {
		sqlSession.delete(NameSpace + ".delete", rno);
=======
	public void delete(int rno) {
		sql.delete(NameSpace + ".delete", rno);
>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git
	}

	@Override
<<<<<<< HEAD
	public void update(ReplyVO vo) throws Exception {
		sqlSession.update(NameSpace + ".update", vo);
=======
	public void update(ReplyVO vo) {
		sql.update(NameSpace + ".update", vo);
>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git
	}

	@Override
	public List<ReplyVO> getListWithPaging(Criteria cri, int bno) {
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("cri", cri);
		log.info("cri : " + cri);
		paramMap.put("bno", bno);
		return sql.selectList(NameSpace + ".getListWithPaging", paramMap);
	}

	@Override
	public int getCountByBno(int bno) {
		return sql.selectOne(NameSpace + ".getCountByBno", bno);
	}
	
	@Override
	public int getBno(int rno) {
		return sql.selectOne(NameSpace + ".getBno", rno);
	}
	
}
