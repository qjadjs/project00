<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Password</title>
<link href="/resources/css/updatepassword.css" rel="stylesheet" />
</head>
<body>
<fieldset class=b1>
<legend class=c1>비밀번호 변경</legend>
<form method="post" class="form-signin" action="update_password" name="findform">

		<!-- 이름과 비밀번호가 일치하지 않을 때 -->
		<c:if test="${check == 0 }">
		<div class="form-label-group">
		<input type="hidden" id="userId" name="userId" value="${userId }">
		

			<div class=d1>비밀번호</div>

			<input type="password" id="userPw" name="userPw" class="form-control"/>
		</div>
		
		<div class="form-label-group">

			<div class=d1>비밀번호 확인</div>
			<input type="password" id="passwordConfrim" name="passwordConfrim" class="form-control"/>
		</div>
		
		<div class="form-label-group">
				<input class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="변경" onclick="updatePassword()">
			</div>
		</c:if>

	</form>
	</fieldset>
	<script type="text/javascript">
		function updatePassword() {
			var patext = document.getElementById("userPw");
			var cpatext = document.getElementById("passwordConfrim");
			var idtext = document.getElementById("userId");
			var id = idtext.value;
			var password = patext.value;//비밀번호 박스에 쓰여진 값을 대입
			var cpassword = cpatext.value;
			var regExp1 = /^[a-zA-Z0-9]{4,12}$/;
			
			if(document.findform.userPw.value==""){
				alert("비밀번호를 입력해주세요.");
				document.findform.userPw.focus();
			}else if (!regExp1.test(password)) {
					alert("형식에 맞춰 비밀번호를 입력하세요");
					patext.value = "";
					patext.focus();
					return false;
				} else if (!(cpassword.slice(0, cpassword.length) === password
						.slice(0, password.length)))//slice함수는 배열에쓴다 배열에 담긴 시작,원하는 지점 까지의 문자를 반환한다cpqssword배열의 0번쨰부터 배열 길이만큼에있는 문자열을 반환하겠단 이야기 "==="는 타입까지 비교해서 같으면 트룽를 반환한다. 그러니깐 어느한쪽이 정수고 한쪽이 문자열이면 
				{//비밀번호가 같은지 확인한다. 유효성 검사 통과 못했을때
					alert("비밀번호가 동일하지 않습니다.");
					cpatext.value = "";
					cpatext.focus();
					return false;
		}else if ((cpassword.slice(0, cpassword.length) === id.slice(0,
				id.length))) {//비밀번호끼리 비교해서 트루가나오면 일로온다 아이디의 문자열과 비밀번호를 비교한다.    유효성 검사 통과 못했을때
			alert("비밀번호가 ID랑 같으면 안됩니다.");
			patext.value = "";
			patext.focus();
			cpatext.value = "";
			cpatext.focus();
			return false;
			//유효성 검사를 통과못하면 비밀번호,비번확인까지 초기화시킨다. 
		} else {
			document.findform.action="update_password";
			document.findform.submit();
		}
			 
		}
	</script>
</body>
</html>