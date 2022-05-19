<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN PAGE</title>
<link href="/resources/css/styles.css" rel="stylesheet" />
</head>
<body class="login-body">
	<form class="login-joinForm" action="/login" method="post">
	<div class="login-div">
		<div>
			<input type="text" name="userid" class="login-id" placeholder="아이디">
		</div>
		<div>
			<input type="password" name="userpw" class="login-pw" placeholder="비밀번호">
		</div>
		<div class="login-remember">
			<input type="checkbox" id="remember"> <label for="remember">
				Remember Me </label>
		</div>
		<div >
			<input class="login-join" type="submit" value="L O G I N"/>
		</div>
	<p class="mb-1">
		<a href="#">비밀번호가 기억나지 않습니다.</a>
	</p>
	<p class="mb-0">
		<a href="/user/register">신규가입하기</a>
	</p>
	</div>
	</form>
</body>

</html>