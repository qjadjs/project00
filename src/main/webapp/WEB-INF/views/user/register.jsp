<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REGISTER PAGE</title>
</head>
<body>
	<form action="/register" method="post">
<fieldset>
<legend>회원가입</legend>
		<table>
			<tr>
				<td><input type="text" name="userId" placeholder="아이디">
				<input type="button" onclick="idOverlap()" value="중복확인"/>
				</td>
				
			</tr>
			<tr>
				<td><input type="text" name="userName" placeholder="이름 "></td>
			</tr>
			<tr>
				<td><input type="password" name="userPw" id="password"
					placeholder="비밀번호"></td>
			</tr>
			 <tr>
				<td><input type="password" name="passwordConfrim" id="passwordConfirm" placeholder="비밀번호  확인" onkeyup="passConfirm()"> <span id ="confirmMsg"></span></td>
			</tr>
			<tr>
				<td><input type="email" name="userEmail" placeholder="이메일">
				</td>
			</tr>
		</table>
		<input type="submit" value="회원가입"> 
		<input type="reset" value="리셋">
	</fieldset>
	</form>
	
	<script type="text/javascript">

	function passConfirm() {
	/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
		var password = document.getElementById('password');					//비밀번호 
		var passwordConfirm = document.getElementById('passwordConfirm');	//비밀번호 확인 값
		var confrimMsg = document.getElementById('confirmMsg');				//확인 메세지
		var correctColor = "#00ff00";	
		var wrongColor ="#ff0000";	
		
		if(password.value == passwordConfirm.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			confirmMsg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		}else{
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML ="비밀번호 불일치";
		}
	}
	/*function idOverlap(){
		console.log("idOverlap 호출")
		console.log("아이디 입력 값 : "+ register.userId.value)
	$.ajax({
		type :"post",
		url :"idOverlap",
		data : {"id" : register.userId.value},
		 JSON형식 안에 JSON 형식으로 표현한 데이터. 
        "파라미터 이름" : 폼태그에 적은 NAME 값.ID입력창의 NAME값.value 여러 개도 가능
		data :{	"id" : joinForm.id.value, 
		"id1" : joinForm.password.value}, 이렇게도 사용 가능.					
		
		dataType : "text",
		success : function(data){	
			if(data=="1"){
				alert("이 아이디는 사용 가능합니다.");
			}else{
				alert("이 아이디는 사용  불가능합니다.");
			}
		},
		error : function(){
			alert("아이디 중복 확인 ajax 실행 실패");
		}
	});
	} */
</script>
</body>

</html>