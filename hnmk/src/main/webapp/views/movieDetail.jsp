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
<script>
$(function() {
	$("#tabs").tabs();

	/*코멘트 작성버튼 클릭시 confirm창으로 로그인구분*/ 
	var c = '<c:out value="${id}"/>'; /*현재 로그인되어있는 회원*/
	var m = '<c:out value="${mno}"/>'; /*현재 영화상세페이지에있는 영화번호*/
	var im = '<c:out value="${idmno}"/>'; /*현재 로그인되어있는 회원이 예매한 영화번호*/
	$("#btn").click(function() {
		if (c == "") {
			var result = confirm("   로그인이 필요한 서비스입니다.\n   로그인하러 가시겠습니까?");
			if (result) {
				window.location.href = "loginForm.do";
			} else {
				window.location.href = "detail?mno=" + m;
			}
		}
		else if (m == im) { /*현재 디테일페이지에 있는 영화와 로그인되어있는 회원이 예매한 영화가 같은지(무조건 예매만했다고 작성할수있는게아니고 관람한 영화이여야하기때문에)*/
			
			if ($("#gr").val() > 10) { /*평점이10점 초과이면*/
				alert("평점은 10점까지 가능합니다.");
				window.location.href = "detail?mno=" + m; /*다시 영화상세페이지 m=영화번호*/
			}else if($("#gr").val() == ""){ /*평점이 공백이면*/
				alert("평점이 비어있습니다.") 
				window.location.href = "detail?mno=" + m;
			} 
			else if($("#review").val()==""){ /*감상평이 공백이면*/
				alert("감상평이 비어있습니다.") 
				window.location.href = "detail?mno=" + m;
			}else{
				$("#form").submit();
			}
				
		} else { /*현재 디테일페이지에 있는 영화와 로그인되어있는 회원이 예매한 영화와 같지않는경우*/
			alert("관람평은 관람 이후 작성 가능합니다.");
			window.location.href = "detail?mno=" + m;
		}
	});

});
</script>
<link href="${pageContext.request.contextPath}/resources/css/movieDetailStyle.css" rel="stylesheet" type="text/css">
<!-- <script src="resources/js/movieDetail.js"></script> -->

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
							<a href="${path}/reserve?mno=${mdList.mno}"><div class="btn_reserve">예매</div></a>
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
							<h4 style="margin-left: 100px;">감상평을 남겨주세요!</h4>
							<p>평점 : ${mdList.mratings }</p>
							<p></p>
							<p>
								평점을 남겨주세요! 0~10점 <input type="text" name="grade" id="gr" />점
							</p>
							<p id="review_detail">
							<input type="text" name="review" id="review"
								placeholder="타인을 비방하거나 스포일러는 삭제 될 수 있음으로 유의해주세요." />
							<button type="button" id="btn">작성</button>
							</p>
							<!-- 코멘트 불러오는 부분 -->
							<c:forEach var="cmList" items="${cmList }">
							<div class="comment_detail">
								<span>작성자 ${cmList.id }</span>
								<span>평점 : ${cmList.mcgrade }</span>
								<span>${cmList.mccontents }</span>
								<span>${cmList.mcregdate }</span>
							</div>	
							
							</c:forEach>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<%@ include file="/views/footer.jsp"%>

</body>
</html>