<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REGISTER PAGE</title>
</head>
<body>
<div></div>
<form action="register" method="post">
	<input type="text" name="userid" placeholder="아이디">
	<input type="password" name="userpw" placeholder="비밀번호">
	<input type="password" placeholder="비밀번호 확인">
	<input type="text" name="name" placeholder="이름">
	<input type="text" name="email" placeholder="E-Mail">
	<input type="submit" value="회원가입">
	<input type="reset" value="다시 작성">
</form>
</body>
</html>