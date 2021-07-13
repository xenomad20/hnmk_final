<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/views/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>movieDetail</title>
<!-- 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css"> 
  -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%-- <link href="${pageContext.request.contextPath}/resources/css/movieDetailStyle.css" rel="stylesheet" type="text/css">
<script src="resources/js/movieDetail.js"></script>  --%>
<style>
	body {
	margin: 0 auto;
}

/* header-top line */
.top_line {
	width: 1100px;
	height: 30px;
	background-color: black;
	color: white;
	display: table-cell;
	vertical-align: middle;
}

ul {
	list-style: none;
}

li {
	float: left;
	margin-left: 5px;
}

li a {
	color: white;
}

li a:hover {
	color: red;
}

/* 영화소개 upper */
.body_wrapper {
	width: 1100px;
	margin: auto;
	/* padding: 50px 0 0 0; */
	display: grid;
	place-items: center;
}

.contents_wrapper {
	width: 1100px;
}

.movie_detail {
	margin: auto;
	padding-top: 50px;
	width: 1000px;
	display: table;
	height: 400px;
	/* 	background-color: aqua; */
}

/* 영화소개 - 포스터  */
.poster {
	float: left;
	padding-top: 30px;
	padding-left: 10px;
}

#poster_img {
	width: 230px;
	height: 330px;
}
/* 영화소개 - 설명 */
.contents_info {
	float: left;
	padding-top: 30px;
	padding-left: 30px;
	width: 700px;
	height: 350px;
}

.contents_info p {
	margin: 0 auto;
	padding: 10 0 0 0;
}

.filmgrade {
	display: inline;
}

#filmgrade_img {
	width: 25px;
	height: 25px;
	padding-top: 3px;
	margin: 0;
}

.title {
	/* background-color: orange; */
	
}

.tit {
	font-size: 25px;
	font-weight: bold;
}

.tit_eng {
	font-size: 15px;
	color: gray;
}

.rating {
	padding-top: 10px;
	padding-bottom: 15px;
	/* background: lime; */
	border-bottom-style: solid;
	border-bottom-width: 0.5px;
	border-bottom-color: silver;
}

.profile_detail_info {
	/* background-color: yellow; */
	padding-top: 20px;
}

.detail_info {
	padding-bottom: 5px;
}

.btn_reserve {
	margin-top: 30px;
	/* float: right; */
	width: 150px;
	height: 50px;
	background-color: #c52f3a;
	border-radius: 5px 5px 5px 5px;
	font-weight: bold;
	font-size: 20px;
	color: white;
	text-align: center;
	line-height: 50px;
	border: none;
}

/* 영화소개 bottom */
.movie_tabs {
	width: 1000px;
	height: 400px;
	display: table-cell;
	vertical-align: middle;
	border: none;
}

/* css : https://codepen.io/flkt-crnpio/pen/WxROwy/ */
.tab-2 a {
	background: #fd264f;
	color: black;
	display: block;
	font-size: 12px;
	line-height: 1em;
	margin: 0;
	padding: 5px 110px;
	position: fixed;
	top: 20px;
	right: -100px;
	text-align: center;
	text-decoration: none;
	transform: rotate(45deg);
}

button:focus, input:focus, textarea:focus, select:focus {
	outline: none;
}

.tabs p {
	width: 800px;
	margin: auto;
	margin-top: 30px;
}

.tabs {
	width: 1000px;
	display: block;
	display: -webkit-flex;
	display: -moz-flex;
	display: flex;
	-webkit-flex-wrap: wrap;
	-moz-flex-wrap: wrap;
	flex-wrap: wrap;
	margin: auto;
	overflow: hidden;
}

.tabs [class^="tab"] label, .tabs [class*=" tab"] label {
	cursor: pointer;
	display: block;
	font-size: 1.1em;
	font-weight: 300;
	line-height: 1em;
	padding: 2rem 0;
	text-align: center;
}

.tabs [class^="tab"] [type="radio"], .tabs [class*=" tab"] [type="radio"]
	{
	border-bottom: 1px solid rgba(239, 237, 239, 0.5);
	cursor: pointer;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	display: block;
	width: 100%;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.tabs [class^="tab"] [type="radio"]:hover, .tabs [class^="tab"] [type="radio"]:focus,
	.tabs [class*=" tab"] [type="radio"]:hover, .tabs [class*=" tab"] [type="radio"]:focus
	{
	border-bottom: 1px solid #fd264f;
}

.tabs [class^="tab"] [type="radio"]:checked, .tabs [class*=" tab"] [type="radio"]:checked
	{
	border-bottom: 2px solid #fd264f;
}

.tabs [class^="tab"] [type="radio"]:checked+div, .tabs [class*=" tab"] [type="radio"]:checked+div
	{
	opacity: 1;
}

.tabs [class^="tab"] [type="radio"]+div, .tabs [class*=" tab"] [type="radio"]+div
	{
	display: block;
	opacity: 0;
	padding: 2rem 0;
	width: 90%;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.tabs .tab-2 {
	width: 50%;
}

.tabs .tab-2 [type="radio"]+div {
	width: 200%;
	margin-left: 200%;
}

.tabs .tab-2 [type="radio"]:checked+div {
	margin-left: 0;
}

.tabs .tab-2:last-child [type="radio"]+div {
	margin-left: 100%;
}

.tabs .tab-2:last-child [type="radio"]:checked+div {
	margin-left: -100%;
}

#gr {
	width: 30px;
	height: 20px;
	font-size: 16px;
	text-align: center;
}

#review {
	width: 600px;
	height: 30px;
}

#btn {
	background-color: red;
	color: white;
	width: 50px;
	border-style: none;
	height: 30px;
	cursor: pointer;
}
</style>
<script>
$(function() {
	$("#tabs").tabs();

	//코멘트 작성버튼 클릭시 confirm창으로 로그인구분 
	var c = '<c:out value="${id}"/>'; //현재 로그인되어있는 회원
	var m = '<c:out value="${mno}"/>'; //현재 영화상세페이지에있는 영화번호
	var im = '<c:out value="${idmno}"/>'; //현재 로그인되어있는 회원이 예매한 영화번호
	$("#btn").click(function() {
		if (c == "") {
			var result = confirm("   로그인이 필요한 서비스입니다.\n   로그인하러 가시겠습니까?");
			if (result) {
				window.location.href = "loginForm.do";
			} else {
				window.location.href = "detail?mno=" + m;
			}
		}
		else if (m == im) {//현재 디테일페이지에 있는 영화와 로그인되어있는 회원이 예매한 영화가 같은지(무조건 예매만했다고 작성할수있는게아니고 관람한 영화이여야하기때문에)
			
			if ($("#gr").val() > 10) { //평점이10점 초과이면
				alert("평점은 10점까지 가능합니다.");
				window.location.href = "detail?mno=" + m; //다시 영화상세페이지 m=영화번호
			}else if($("#gr").val() == ""){//평점이 공백이면
				alert("평점이 비어있습니다.") 
				window.location.href = "detail?mno=" + m;
			} 
			else if($("#review").val()==""){ //감상평이 공백이면
				alert("감상평이 비어있습니다.") 
				window.location.href = "detail?mno=" + m;
			}else{
				$("#form").submit();
			}
				
		} else { //현재 디테일페이지에 있는 영화와 로그인되어있는 회원이 예매한 영화와 같지않는경우
			alert("관람평은 관람 이후 작성 가능합니다.");
			window.location.href = "detail?mno=" + m;
		}
	});

});
</script>

</head>
<body>
	<form action="detail" method="post" id="form">
	 <input type="hidden" name="customerno" value="${customerno}" />
	 <input type="hidden" name="mno" value="${mno}" />
		<div class="body_wrapper">
			<!-- header -->
			<div class="header">
				<div class="top_line">
					<ul>
						<c:set var="path" value="${pageContext.request.contextPath}" />
						<li class="top_line_li"><a href="${path}/home">홈</a></li>
						<li class="top_line_li">&gt;</li>
						<li class="top_line_li"><a href="${path}/movie">영화</a></li>
						<li class="top_line_li">&gt;</li>
						<li class="top_line_li">영화상세</li>
					</ul>
				</div>
			</div>
			<!-- 영화소개 upper -->
			<div class="contents_wrapper">
				<div id="contents" class="movie_detail">
					<div class="poster">
						<img id="poster_img" src="${mdList.poster }"
							style="border: 0; cursor: pointer"
							onclick="window.open('${mdList.poster }', '${mdList.mtitle }')"
							alt="포스터" />
					</div>
					<div class="contents_info">
						<div class="title">
							<span class="tit">${mdList.mtitle }</span> <span
								class="filmgrade"> <img id="filmgrade_img"
								src="${pageContext.request.contextPath}/resources/images/${mdList.filmgrade}.PNG"
								alt="" />
							</span>
							<p class="tit_eng">${mdList.mtitleEng }</p>
						</div>
						<div class="rating">
							<p>관람객 평점 : ${mdList.mratings }</p>
						</div>
						<div class="profile_detail">
							<div class="profile_detail_info" title="영화소개 기본">
								<p class="detail_info">감독 : ${mdList.director }</p>
								<p class="detail_info">배우 : ${mdList.cast }</p>
								<p class="detail_info">장르 : ${mdList.genre }</p>
								<span class="detail_info">개봉 : ${mdList.releasedate }
									&nbsp;/&nbsp;</span> <span class="detail_info">${mdList.showtimes }</span>
							</div>
						</div>
						<div class="reserve_screen">
							<c:set var="path" value="${pageContext.request.contextPath}" />
							<a href="${path}/reserve?mno=${mdList.mno}"><div
									class="btn_reserve">예매</div></a>
						</div>
					</div>
				</div>
				<!-- 영화소개 bottom, tabs 사용-->
				<!-- 별점 주는 로직  https://cloudstudying.kr/lectures/236 -->
				<div class="tabs">
					<div class="tab-2">
						<label for="tab2-1">시놉시스</label> <input id="tab2-1"
							name="tabs-two" type="radio" checked="checked">
						<div>
							<h4></h4>
							<p>${mdList.mintroduction }</p>
						</div>
					</div>
					<div class="tab-2">
						<label for="tab2-2">평점 및 코멘트</label> <input id="tab2-2"
							name="tabs-two" type="radio">
						<div>
							<h4>감상평을 남겨주세요!</h4>
							<p>평점 : ${mdList.mratings }</p>
							<p></p>
							<p>
								평점을 남겨주세요! 0~10점 <input type="text" name="grade" id="gr" />점
							</p>
							<p></p>
							<input type="text" name="review" id="review"
								placeholder="타인을 비방하거나 스포일러는 삭제 될 수 있음으로 유의해주세요." />
							<button type="button" id="btn">작성</button>
							</p>
							<p></p>
						</div>
					</div>
				</div>


			</div>
		</div>
	</form>
	<%@ include file="/views/footer.jsp"%>

</body>
</html>