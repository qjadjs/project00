<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/updateForm.css" rel="stylesheet" />
</head>
<body>
<fieldset  class=b1>
<legend class=c1>회원정보수정</legend>
   <form class=d1 action="/user/update" method="post" onsubmit="return checked()">
      아이디 <input type="text" name="userId" class="id" id="userId" value="${user.userId}" readonly><br>
      비밀번호 <input type="text" name="userPw" class="pw" autocomplete='off' id="password" value="${user.userPw}" onfocus="this.value=''" ><br>
      비밀번호 확인<input type="password" autocomplete='off' name="passwordConfrim" class="pw"
               id="passwordConfirm" placeholder="비밀번호  확인"><br>
      이름 <input type="text" name="userName" autocomplete='off' class="name" id="userName" value="${user.userName} " onfocus="this.value=''"><br>
      이메일 <input type="text" autocomplete='off' name="userEmail" class="email" id="userEmail" value="${user.userEmail}" onfocus="this.value=''"><br>
      <div class=btn-div>
      <input type="submit" class="btn" value="회원정보수정하기"> 
      </div>
   </form>
</fieldset>
</body>
<script type="text/javascript">
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
   }
}
</script>
</html>