package com.globalin.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.globalin.domain.SelectVO;

@Repository
public class SelectDAOImpl implements SelectDAO {
	
	private static final String NameSpace = "mappers.select.SelectMapper";

	private Logger log = LoggerFactory.getLogger(SelectDAOImpl.class);

	private final SqlSession sqlSession;

	@Inject
	public SelectDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void updateSelect(int bno) throws Exception {
		sqlSession.update(NameSpace + ".updateSelect", bno);
	}

	@Override
	public void updateSelectCancel(int bno) throws Exception {
		sqlSession.update(NameSpace + ".updateSelectCancel", bno);
	}

	@Override
	public void insertSelect(int bno, String userId, String stype) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		map.put("stype", stype);
		sqlSession.insert(NameSpace + ".insertSelect", map);
	}

	@Override
	public void deleteSelect(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		sqlSession.delete(NameSpace + ".deleteSelect", map);
	}

	@Override
	public int selectCheck(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		return sqlSession.selectOne(NameSpace + ".selectCheck", map);
	}

	@Override
	public void updateSelectCheck(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		sqlSession.update(NameSpace + ".updateSelectCheck", map);
	}

	@Override
	public void updateSelectCheckCancel(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		sqlSession.update(NameSpace + ".updateSelectCheckCancel", map);
	}
	
	@Override
	public SelectVO selectType(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		return sqlSession.selectOne(NameSpace + ".selectType", map);
	}

	@Override
	public int selectCountCheck(int bno, String stype) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("bno", bno);
		return sqlSession.selectOne(NameSpace + ".selectCountCheck", map);
	}
	
	@Override
	public int selectAllCount(int bno) throws Exception {
		return sqlSession.selectOne(NameSpace + ".selectAllCount", bno);
	}
	
}
