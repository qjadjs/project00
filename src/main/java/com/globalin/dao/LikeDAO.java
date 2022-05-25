package com.globalin.dao;

public interface LikeDAO {

	void updateLike(int bno);
	
	void updateLikeCancel(int bno);
	
	void insertLike(int bno,String userId);
	
	void deleteLike(int bno,String userId);
	
	int likeCheck(int bno,String userId);
	
	void updateLikeCheck(int bno,String userId);
	
	void updateLikeCheckCancel(int bno,String userId);
	
}
