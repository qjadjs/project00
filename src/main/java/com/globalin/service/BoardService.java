package com.globalin.service;

import java.util.List;

import com.globalin.domain.BoardVO;
import com.globalin.domain.Criteria;

public interface BoardService {

	public void register(BoardVO board);

	public BoardVO get(int bno);

	public boolean modify(BoardVO board);

	public boolean remove(int bno);

	public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

}
