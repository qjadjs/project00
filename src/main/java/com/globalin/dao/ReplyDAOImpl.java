package com.globalin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	private static final String NameSpace = "mappers.reply.replyMapper";

	private Logger log = LoggerFactory.getLogger(ReplyDAOImpl.class);

	@Inject SqlSession sql;

	
	

	@Override
	public void insert(ReplyVO vo) {

		sql.insert(NameSpace + ".", vo);
	}

	@Override
	public List<ReplyVO> read(int bno) throws Exception {
		return sql.selectList(NameSpace + ".read", bno);
	}

	@Override
	public void delete(int rno) {
		sql.delete(NameSpace + ".delete", rno);
	}

	@Override
	public void update(ReplyVO vo) {
		sql.update(NameSpace + ".update", vo);
	}

	@Override
	public List<ReplyVO> getListWithPaging(Criteria cri, int bno) {
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("cri", cri);
		log.info("cri : " + cri);
		paramMap.put("bno", bno);
		return sql.selectList(NameSpace + ".getListWithPaging", paramMap);
	}

	@Override
	public int getCountByBno(int bno) {
		return sql.selectOne(NameSpace + ".getCountByBno", bno);
	}
	
	@Override
	public int getBno(int rno) {
		return sql.selectOne(NameSpace + ".getBno", rno);
	}
	
}
