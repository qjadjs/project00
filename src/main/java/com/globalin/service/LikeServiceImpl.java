package com.globalin.service;

import org.springframework.stereotype.Service;

import com.globalin.dao.LikeDAO;


@Service
public class LikeServiceImpl implements LikeService {
	
	private final LikeDAO likeDao;
	
	public LikeServiceImpl(LikeDAO likeDao) {
		this.likeDao = likeDao;
	}
	
	@Override
	public void updateLike(int bno) throws Exception {
		likeDao.updateLike(bno);
	}

	@Override
	public void updateLikeCancel(int bno) throws Exception {
		likeDao.updateLikeCancel(bno);
	}

	@Override
	public void insertLike(int bno, String userId) throws Exception {
		likeDao.insertLike(bno, userId);
	}

	@Override
	public void deleteLike(int bno, String userId) throws Exception {
		likeDao.deleteLike(bno, userId);
	}

	@Override
	public int likeCheck(int bno, String userId) throws Exception {
		return likeDao.likeCheck(bno, userId);
	}

	@Override
	public void updateLikeCheck(int bno, String userId) throws Exception {
		likeDao.updateLikeCheck(bno, userId);
	}

	@Override
	public void updateLikeCheckCancel(int bno, String userId) throws Exception {
		likeDao.updateLikeCheckCancel(bno, userId);
	}
}
	
