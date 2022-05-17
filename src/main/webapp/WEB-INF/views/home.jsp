<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>밸런스</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->

<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">밸런스</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">


					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Home</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">1:1문의</a></li>
							<li><a class="dropdown-item" href="#!">고객센터</a></li>
						</ul>
						</li>
				</ul>
				<form class="login-btn">
					<button class="btn btn-outline-dark" type="submit" ><a href = "logins.jsp" style="text-decoration:none">로그인</button>
				</form>
				<form class="register-btn">
					<button class="btn btn-outline-dark" type="submit" ><a href = "http://localhost:9090/user/register" style="text-decoration:none">회원가입</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">밸런스 게임</h1>
				<p class="lead fw-normal text-white-50 mb-0">
					<marquee scrollamount=18 behavior=alternate>당신은 무엇을 고르겠는가</marquee>
				</p>
			</div>
		</div>
	</header>
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-500">
						<!-- Product image-->
						<button type="button">
							<a href="https://www.naver.com/">
								<!--예시 링크--> <img class="card-img-top"
								src="https://dcimg5.dcinside.com/dccon.php?no=62b5df2be09d3ca567b1c5bc12d46b394aa3b1058c6e4d0ca41648b650e9236ecd89043a73287f261a79511ddeb1e46b2f971b4bc98e572090524f272e4a333441ea96c35a9a74276df6d64d"
								onmouseover="this.src='https://dcimg5.dcinside.com/dccon.php?no=62b5df2be09d3ca567b1c5bc12d46b394aa3b1058c6e4d0ca41648b650e9236ecd89043a73287f261a79511ddeb1e46b2f971b4bc98e572090524f272e4a333441ea96c35a9a74246de1d14c'"
								onmouseout="this.src='https://dcimg5.dcinside.com/dccon.php?no=62b5df2be09d3ca567b1c5bc12d46b394aa3b1058c6e4d0ca41648b650e9236ecd89043a73287f261a79511ddeb1e46b2f971b4bc98e572090524f272e4a333441ea96c35a9a74276df6d64d'">
							</a>
						</button>


						<!-- Product details-->

						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-1 bg-transparent">

						</div>
					</div>

				</div>
			</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Globalin &copy; Your
				Website 2022</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->

	<script src="resources/js/scripts.js"></script>

</body>
</html>