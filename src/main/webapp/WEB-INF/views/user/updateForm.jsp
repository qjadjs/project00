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
<legend>회원정보수정</legend>
	<form action="/user/update" method="post">
		아이디 <input type="text" name="userId" value="${user.userId }" readonly><br>
		비밀번호 <input type="password" name="userPw" value="${user.userPw }" ><br>
		이름 <input type="text" name="userName" value="${user.userName } "><br>
		이메일 <input type="text" name="userEmail" value="${user.userEmail }"><br>
		<input type="submit" class="btn" value="회원정보수정하기">
		<input type="button" class="btn" value="메인으로" onclick="location.href='/'">
	</form>
</fieldset>
</body>
</html>