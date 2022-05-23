<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>REGISTER PAGE</title>

<link href="/resources/css/styles.css" rel="stylesheet" />
</head>
<body class="register-body">
	<form class="joinForm" action="/user/register" name="register"
		method="post" onsubmit="return checked()">

		<div class="textForm">
			<div class="register-div">
				<input type="text" name="userId" class="id" id="userId"
					placeholder="아이디"> <input type="button"
					onclick="idOverlap()" value="중복확인" class="register-wndqhr"/>
			</div>
			<div class="register-dn">
				<input type="text" name="userName" class="name" id="userName"
					placeholder="이름 ">
			</div>
			<div class="register-dpw">
				<input type="password" name="userPw" class="pw" id="password"
					placeholder="비밀번호">
			</div>
			<div class="register-dpwc">
				<input type="password" name="passwordConfrim" class="pw"
					id="passwordConfirm" placeholder="비밀번호  확인" onkeyup="passConfirm()">
				<span id="confirmMsg"></span>
			</div>
			<div class="register-de">
				<input type="email" class="email" name="userEmail" id="userEmail"
					placeholder="이메일">
			</div>

		</div>
		<div class="register-input">
			<input type="submit" class="register-join" value="J O I N" />
		</div>
	</form>
	
</body>
<script type="text/javascript">
		//아이디 중복체크
		function idOverlap() {
			console.log("idOverlap 호출")
			console.log("아이디 입력 값 : " + register.userId.value)
			$.ajax({
				type : "post",/* 전송 방식 */
				url : "idOverlap", /* 컨트롤러 사용할 때. 내가 보낼 데이터의 주소. */
				data : {
					"userId" : register.userId.value
				},
				dataType : "text",
				  contentType : 'text/plain; charset=utf-8;',
				success : function(data) {
					if (data == "1") {
						alert("이 아이디는 사용 가능합니다.");
					} else { //ajax가 제대로 안됐을 때 .
						alert("이 아이디는 사용  불가능합니다.");
					}
				},
				error : function() {
					alert("아이디 중복 확인 ajax 실행 실패");
				}
			});

		}
		function checked() {
			var idtext = document.getElementById("userId");
			//아이디의 id값
			var patext = document.getElementById("password");
			//비밀번호의 id값
			var cpatext = document.getElementById("passwordConfirm");
			//비밀번호확인의 id값
			var nametext = document.getElementById("userName");
			//이름의 id값
			var mtext = document.getElementById("userEmail");
			//e-mail의 id값

			var id = idtext.value;//id라는 변수에 아이디 박스에서 쓰여진 값을 대입한다.
			var password = patext.value;//비밀번호 박스에 쓰여진 값을 대입
			var cpassword = cpatext.value;
			var mail = mtext.value;
			var name = nametext.value;

			var regExp1 = /^[a-zA-Z0-9]{4,12}$/;//유효성 검사 정규식표현법
			//|| /(정규표현식의 시작,끝) ^(문장시작) [](범위) 소문자a-z대문자A-Z숫자0-9를 포함 ,최소 4,최대 12자 까지 허용한다.
			//아이디 비밀번호 유효성 검사
			var regExp2 = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
			//이메일 유효성검사
			var regname = /^[가-힝]{2,}$/;
			//이름 유효성 검사

			if (!regExp1.test(id))
			//아이디 유효성 검사 후 4~12자의 영문 대소문자와 숫자의 유효성이 안 맞다면
			//공백을 주고 알람을 띄운다.
			//밑에 동일한 유효성 검사
			{
				alert("형식에 맞춰 ID를 입력하세요");
				idtext.value = "";
				idtext.focus();
				return false;
			} else if (!regname.test(name)) {
				alert("바른 이름을 입력해주세요");
				nametext.value = "";
				nametext.focus();
				return false;
			} else if (!regExp1.test(password)) {
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
			} else if ((cpassword.slice(0, cpassword.length) === id.slice(0,
					id.length))) {//비밀번호끼리 비교해서 트루가나오면 일로온다 아이디의 문자열과 비밀번호를 비교한다.    유효성 검사 통과 못했을때
				alert("비밀번호가 ID랑 같으면 안됩니다.");
				patext.value = "";
				patext.focus();
				cpatext.value = "";
				cpatext.focus();
				return false;
				//유효성 검사를 통과못하면 비밀번호,비번확인까지 초기화시킨다. 
			} else if (!regExp2.test(mail)) {
				alert("제대로된 메일이 아닙니다.");
				mtext.value = "";
				mtext.focus();
				return false;
			} else {
				if (checks()) {
					alert("회원가입을 진행합니다.");
					return true;
				} else {//엘스문안의 엘스문
					return false;
				}
			}

		}
	</script>
</html>