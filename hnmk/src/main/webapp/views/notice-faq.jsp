<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- footer sns -->
<script src="https://kit.fontawesome.com/f995c83b9d.js" crossorigin="anonymous"></script>
	<!-- footer css -->
<link rel="stylesheet" href="resources/css/footer.css">
	<!-- faq css -->
<link rel="stylesheet" href="resources/css/notice.css">
<link rel="stylesheet" href="resources/css/faq_table.css">

	<!-- table accodion + js -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script src="resources/js/notice_faq.js"></script>

</head>
<body>
	
	<h3>currentPageNo : ${currentPageNo }</h3>
		<h3>totalCount : ${totalCount }</h3>
		<h3>startNo : ${startNo}</h3>
		<h3>endNo : ${endNo}</h3>
		<h3>countPerPage : ${countPerPage}</h3>
		<h3>totalPage : ${totalPage}</h3>
		<h3>prev : ${prev}</h3>
		<h3>next : ${next}</h3>

	<!-- faq  -->
	<div class="contents">
		<div class="title_top">
			<h1>고객센터</h1>
		</div>
		<div class="tab_wrap">
			<ul>
				<li><button class="tab_tit">
						<a href="">FAQ</a>
					</button></li>
				<li><button class="tab_tit">
						<a href="">공지사항</a>
					</button></li>
				<li><button class="tab_tit">
						<a href="">1:1문의</a>
					</button></li>
				<!-- 버튼 누르면 페이지 이동 하이퍼링크말고 다른방법 -->
			</ul>
		</div>
		<div class="tab_inquiry">
			<p>더 궁금한 점이 있거나, 이미 문의한 내용과 답변을 확인하려면?</p>
			<a href="">1:1문의 바로가기</a>
		</div>
	</div>
		<div class="table_faq">
			<table class="recruit">
				<colgroup style="width: 1100px;">
			<col width="25%">
			<col width="75%">
				</colgroup>
				<thead>
					<tr >
						<th scope="col">구분</th>
						<th scope="col">질문</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="dto" items="${list }">
					<tr class="item">
						<td>${dto.ftype }</td>
						<td>${dto.ftitle }</td>
					</tr>
					<tr class="hide">
						<td colspan="2">${dto.fcontents }</td>
					</tr>
				</c:forEach>
				</tbody>
		
				
				<tr>
					<td colspan="2">
					<c:if test="${prev }">
					<a href="faq.do?currentPageNo=${currentPageNo-3 }"><button>이전</button></a> 
					</c:if>
					<c:forEach var="no" begin="${startPerNo }" end="${endPageNo }">
					<a href="faq.do?currentPageNo=${no }"><button>${no }</button></a>
					</c:forEach>
					<c:if test="${next }">
					<a href="faq.do?currentPageNo=${currentPageNo+3 }"><button>다음</button></a>
					</c:if>
					</td>
				</tr>
			</table>
		</div>
	


	<!-- footer(하단) -->
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
						<p class="copy">COPYRIGHT &copy;MegaboxJoongAng, designed by HNMKCINEMA</p>
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

</body>
</html>