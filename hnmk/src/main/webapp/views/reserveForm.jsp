<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/views/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠른예매</title>
<!-- datepicker -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">

<style>
/* datepicker buttonImage css */
* {
	margin: 0;
	padding: 0;
}

main {
	width: 1100px;
	height: 800px;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 30px;
}

#container {
	background-color: #FDFCF0
}

#container-header {
	width: 1100px;
}

#container-center {
	width: 1110px;
}

#container-footer {
	padding: 10px;
	width: 1100px;
}

.ui-datepicker-trigger {
	cursor: pointer;
}

img.ui-datepicker-trigger {
	padding-left: 35px;
	width: 50px;
	height: 50px;
	width: 50px;
}

#header-title {
	padding-top: 10px;
	font-size: 15px;
	margin-bottom: 25px;
}

#date-schedule {
	background-color: white;
	width: 100%;
	height: 53px;
	border: 1px solid #760C0C;
}

.schedule-bt {
	position: relative;
	bottom: 19px;
	padding-left: 50px;
	background: transparent;
	border: 0px;
	outline: 0px;
	cursor: pointer;
}

.center-section {
	float: left;
	border: 1px solid #760C0C;
	height: 580px;
}

#movie-choice {
	width: 270px;
}

#theater-choice {
	width: 350px;
}

#time-choice {
	width: 480px;
}

.center-title {
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 16px;
	font-size: 17px;
	font-weight: bold;
}

.list-button {
	position: relative;
	left: 24px;
	margin-bottom: 10px;
	width: 115px;
	height: 30px;
	background: transparent;
	cursor: pointer;
}

#lb1 {
	margin-right: -3px;
	border: 1px solid black;
	border-bottom: none;
}

#lb2 {
	margin-left: -3px;
	border: 1px solid black;
}

#thb1 {
	width: 155px;
	margin-right: -3px;
	border: 1px solid black;
	border-bottom: none;
}

#thb2 {
	width: 155px;
	margin-left: -3px;
	border: 1px solid black;
	border-bottom: none;
}

#movie-list {
	margin: 0 auto;
	text-align: center;
	width: 229px;
	height: 320px;
	overflow: auto;
	padding-left: 10px;
}

#movie-list::-webkit-scrollbar {
	width: 10px;
}

#movie-list::-webkit-scrollbar-thumb {
	background-color: #2f3542;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#movie-list::-webkit-scrollbar-track {
	background-color: #760C0C;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

#movie-toplist {
	margin: 0 auto;
	text-align: center;
	width: 229px;
	height: 320px;
	overflow: auto;
	display: none;
	padding-left: 10px;
}

#movie-toplist::-webkit-scrollbar {
	width: 10px;
}

#movie-toplist::-webkit-scrollbar-thumb {
	background-color: #2f3542;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#movie-toplist::-webkit-scrollbar-track {
	background-color: #760C0C;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

.allList-desc {
	margin: 9px;
	margin-left: 20px;
	padding: 5px;
	text-align: center;
	width: 220px;
	font-size: 15px;
	color: #444;
	border: 1px solid #d8d9db;
}

#list-desc {
	height: 130px;
}

#topList-desc {
	display: none;
}

.list-desc-img {
	width: 220px;
	height: 130px;
}

.movie-title {
	padding-top: 5px;
	padding-bottom: 5px;
	text-align: left;
}

.movieBox-title {
	padding-top: 5px;
	padding-bottom: 5px;
	text-align: left;
}

.theater-list-section {
	margin: 0px auto;
}

#theater-list {
	padding-left: 30px;
	float: left;
	width: 150px;
	height: 320px;
	text-align: left;
	border-right: 1px solid #d8d9db;
	margin-bottom: 10px;
}

.theater-title {
	padding-top: 5px;
	padding-bottom: 5px;
}

#screen-list {
	float: left;
	width: 150px;
	height: 320px;
	text-align: left;
	margin-bottom: 10px;
	padding-left: 8px;
}

#theater-desc {
	clear: both;
	margin-left: 20px;
	margin-top: 20px;
	padding: 5px;
	text-align: center;
	width: 300px;
	font-size: 15px;
	color: #444;
	border: 1px solid #d8d9db;
}

#theater-img {
	width: 300px;
	height: 140px;
}

#video {
	position: relative;
	height: 200px;
	left: 635px;
	bottom: 200px;
}

#time-desc {
	margin-left: 10px;
	width: 450px;
	height: 30px;
	border: 1px solid black;
	border-bottom: none;
}

.td {
	position: relative;
	top: 4px;
	padding-left: 30px;
	font-size: 15px;
}

.schedule-list {
	padding-left: 21px;
	padding-bottom: 15px;
}
/*상영일정 div에 스크롤을 추가하려는데 반영이안됨 */
#time-list {
	width: 440px;
	height: 280px;
	padding-left: 10px;
	position: relative;
	bottom: 26px;
}

.desc-empty {
	margin-top: 40px;
	text-align: center;
}

a {
	text-decoration: none;
	color: black
}

#cf {
	margin: 0 auto;
	width: 1105px;
	height: 80px;
	margin-top: 10px;
	position: relative;
	right: 12px;
}

.notime {
	padding-left: 30px;
	margin-top: 40px;
	font-weight: bold;
	text-align: center;
}

#filmgrade {
	width: 23px;
	height: 23px;
	position: absolute;
}
</style>
<script type="text/javascript">
	$(function() {
		//datepicker 설정
		$("#datepicker")
				.datepicker(
						{
							showOn : "both",
							buttonImage : "https://previews.123rf.com/images/captainvector/captainvector1705/captainvector170505757/77301498-%EB%8B%AC%EB%A0%A5-%EC%95%84%EC%9D%B4%EC%BD%98.jpg",
							buttonImageOnly : true,
							yearSuffix : "년",
							changeMonth : false,
							dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ],
							minDate : 0,
							maxDate : "+6D",
							onSelect : function() {
								console.log("d")
							}
						});

		$("#lb1").on('click', function() {
			$("#lb1").css("border-bottom", "none");
			$("#lb2").css("border-bottom", "1px solid black");
			$("#movie-toplist").hide();
			$("#movie-list").show();
			$("#list-desc").show();
			$("#topList-desc").hide();
		})
		$("#lb2").on(
				'click',
				function() {
					$("#lb2").css("border-bottom", "none");
					$("#lb1").css("border", "1px solid #2f3542").css(
							"border-bottom", "1px solid black ");
					$("#movie-list").hide();
					$("#movie-toplist").show();
					$("#list-desc").hide();
					$("#topList-desc").show();
				})
		var desc = '<c:out value="${desc}"/>';
		if ($(".schedule-list").html() == null && desc == 1) {

			$("#notime").html("현재 선택하신 상영관에는");
			$("#notime2").html("상영일정 정보가 없습니다.");
			$("#notime3").html("영화 또는 상영관을 다시 선택해주세요.");
			$("#notime-img").show();

		}

		var m = '<c:out value="${movieOne.mno}"/>';
		if (m == m) {
			$("#" + m).css("background", "#F8EFCE");
			$("#" + m).css("color", "black");
		}

		var c = '<c:out value="${reserveCheck}"/>';
	
		if (c != "") {

			alert("  이미 예매한 티켓이 있습니다.\n  마이페이지에서 예매내역을 확인해주세요.");
			location.href = "mypageForm.do";
		}
	});
</script>
</head>
<body>
	<main>
		<div id="container">

			<div id="container-header">
				<div id="header-title">
					<h2>빠른예매</h2>
				</div>
				<div id="date-schedule">
					<button type="button" class="schedule-bt">${today}<span
							class="schedule-day"> 오늘</span>
					</button>
					<button type="button" class="schedule-bt">${tomorrow}<span
							class="schedule-day"> 내일</span>
					</button>
					<c:forEach var="i" begin="0" end="4">
						<button type="button" class="schedule-bt">
							${datelist[i]} <span class="schedule-day">${daylist[i]}</span>
						</button>
					</c:forEach>
					<input type="hidden" id="datepicker">
				</div>

			</div>

			<div id="container-center">
				<div id="movie-choice" class="center-section">
					<p class="center-title">영화</p>
					<div id=all-list>
						<button type="button" class="list-button" id="lb1">전체</button>
						<button type="button" class="list-button" id="lb2">박스오피스</button>
						<div id="movie-list">
							<c:forEach var="movie" items="${movielist}">
								<a href="reserve?mno=${movie.mno}"><p class="movie-title"
										id="${movie.mno}">${movie.mtitle}</p></a>
							</c:forEach>

						</div>
						<div id="movie-toplist">
							<c:forEach var="movieBox" items="${movieBoxlist}">
								<a href="reserve?mno=${movieBox.mno}"><p class="movie-title">${movieBox.mtitle}</p></a>
							</c:forEach>
						</div>
						<div id="list-desc" class="allList-desc">
							<c:set var="mno" value='${movieOne.mno}'></c:set>
							<c:choose>
								<c:when test="${empty mno}">
									<p class="list-desc-p">모든영화</p>
									<p class="list-desc-p">목록에서 영화를 선택하세요.</p>
								</c:when>
								<c:when test="${not empty mno}">
									<img id="limg1" class="list-desc-img" src="${movieOne.poster}"
										alt='${movieOne.mtitle}' />
									<c:if test="${mno eq 202109 }">
										<iframe id="video" width="400" height="225"
											src="https://www.youtube.com/embed/yfSMTFzw-Kw"
											title="YouTube video player" frameborder="0"
											allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
											allowfullscreen></iframe>
									</c:if>
								</c:when>
							</c:choose>
						</div>
						<div id="topList-desc" class="allList-desc">
							<c:set var="mno" value='${movieOne.mno}'></c:set>
							<c:choose>
								<c:when test="${empty mno}">
									<p class="list-desc-p">주간예매율순위</p>
									<p class="list-desc-p">목록에서 영화를 선택하세요.</p>
								</c:when>
								<c:when test="${not empty mno}">
									<img id="limg2" class="list-desc-img" src="${movieOne.poster}"
										alt='${movieOne.mtitle}' />
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>

				<div id="theater-choice" class="center-section">
					<p class="center-title">극장</p>
					<button type="button" class="list-button" id="thb1">전체지점</button>
					<button type="button" class="list-button" id="thb2">상영관</button>

					<div class="theater-list-section" id="theater-list">
						<!--mno 파라미터값을 줘서 위에 영화선택이미지가 사라지지않게함-->
						<c:forEach var="theater" items="${theaterlist}">
							<c:set var="mno" value="${movieOne.mno}"></c:set>
							<c:choose>
								<c:when test="${empty mno}">
									<p class="theater-title">${theater.location}</p>
								</c:when>
								<c:when test="${not empty mno}">
									<a href="reserve?cno=${theater.cno}&mno=${movieOne.mno}"><p
											class="theater-title">${theater.location}</p></a>
								</c:when>
							</c:choose>
						</c:forEach>

					</div>
					<div class="theater-list-section" id="screen-list">
						<c:forEach var="screentheater" items="${screentheater}">
							<a
								href="reserve?mno=${movieOne.mno}&cno=${theaterOne.cno}&sname=${screentheater.sname}&desc=1"><p
									class="theater-title" id="thtitle">${screentheater.sname}</p></a>
						</c:forEach>
					</div>
					<div id="theater-desc">
						<c:set var="cno" value='${theaterOne.cno}'></c:set>
						<c:choose>
							<c:when test="${empty cno}">
								<p class="theater-desc-p">전체극장</p>
								<p class="theater-desc-p">목록에서 극장을 선택하세요.</p>
							</c:when>
							<c:when test="${not empty cno}">
								<img id="theater-img" class="list-desc-img"
									src="resources/images/${theaterOne.cimg}"
									alt='${theaterOne.location}' />
							</c:when>
						</c:choose>
					</div>
				</div>

				<div id="time-choice" class="center-section">
					<p class="center-title">시간</p>
					<div id=time-desc>
						<span class="td">상영날짜</span><span class="td">시작시간</span><span
							class="td">종료시간</span><span class="td">영화제목</span>
					</div>
					<div id="time-list">
						<p class="notime" id="notime"></p>
						<p class="notime" id="notime2"></p>
						<p class="notime" id="notime3"></p>
						<c:forEach var="schdto" items="${schdtolist}">
							<a
								href="seat?mno=${schdto.mno}&cno=${theaterOne.cno}&sname=${schdto.sname}&ssno=${schdto.ssno}"><p
									class=schedule-list id="sclist">${schdto.ssdate}&emsp;&emsp;${schdto.starttime}&emsp;~&emsp;
									${schdto.endtime}&emsp;&emsp;${movieOne.mtitle}</p></a>
						</c:forEach>

						<!-- sname 파라미터를사용해야하는데 foreach문에 들어가있어서 따로 파라미터를만듦 -->
						<!-- 상영관을 클릭했을때 desc란 구분만해주는 파라미터를 같이보내주어서 상영일정이 나오기 전까지 아래코드실행 -->
						<c:set var="desc" value="${desc}"></c:set>
						<c:if test="${empty desc}">
							<p class="desc-empty">
								<img src="resources/images/schedule.png" alt="스케줄로고" />
							</p>
							<p class="desc-empty">영화와 극장을 선택하시면</p>
							<p class="desc-empty">상영시간표를 비교하여 볼 수 있습니다.</p>
						</c:if>
					</div>
				</div>
			</div>
			<div id="container-footer">
				<!-- 광고 -->
				<!-- 메가박스사이트에있는 광고가아니면 이미지가 다흐려져서... -->
				<a href="https://direct.hi.co.kr/"><img id="cf"
					src="https://mlink-cdn.netinsight.co.kr/2020/10/29/9c22380b0aac240c356772ce7af4590a.jpg"
					alt="" /></a>
			</div>

		</div>




	</main>
	<%@ include file="/views/footer.jsp"%>
</body>
</html>