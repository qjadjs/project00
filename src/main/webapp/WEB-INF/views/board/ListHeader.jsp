<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color : #212529;">
      <div class="container px-4 px-lg-5">
      <a href="/">
      <img class="list-img"src="https://dcimg5.dcinside.com/dccon.php?no=62b5df2be09d3ca567b1c5bc12d46b394aa3b1058c6e4d0ca41648b65ce32d6e65e714e848ae41bc91315a71418163400b6306535fa937047d583cf00dfe6b5e3816d38f431c50" style="width:50px; height:50px;">   
         </a>
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent" style="padding : 3rem">
    
            <div class="register-header">
           <c:choose>
					<c:when test="${empty login.userId }">				
						<form class="list-login-btn">
							<button class="btn btn-outline-dark" type="submit" style="color: black; border-color:white; ">
								<a href="/user/login" style="text-decoration: none; color: white; ">로그인</a>
							</button>
						</form>
					
						
						<form class="list-register-btn">
							<button class="btn btn-outline-dark" type="submit" style="margin-left:5px;" >
								<a href="/user/register" style="text-decoration: none ; color: white;"  >회원가입</a>
							</button>
						</form>
					</c:when>
					<c:otherwise>
							<form class="list-logout-btn">
							<button class="btn btn-outline-dark" type="submit">
								<a href="/user/logout" style="text-decoration: none; color: white;">로그아웃</a>
							</button>
						</form>
						<form class="list-register-btn">
							<button class="btn btn-outline-dark" type="submit" style="margin-left:5px;">
								<a href="/user/info" style="text-decoration: none; color: white;">회원정보</a>
							</button>
						</form>
						
					</c:otherwise>
				</c:choose>
				</div>
				</div>	
         </div>
   </nav>
      <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>