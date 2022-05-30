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
<link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
<!-- Bootstrap icons-->

<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/header2.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />

</head>
<body>
<!-- 헤더jsp -->
  <%@include file ="../views/board/Header.jsp" %>
  
   <!-- Header-->
   <header class="bg-dark py-5">
      <div class="container px-4 px-lg-5 my-5">
      </div>
<!--container {-->
<section id="container">

    <div class="slideNum">
        <span id="thisSlide">0</span> / <span id="allSlide">0</span>
    </div>

    <article class="slides">
        <img src="https://img.freepik.com/free-vector/like-and-dislike-thumbs-up-and-thumbs-down-icons_97458-346.jpg" 
  weight="300px" height="300px">
    </article><!--1-->
    <article class="slides">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEq0blvA6B15GKfkb8zudaGhN2-avN5tJ8Mg&usqp=CAU" 
 weight="50%" height="300px">
    </article><!--2-->
    <article class="slides">
        <img src="https://img.insight.co.kr/static/2021/05/23/700/img_20210523191929_qro3e7dd.webp" 
  weight="300px" height="300px">
    </article><!--3-->
    <article class="slides">
        <img src="https://i.ytimg.com/vi/hitdMH59wIE/maxresdefault.jpg" 
  weight="300px" height="300px">
    </article><!--4-->
    <article class="slides">
        <img src="https://t1.daumcdn.net/cfile/tistory/0119ED34507AC0E729" 
  weight="300px" height="300px">
    </article><!--4-->
    
    <div class="arrow prev" onclick = "prevNext(-1)">&#10096;</div>
<div class="arrow next" onclick = "prevNext(1)">&#10097;</div> 
</section><!-- } container-->

<!--pager {-->
<section id="pager">
    <span class="dots on" onclick="currentSlide(1)"></span>
    <span class="dots" onclick="currentSlide(2)"></span>
    <span class="dots" onclick="currentSlide(3)"></span>
    <span class="dots" onclick="currentSlide(4)"></span>
    <span class="dots" onclick="currentSlide(5)"></span>
    <div></div>
    <input class="slideStopStart" type="button" value="STOP" onclick="stopSlide()"/>
<input class="slideStopStart" type="button" value="&#9654;" onclick="showSlides()"/>
</section><!--pager }-->



<br>

<div style="text-align:center" >
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 
</div>
   </header>
   <!-- Section-->
   <section class="py-5">
      <div class="container">
         <div
            class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                  <!-- Product image-->
                  <a href="board.list">
                  <button type="button" class="cardbutton">
                        <img id="img1"
                        src="resources/assets/q11.jpg"
                        onmouseover="this.src='resources/assets/q12.gif'"
                        onmouseout="this.src='resources/assets/q11.jpg'">
                  </button>
                  </a>

               </div>
         </div>
   </section>
   
   
  <!-- 푸터jsp -->
  <%@include file ="../views/board/Footer.jsp" %>
  
   <!-- Bootstrap core JS-->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->

   <script src="resources/js/scripts.js"></script>
   <script src="resources/js/animation.js"></script>
</body>
</html>