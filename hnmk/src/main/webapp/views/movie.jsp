<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/header.jsp" %> 
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
   <div id="contents">
      <div class="inner-wrap">
         <div id="tabs">
            <ul>
               <li id="movie-tab"><a href="#tabs-1"><button class="btn"
                        id="boxoffice">박스오피스</button></a></li>
               <li id="movie-tab"><a href="#tabs-2"><button class="btn"
                        id="schedulemovie">상영예정작</button></a></li>
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
                           <div class="reserve-part">
                              <p>개봉일 ${dto.releasedate }</p>
                              <a href="${path}/reserve?mno=${dto.mno}"><button class="reserve">예매</button></a>
                           </div>
                           </li>
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
                           <div class="reserve-part">
                              <p>개봉일 ${dto.releasedate }</p>
                              <a href="${path}/reserve?mno=${dto.mno}"><button class="reserve">예매</button></a>
                           </div>
                           </li>
                     </c:forEach>
                  </ol>
               </div>
            </div>
         </div>
         <div class="btn-more">
            <!-- <button type="button" class="btn" id="btnAddMovie">더보기</button> -->
         </div>
      </div>
   </div>
  <%@ include file="/views/footer.jsp" %> 
</body>

</html>