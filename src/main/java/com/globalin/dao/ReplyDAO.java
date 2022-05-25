package com.globalin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyVO;


public interface ReplyDAO {

	void insert(ReplyVO vo) throws Exception;

	ReplyVO read(int bno) throws Exception;

	void delete(int rno) throws Exception;

	void update(ReplyVO vo) throws Exception;

	List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") int bno);

	int getCountByBno(int bno);
	
	int getBno(int rno);
	
}
