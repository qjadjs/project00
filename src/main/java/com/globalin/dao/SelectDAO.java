package com.globalin.dao;

import com.globalin.domain.SelectVO;

public interface SelectDAO {

	void updateSelect(int bno) throws Exception;
	
	void updateSelectCancel(int bno) throws Exception;
	
	void insertSelect(int bno,String userId, String stype) throws Exception;
	
	void deleteSelect(int bno,String userId) throws Exception;
	
	int selectCheck(int bno,String userId) throws Exception;
	
	void updateSelectCheck(int bno,String userId) throws Exception;
	
	void updateSelectCheckCancel(int bno,String userId) throws Exception;
	
	SelectVO selectType(int bno, String userId) throws Exception;
	
	int selectCountCheck(int bno, String stype) throws Exception;
	
	int selectAllCount(int bno) throws Exception;
	
	void updateSelectAtype(int bno) throws Exception;
	
	void updateCancelA(int bno) throws Exception;
	
	void updateSelectBtype(int bno) throws Exception;
	
	void updateCancelB(int bno) throws Exception;
}
