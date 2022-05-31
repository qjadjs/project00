package com.globalin.service;

import org.springframework.stereotype.Service;

import com.globalin.dao.DisLikeDAO;


@Service
public class DisLikeServiceImpl implements DisLikeService {
	
	private final DisLikeDAO disLikeDAO;
	
	public DisLikeServiceImpl(DisLikeDAO dislikeDao) {
		this.disLikeDAO = dislikeDao;
	}
	
	@Override
	public void updateDisLike(int bno) throws Exception {
		disLikeDAO.updateDisLike(bno);
	}

	@Override
	public void updateDisLikeCancel(int bno) throws Exception {
		disLikeDAO.updateDisLikeCancel(bno);
	}

	@Override
	public void insertDisLike(int bno, String userId) throws Exception {
		disLikeDAO.insertDisLike(bno, userId);
	}

	@Override
	public void deleteDisLike(int bno, String userId) throws Exception {
		disLikeDAO.deleteDisLike(bno, userId);
	}

	@Override
	public int DislikeCheck(int bno, String userId) throws Exception {
		return disLikeDAO.DislikeCheck(bno, userId);
	}

	@Override
	public void updateDisLikeCheck(int bno, String userId) throws Exception {
		disLikeDAO.updateDisLikeCheck(bno, userId);
	}

	@Override
	public void updateDisLikeCheckCancel(int bno, String userId) throws Exception {
		disLikeDAO.updateDisLikeCheckCancel(bno, userId);
	}
}