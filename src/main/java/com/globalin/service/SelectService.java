package com.globalin.service;

import com.globalin.domain.SelectVO;

public interface SelectService {
	
	void updateSelect(int bno) throws Exception;

	void updateSelectCancel(int bno) throws Exception;

	void insertSelect(int bno, String userId, String stype) throws Exception;

	void deleteSelect(int bno, String userId) throws Exception;

	int selectCheck(int bno, String userId) throws Exception;

	void updateSelectCheck(int bno, String userId) throws Exception;

	public void updateSelectCheckCancel(int bno, String userId) throws Exception;
	
	SelectVO selectType(int bno, String userId) throws Exception;

	int selectCountCheck(int bno, String stype) throws Exception;
	
	int selectAllCount(int bno) throws Exception;
}