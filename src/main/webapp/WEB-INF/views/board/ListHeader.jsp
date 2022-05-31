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
      <img class="list-img" src="/resources/assets/t11.png" style="width:70px; height:60px;">   
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