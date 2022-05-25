package com.globalin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyVO;


public interface ReplyDAO {

<<<<<<< HEAD
	void insert(ReplyVO vo) throws Exception;
=======
	public void insert(ReplyVO vo)throws Exception;
>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git

<<<<<<< HEAD
	ReplyVO read(int bno) throws Exception;
=======
	public List<ReplyVO> read(int bno)throws Exception;
>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git

	void delete(int rno) throws Exception;

	void update(ReplyVO vo) throws Exception;

	List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") int bno);

	int getCountByBno(int bno);
	
	int getBno(int rno);
	
}
