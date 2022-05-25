package com.globalin.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAOImpl implements LikeDAO{
	
	private static final String NameSpace = "mappers.like.likeMapper";

	private Logger log = LoggerFactory.getLogger(LikeDAOImpl.class);

	private final SqlSession sqlSession;

	@Inject
	public LikeDAOImpl(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}

	@Override
	public void updateLike(int bno) throws Exception {
		sqlSession.update(NameSpace + ".updateLike" , bno);
	}

	@Override
	public void updateLikeCancel(int bno) throws Exception {
		sqlSession.update(NameSpace + ".updateLikeCancel", bno);
	}

	@Override
	public void insertLike(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		sqlSession.insert(NameSpace + ".insertLike", map);
	}

	@Override
	public void deleteLike(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		sqlSession.delete(NameSpace + ".deleteLike", map);
	}

	@Override
	public int likeCheck(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		return sqlSession.selectOne(NameSpace + ".likeCheck", map);
	}

	@Override
	public void updateLikeCheck(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		sqlSession.update(NameSpace + ".updateLikeCheck", map);
	}

	@Override
	public void updateLikeCheckCancel(int bno, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bno", bno);
		sqlSession.update(NameSpace + ".updateLikeCheckCancel", map);
	}

}
