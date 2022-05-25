package com.globalin.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;

@Repository
public class UserDaoImpl implements UserDao {

	private static final String NAMESPACE = "mappers.user.UserMapper";

	private SqlSession sqlSession;

	@Autowired
	public UserDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 회원가입 처리
	@Override
	public void register(UserVO userVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".register", userVO);
	}

	// 로그인처리
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		System.out.println("DAOloginVO" + loginDTO.getUserPw());
		return sqlSession.selectOne(NAMESPACE + ".login", loginDTO);
	}

	// 로그인 유지 처리
	@Override
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", userId);
		paramMap.put("sessionId", sessionId);
		paramMap.put("sessionLimit", sessionLimit);
		sqlSession.update(NAMESPACE + ".keepLogin", paramMap);

	}

	// 세션키 검증
	@Override
	public UserVO checkUserWithSessionKey(String value) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkUserWithSessionKey", value);
	}

	
	//회원정보 삭제
	@Override
	public void deleteMember(UserVO userVO) throws Exception {
		int check = sqlSession.delete(NAMESPACE+".deleteMember", userVO);
		System.out.println("DAO : deleteMember() "+check);	
		
	}

	@Override
	public UserVO readMember(String userid) throws Exception {
		//테스트(컨트롤러) 호출 -> 정보를 저장 -> DB로이동
		UserVO userVO = sqlSession.selectOne(NAMESPACE+".readMember", userid); //괄호안의 물음표를 콤마뒤에 쓰는거임
		return userVO;
	}

	@Override
	public UserVO readMemberWithIDPW(String userid, String userpw) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(UserVO userVO) throws Exception {
		sqlSession.update(NAMESPACE+".updateMember", userVO);
		
	}

	@Override
	public UserVO idOverlap(String userId) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".idOverlap", userId);	
	}

	@Override
	public void updateLoginDate(String userId) throws Exception {
		sqlSession.update(NAMESPACE + ".updateLoginDate", userId);
		
	}

}
