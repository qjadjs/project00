<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<fieldset>
<legend>ȸ����������</legend>
	<form action="/user/update" method="post">
		���̵� <input type="text" name="userId" value="${user.userId }" readonly><br>
		��й�ȣ <input type="password" name="userPw" value="${user.userPw }" ><br>
		�̸� <input type="text" name="userName" value="${user.userName } "><br>
		�̸��� <input type="text" name="userEmail" value="${user.userEmail }"><br>
		<input type="submit" class="btn" value="ȸ�����������ϱ�">
		<input type="button" class="btn" value="��������" onclick="location.href='/'">
	</form>
</fieldset>
</body>
</html>