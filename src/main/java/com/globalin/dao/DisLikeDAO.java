package com.globalin.dao;

public interface DisLikeDAO {
	
	void updateDisLike(int bno) throws Exception;

	void updateDisLikeCancel(int bno) throws Exception;

	void insertDisLike(int bno, String userId) throws Exception;

	void deleteDisLike(int bno, String userId) throws Exception;

	int DislikeCheck(int bno, String userId) throws Exception;

	void updateDisLikeCheck(int bno, String userId) throws Exception;

	void updateDisLikeCheckCancel(int bno, String userId) throws Exception;
}
