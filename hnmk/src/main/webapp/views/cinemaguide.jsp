<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/views/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CinemaGuide</title>
<!-- footer sns -->
<script src="https://kit.fontawesome.com/f995c83b9d.js"
	crossorigin="anonymous"></script>
<!-- footer css -->
<link rel="stylesheet" href="resources/css/footer.css">
<style>
* {
	list-style: none;
	text-decoration: none;
	border-collapse: collapse;
	margin: 0;
	padding: 0;
	color: black;
}

#tit_name {
	width: 1100px;
	height: 120px;
	margin-left: 725px;
	background-color: lightpink;
	font-size: 40px;
	text-align: center;
	display: block;
	line-height: 300%;
	justify-content: center;
}

.tinner-wrap {
	width: 1100px;
	height: 50px;
	margin: 0 auto;
	text-align: left;
	line-height: 300%;
}

.nav {
	display: flex;
	justify-content: center;
	margin-left: 425px;;
	width: 1100px;
	height: 100px;
	text-align: center;
}

.nav_tit {
	margin-left: 300px;
	margin-top: 50px;
	width: 150px;
	height: 75px;
	justify-content: center;
	font-size: 35px;
}

.wrap .theater-place>ul>li.on>button {
	color: #fff;
}

.wrap .theater-place>ul>li>button {
	display: block;
	width: 100%;
}

.nav>ul>li {
	width: auto;
	display: flex;
	font-size: 30px;
	text-align: center;
	cursor: pointer;
}
</style>
</head>
<body>

	<div class="container">
		<div class="page-util">
			<div class="tinner-wrap">
				<div class="location">
					<span>Home > </span> 
					<a href="/hnmk/theaterguide" title="극장 페이지로 이동">극장 > </a>
					<a href="/hnmk/theaterguide" title="전체극장 페이지로 이동">전체극장</a>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="title">
			<p id="tit_name">극 장 안 내
		</div>
		<div class="theater-place">
		<c:set var="cno" value='${theaterOne.cno}'></c:set>
			<ul class="nav">
				<li>
					<button type="button" class="nav_tit" value="강남">
						<a href="/hnmk/theater?tcno=1" title="강남 상세보기">강남</a>
					</button>
				</li>
				<li>
					<button type="button" class="nav_tit" value="홍대">
						<a href="/hnmk/theater?tcno=2" title="홍대 상세보기">홍대</a>
					</button>
				</li>
				<li>
					<button type="button" class="nav_tit" value="동대문">
						<a href="/hnmk/theater?tcno=3" title="동대문 상세보기">동대문</a>
					</button>
				</li>
			</ul>
		</div>
	</div>

	<!-- footer(하단) -->
	<!-- <footer class="footer">
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
	</footer> --> 

</body>
</html>