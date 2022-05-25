package com.globalin.dao;

public interface LikeDAO {

	void updateLike(int bno) throws Exception;
	
	void updateLikeCancel(int bno) throws Exception;
	
	void insertLike(int bno,String userId) throws Exception;
	
	void deleteLike(int bno,String userId) throws Exception;
	
	int likeCheck(int bno,String userId) throws Exception;
	
	void updateLikeCheck(int bno,String userId) throws Exception;
	
	void updateLikeCheckCancel(int bno,String userId) throws Exception;
	
}
