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
</head>
<!-- <script type="text/javascript">
	$(function() {
		function fn_cnoinfo() {
			
		}
	});
</script> -->
<body>
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
		<div id="contents" class="no-padding">
			<div class="theater-all">
				<ul class="nav">
					<li>
						<button type="button" class="nav_tit" value="강남">
							<a href="/hnmk/theater?cno=1" title="강남 상세보기">강남</a>
						</button>
					<li>
					<li>
						<button type="button" class="nav_tit" value="홍대">
							<a href="/hnmk/theater?cno=2" title="홍대 상세보기">홍대</a>
						</button>
					</li>
					<li>
						<button type="button" class="nav_tit" value="동대문">
							<a href="/hnmk/theater?cno=3" title="동대문 상세보기">동대문</a>
						</button>
					</li>
				</ul>
			</div>
			<p class="name">${theaterOne.location}</p>
			<div class="inner-wrap-pt40">
				<div class="tab-info">
					<c:set var="cno" value='${theaterOne.cno}'></c:set>
					<ul>
						<li>
							<div>상세설명</div>
							<div>${theaterOne.cdescript}</div>
						</li>
						<li>
							<div>이미지</div>
							<div><img src="resources/images/${theaterOne.cimg}" alt='${theaterOne.location}' /></div>
						</li>
						<li>
							<div>주소</div>
							<div>${theaterOne.caddress}</div>
						</li>
						<li>
							<div>약도</div>
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
</body>
</html>