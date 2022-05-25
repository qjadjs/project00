package com.globalin.dao;

import java.util.Date;

import com.globalin.domain.LoginDTO;
import com.globalin.domain.UserVO;

public interface UserDao {

	// 회원가입처리
	public void register(UserVO userVO) throws Exception;

	// 로그인 처리
	public UserVO login(LoginDTO loginDTO) throws Exception;

	// 로그인 유지 처리
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;

	// 세션키 검증
	public UserVO checkUserWithSessionKey(String value) throws Exception;
	
	// 로그인 일자 갱신
	public void updateLoginDate(String userId) throws Exception;

	//R: 회원 정보 조회 - 사용자 ID 해당하는 정보 가져오기
		public UserVO readMember(String userid) throws Exception;
		
		//R: 회원 정보 조회 - ID,PW정보에 해당하는 사용자 정보
		public UserVO readMemberWithIDPW(String userid,String userpw) throws Exception;

		//U: 회원정보수정
		public void updateMember(UserVO userVO) throws Exception;
	
	// 회원탈퇴
	public void deleteMember(UserVO userVO) throws Exception;
	
	//아이디 중복체크
	public UserVO idOverlap(String userId) throws Exception;
}
