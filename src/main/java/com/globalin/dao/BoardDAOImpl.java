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

import com.globalin.domain.BoardVO;
import com.globalin.domain.Criteria;


@Repository
public class BoardDAOImpl implements BoardDAO {

	private static final String NameSpace = "mappers.board.boardMapper";

	private Logger log = LoggerFactory.getLogger(BoardDAOImpl.class);

	private final SqlSession sqlSession;

	@Inject
	public BoardDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void create(BoardVO board) throws Exception {
		log.info("게시물 등록...");
		sqlSession.insert(NameSpace + ".create", board);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		log.info("게시물 조회...");
		return sqlSession.selectOne(NameSpace + ".read", bno);
	}

	@Override
	public boolean update(BoardVO board) throws Exception {
		log.info("게시물 수정...");
		return sqlSession.update(NameSpace + ".update", board) == 1;
	}

	@Override
	public boolean delete(int bno) throws Exception {
		log.info("게시물 삭제...");
		return sqlSession.delete(NameSpace + ".delete", bno) == 1;
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		log.info("리스트 조회...");
		return sqlSession.selectList(NameSpace + ".listAll");
	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		log.info("리스트 페이지 조회...");
		return sqlSession.selectList(NameSpace + ".getListWithPaging", cri);
	}
	
	@Override
	public List<BoardVO> getListWithPagingWithType(Criteria cri, int btype) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("cri", cri);
		paramMap.put("btype", btype);
		return sqlSession.selectList(NameSpace + ".getListWithPagingWithType", paramMap);
	}

	@Override
	public void insertSelectKey(BoardVO board) {
		log.info("");
		sqlSession.insert(NameSpace + ".insertSelectKey", board);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		log.info("");
		return sqlSession.selectOne(NameSpace + ".getTotalCount", cri);
	}

	@Override
	public void updateReplyCnt(int bno, int amount) {
		log.info("댓글 수 증가...");
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		sqlSession.update(NameSpace + ".updateReplyCnt", paramMap);
	}

	@Override
	public void updateViewCnt(int bno) {
		log.info("조회수 증가...");
		sqlSession.update(NameSpace + ".updateViewCnt", bno);
	}

	@Override
	public List<BoardVO> userBoardList(String userId) throws Exception {
		return sqlSession.selectList(NameSpace +".userBoardList", userId);
	}

}
