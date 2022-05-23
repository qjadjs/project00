<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fieldset>
<legend>회원정보보기</legend>
<form>
아이디 <input type="text" name="userId" value="${user.userId }" readonly><br>
비밀번호 <input type="text" name="userPw" value="${user.userPw }" readonly><br>
이름 <input type="text" name="userName" value="${user.userName } "><br>
		이메일 <input type="text" name="email" value="${user.userEmail }"><br>
		<ul>
		<li><b>가입일자</b> 
						${user.userJoinDate} </li>
						<li ><b>최근 로그인 일자</b>
						${user.userLoginDate} </li>
						</ul>
		<input type="button" class="btn" value="메인으로" onclick="location.href='/'">
		<input type="button" value="회원정보수정" class="btn" onclick="location.href='/user/update'">
	<input type="button" value="로그아웃" class="btn" onclick="location.href='/user/logout'">
	<input type="button" value="회원탈퇴" class="btn" onclick="location.href='/user/delete'">
</form>
</fieldset>
</body>
</html>