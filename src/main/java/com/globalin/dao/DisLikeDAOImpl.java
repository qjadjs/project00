package com.globalin.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class DisLikeDAOImpl implements DisLikeDAO {
	private static final String NameSpace = "mappers.like.dislikeMapper";

	private Logger log = LoggerFactory.getLogger(DisLikeDAOImpl.class);

	private final SqlSession sqlSession;

	@Inject
	public DisLikeDAOImpl(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}

	@Override
	public void updateDisLike(int bno) throws Exception {
		sqlSession.update(NameSpace + ".updateDisLike" , bno);
	}

	@Override
	public void updateDisLikeCancel(int bno) throws Exception {
		sqlSession.update(NameSpace + ".updateDisLikeCancel", bno);
	}

	@Override
	public void insertDisLike(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		sqlSession.insert(NameSpace + ".insertDisLike", map);
	}

	@Override
	public void deleteDisLike(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		sqlSession.delete(NameSpace + ".deleteDisLike", map);
	}

	@Override
	public int DislikeCheck(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		return sqlSession.selectOne(NameSpace + ".DislikeCheck", map);
	}

	@Override
	public void updateDisLikeCheck(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		sqlSession.update(NameSpace + ".updateDisLikeCheck", map);
	}

	@Override
	public void updateDisLikeCheckCancel(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		sqlSession.update(NameSpace + ".updateDisLikeCheckCancel", map);
	}

}
