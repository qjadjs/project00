<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN PAGE</title>
</head>
<body>
	<form action="/login" method="post">
		<div>
			<input type="text" name="userid" placeholder="아아디">
		</div>
		<div>
			<input type="password" name="userpw" placeholder="비밀번호">
		</div>
		<div>
			<input type="checkbox" id="remember"> <label for="remember">
				Remember Me </label>
		</div>
		<div>
			<button type="submit">Login</button>
		</div>
	</form>
	<p class="mb-1">
		<a href="#">비밀번호가 기억나지 않습니다.</a>
	</p>
	<p class="mb-0">
		<a href="/user/register">신규가입하기</a>
	</p>
</body>
</html>