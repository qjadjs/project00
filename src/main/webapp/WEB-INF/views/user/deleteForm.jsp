<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<fieldset>
	<legend>ȸ��Ż��</legend>
	<form action="/user/delete" method="post">
	<!-- inputŸ���� hidden�� ȭ�鿡 �ִ� �ش� input�±׸� ���ܼ� ���� ����   -->
		���̵� : <input type="text" name="userId" value="${user.userId }" readonly><br>
		��й�ȣ : <input type="password" name="userPw"><br>
		<input type="submit" class="btn" value="Ż���ϱ�">
		<input type="button" class="btn" value="�ڷΰ���" onclick="location.href='/'">
	</form>
</fieldset>
</body>
</html>