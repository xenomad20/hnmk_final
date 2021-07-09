<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>영화 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/movieStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css">
<script src="resources/js/movie.js"></script>
</head>
<body>
   <h1>hello movie.jsp</h1>
                        
   <div id="contents" >
      <div class="inner-wrap">
         <h2 class="tit">전체영화</h2>
         <div id="tabs">
            <ul>
               <li id="movie-tab"><a href="#tabs-1"><button class="btn" id="boxoffice">박스오피스</button></a></li>
               <li id="movie-tab"><a href="#tabs-2"><button class="btn" id="schedulemovie">상영예정작</button></a></li>
            </ul>
            <br />
            <div id="tabs-1">
                              <div class="movie-list">
                  <ol>
                     <c:forEach var="dto" items="${showList }">
                        <li><img id="poster"
                           src="${pageContext.request.contextPath}/${dto.poster}" alt="" />
                           <div class="movie-detail" id="movie-detail${dto.mno }">
                              <c:set var="path" value="${pageContext.request.contextPath}" />
                              <a class="hover1" href="${path}/detail?mno=${dto.mno}">
                                 <div class="summary">${dto.mintroduction }</div>
                              </a>
                           </div>
                           <div>
                              <img id="filmgrade"
                                 src="${pageContext.request.contextPath}/resources/images/${dto.filmgrade}.PNG"
                                 alt="" />
                              <a href="${path}/detail?mno=${dto.mno}">
                                 <p class="tit">${dto.mtitle }</p>
                              </a>

                           </div>
                           <div>
                              <p>개봉일 ${dto.releasedate }</p>
                           </div></li>
                     </c:forEach>
                  </ol>
               </div>
            </div>
<div id="tabs-2">
               <div class="movie-list">
                  <ol>
                     <c:forEach var="dto" items="${scheduleList }">
                        <li><img id="poster"
                           src="${pageContext.request.contextPath}/${dto.poster}" alt="" />
                           <div class="movie-detail" id="movie-detail${dto.mno }">
                              <c:set var="path" value="${pageContext.request.contextPath}" />
                              <a class="hover1" href="${path}/detail?mno=${dto.mno}">
                                 <div class="summary">${dto.mintroduction }</div>
                              </a>
                           </div>
                           <div>
                              <img id="filmgrade"
                                 src="${pageContext.request.contextPath}/resources/images/${dto.filmgrade}.PNG"
                                 alt="" />
                              <a href="${path}/detail?mno=${dto.mno}">
                                 <p class="tit">${dto.mtitle }</p>
                              </a>

                           </div>
                           <div>
                              <p>개봉일 ${dto.releasedate }</p>
                           </div></li>
                     </c:forEach>
                  </ol>
               </div>
            </div>
            <div class="btn-more">
            <!-- <button type="button" class="btn" id="btnAddMovie">더보기</button> -->
         </div>
      </div>   
   </div>
   <footer class="footer">
      <div class="footer-top">
         <div class="inner-wrap">
            <ul>
               <li><a href="1">a</a></li>
               <li><a href="2">b</a></li>
               <li><a href="3">c</a></li>
               <li><a href="4">d</a></li>
               <li><a href="5">e</a></li>
               <li><a href="6">f</a></li>
            </ul>
            <a href="button" class="searchButton"><i class="iconset"></i>극장찾기</a>
         </div>
      </div>

      <div class="footer-bottom">
         <div class="inner-wrap">
            <div class="footer-logo">HNMK시네마</div>
            <div class="footer-info">
               <div>
                  <address>서울특별시 어쩌구</address>
                  <p>ARS 1234-5678</p>
               </div>
               <div>
                  <p>대표자명 조원들</p>
                  <p>· 개인정보보호자책임자 조원들</p>
                  <p>· 사업자등록번호 123-45-67889</p>
                  <p>· 통신판매업신고번호 제 123호</p>
                  <p class="copy">COPYRIGHT &copy;MegaboxJoongAng, designed by
                     HNMKCINEMA</p>
               </div>
            </div>
            <div class="footer-sns">
               <a href="http://www.facebook.com"><i class="fab fa-facebook"></i></a>
               <a href="http://www.instagram.com"><i class="fab fa-instagram"></i></a>
               <a href="http://www.twiter.com"><i class="fab fa-twitter"></i></a>
            </div>
         </div>
      </div>
   </footer>
   <h3></h3>
   <h3></h3>
   <h3></h3>
   <h3></h3>
   <h3></h3>
</body>
</html>