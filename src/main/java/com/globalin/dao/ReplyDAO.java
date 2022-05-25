package com.globalin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyVO;


public interface ReplyDAO {

	public void insert(ReplyVO vo)throws Exception;

	public List<ReplyVO> read(int bno)throws Exception;

	void delete(int rno);

	void update(ReplyVO vo);

	List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") int bno);

	int getCountByBno(int bno);
	
	int getBno(int rno);
	
}
