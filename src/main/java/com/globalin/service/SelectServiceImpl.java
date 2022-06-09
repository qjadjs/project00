package com.globalin.service;

import org.springframework.stereotype.Service;

import com.globalin.dao.SelectDAO;
import com.globalin.domain.SelectVO;

@Service
public class SelectServiceImpl implements SelectService {

	private final SelectDAO selectDao;

	public SelectServiceImpl(SelectDAO selectDao) {
		this.selectDao = selectDao;
	}

	@Override
	public void updateSelect(int bno) throws Exception {
		selectDao.updateSelect(bno);
	}

	@Override
	public void updateSelectCancel(int bno) throws Exception {
		selectDao.updateSelectCancel(bno);
	}

	@Override
	public void insertSelect(int bno, String userId, String stype) throws Exception {
		selectDao.insertSelect(bno, userId, stype);
	}

	@Override
	public void deleteSelect(int bno, String userId) throws Exception {
		selectDao.deleteSelect(bno, userId);
	}

	@Override
	public int selectCheck(int bno, String userId) throws Exception {
		return selectDao.selectCheck(bno, userId);
	}

	@Override
	public void updateSelectCheck(int bno, String userId) throws Exception {
		selectDao.updateSelectCheck(bno, userId);
	}

	@Override
	public void updateSelectCheckCancel(int bno, String userId) throws Exception {
		selectDao.updateSelectCheckCancel(bno, userId);
	}

	@Override
	public SelectVO selectType(int bno, String userId) throws Exception {
		return selectDao.selectType(bno, userId);
	}
	
	@Override
	public int selectCountCheck(int bno, String stype) throws Exception {
		return selectDao.selectCountCheck(bno, stype);
	}
	
	@Override
	public int selectAllCount(int bno) throws Exception {
		return selectDao.selectAllCount(bno);
	}
}
