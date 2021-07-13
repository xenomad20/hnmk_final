<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/views/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HNMK 시네마</title>

<style>

	.wrapper1 {
	width: 1100px;
    margin: auto;
	display: flex;
	}
	
	.wrapper2 {
	width: 1100px;
    margin: auto;
	display: flex;
	}
	
	.wrapper3 {
	width: 1110px;
    margin: auto;
	display: flex;
	border-top: solid;
    border-bottom: solid;
    margin-top: 50px;
    margin-bottom: 40px;

	}
	
	img {
	width: 250px;
	height: 350px;
	}
	
	.movie1 {
	float: left;
	width: 250px;
	height: 350px;
	text-align: center;
	margin-top: 30px;
	margin-right: 35px;
	}
	
	.movie2 {
	width: 250px;
	height: 350px;
	text-align: center;
	margin-top: 30px;
	margin-right: 35px;
	}
	
	.movie3 {
	width: 250px;
	height: 350px;
	text-align: center;
	margin-top: 30px;
	margin-right: 35px;
	}
	
	.movie4 {
	width: 250px;
	height: 350px;
	text-align: center;
	margin-right: 15px;
	margin-top: 30px;
	}
	
	.btn1 {
	float: left;
	width: 250px;
	height: 50px;
	margin-top: 10px;
	margin-right: 30px;
	text-align: center;
	}
	
	.btn2 {
	float: left;
	width: 250px;
	height: 50px;
	margin-top: 10px;
	margin-left: 5px;
	margin-right: 10px;
	text-align: center;
	}
	
	.btn3 {
	float: left;
	width: 250px;
	height: 50px;
	margin-top: 10px;
	margin-left: 30px;
	margin-right: 15px;
	text-align: center;
	}
	
	.btn4 {
	float: left;
	width: 250px;
	height: 50px;
	margin-top: 10px;
	margin-left: 20px;
	margin-right: 25px;
	text-align: center;
	}

	.btn {
	cursor: pointer;
	}
	
	h2 {
	text-align: left;
	margin-top: 130px;
	}
	
	h3 {
	color: #c52f3a;
	text-align: center;
	margin-top: 30px;
	}
	
	table {
	height: 300px;	
	text-align: left;
	margin-top: 30px;
	margin-left: 50px;
	margin-bottom: 20px;
	}

</style>

<body>

<main>
<h3>박스오피스</h3>
<div class="wrapper1">
	<c:forEach var="dto" items="${listp}">
	<div class="movie1">
	<img src="${dto.poster}" alt="${dto.mtitle}" />
	</div>
	</c:forEach>
	<%--<div class="movie2">
	<img src="/resources/images/hitman_wife_bodyguard.jpg" alt="킬러의보디가드" />
	</div>
	
	<div class="movie3">
	<img src="/resources/images/hard_hit.jpg" alt="발신제한" />
	</div>
	
	<div class="movie4">
	<img src="/resources/images/luca.jpg" alt="루카" />
	</div> --%>
</div>

<div class="wrapper2">
	<div class="btn1">
	<input type="button" class="btn" id="btnReserve" value="예매" style="width:250px; height:30px; background-color:white; border-color:#c52f3a; border-radius:12px;" onclick="location.href='/hnmk/reserve?mno=202137'" />
	</div>
	
	<div class="btn2">
	<input type="button" class="btn" id="btnReserve" value="예매" style="width:250px; height:30px; background-color:white; border-color:#c52f3a; border-radius:12px;" onclick="location.href='/hnmk/reserve?mno=202130'"/>
	</div>
	
	<div class="btn3">
	<input type="button" class="btn" id="btnReserve" value="예매" style="width:250px; height:30px; background-color:white; border-color:#c52f3a; border-radius:12px;" onclick="location.href='/hnmk/reserve?mno=202132'"/>
	</div>
	
	<div class="btn4">
	<input type="button" class="btn" id="btnReserve" value="예매" style="width:250px; height:30px; background-color:white; border-color:#c52f3a; border-radius:12px;" onclick="location.href='/hnmk/reserve?mno=202131'"/>
	</div>
</div>
<div class="wrapper3">
	<h2>HNMK시네마 안내사항</h2>
	<table>
	<c:forEach var="item" items="${list}">
		<tr>
			<td>
			<a href="/hnmk/noticeDetail.do?nno=${item.nno}"><font color="gray">${item.ntitle}</font></a>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
</main>

<%@ include file="/views/footer.jsp" %>
</body>
</html>