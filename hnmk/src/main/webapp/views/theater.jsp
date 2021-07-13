<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/views/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Theater</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=h4oglnfp55"></script>

<style>

.contents {
	width: 1100px;
	margin: 0 auto;
}

.nav {
	display: flex;
	justify-content: center;
	margin-top: 10px;
	margin-bottom: 10px;
}

.inner-wrap-pt40 img{
	display: block;
	margin: 0 auto;
}

img {
	width: 1100px;
	height: 500px;
}

div {
	margin-bottom: 20px;
}

.address {
	margin-top: 10px;
	display: flex;
}

.address > div:nth-child(1) {
	margin-right: 10px
}

.map {
	display: flex;
}

.map > div:nth-child(1) {
	margin-right: 10px
}
	
</style>

</head>
<!-- <script type="text/javascript">
	$(function() {
		function fn_cnoinfo() {
			
		}
	});
</script> -->
<body>
<main>
	<!-- 
	<div id="pageContainer" class="container">
		<div class="page-util">
			<div class="pinner-wrap">
				<div class="location">
					<span>HOME</span> <a href="/hnmk/theaterguide" title="극장 페이지로 이동">극장
						> </a> <a href="/hnmk/theaterguide" title="전체극장 페이지로 이동">전체극장 ></a> <a
						href="/hnmk/theater?tcno=${theaterOne.cno }" title="극장정보 페이지로 이동">극장정보</a>
				</div>
			</div>
		</div>
		-->
		 
		<div class="contents" class="no-padding">
			<div class="theater-all">
				<ul class="nav">
				
					<li class="li-gangnam">
						<button type="button" class="nav_tit" value="강남" style="width:200px; height:30px; background-color:white; border-color:#c52f3a; border-radius:12px;">
							<a href="/hnmk/theater?cno=1" title="강남 상세보기">강남</a>
						</button>
					<li>
					
					<li class="li-hongdae">
						<button type="button" class="nav_tit" value="홍대" style="width:200px; height:30px; background-color:white; border-color:#c52f3a; border-radius:12px;">
							<a href="/hnmk/theater?cno=2" title="홍대 상세보기">홍대</a>
						</button>
					</li>
					
					<li class="li-dongdaemun">
						<button type="button" class="nav_tit" value="동대문" style="width:200px; height:30px; background-color:white; border-color:#c52f3a; border-radius:12px;">
							<a href="/hnmk/theater?cno=3" title="동대문 상세보기">동대문</a>
						</button>
					</li>
					
				</ul>
			</div>
			
			<!--
			<p class="name"><h3>${theaterOne.location}</h3></p>
			-->
			<div class="inner-wrap-pt40">
				<div class="tab-info">
					<c:set var="cno" value='${theaterOne.cno}'></c:set>
					<ul>
						<li class="description">
							<div>${theaterOne.cdescript}</div>
						</li>
						<li>
							<div><img src="resources/images/${theaterOne.cimg}" alt='${theaterOne.location}' /></div>
						</li>
						<li class="address">
							<div>주소:</div>
							<div>${theaterOne.caddress}</div>
						</li>
						<li class="map">
							<div>약도:</div>
							<c:set var="cno" value='${theaterOne.cno}'></c:set>
							<c:choose>
							
								<c:when test="${cno eq 1}">
									<a href="http://m.map.naver.com/map.nhn?lng=127.0264086&amp;lat=37.498214&amp;level=2" class="button purple" target="_blank" title="새창열림">실시간 길찾기</a>
								</c:when>
								
								<c:when test="${cno eq 2}">
									<a href="https://m.map.naver.com/map.naver?lng=126.92199&lat=37.55602&level=2" class="button purple" target="_blank" title="새창열림">실시간 길찾기</a>
								</c:when>
								
								<c:when test="${cno eq 3}">
									<a href="https://m.map.naver.com/map.naver?lng=127.0072101&lat=37.5666978&level=2" class="button purple" target="_blank" title="새창열림">실시간 길찾기</a>
								</c:when>
								
							</c:choose> 
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</main>
<%@ include file="/views/footer.jsp" %>
</body>
</html>