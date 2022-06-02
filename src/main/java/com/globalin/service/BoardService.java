package com.globalin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.globalin.domain.BoardVO;
import com.globalin.domain.Criteria;

public interface BoardService {
	void create(BoardVO board) throws Exception;

	BoardVO read(int bno) throws Exception;

	boolean update(BoardVO board) throws Exception;

	boolean delete(int bno) throws Exception;

	List<BoardVO> listAll() throws Exception;

	void insertSelectKey(BoardVO board);

	List<BoardVO> getList(Criteria cri);

	int getTotalCount(Criteria cri);

	void updateReplyCnt(@Param("bno") int bno, @Param("amount") int amount);

	void updateViewCnt(int bno);
	
	List<BoardVO> userBoardList(String userId) throws Exception;
}
