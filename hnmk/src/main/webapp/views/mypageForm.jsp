<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/views/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>


<style>
* {
	margin: 0;
	padding: 0;
}

main {
	width: 1100px;
	height: 1400px;
	margin: 0 auto;
	margin-bottom: 30px;
}

#table1 {
	margin-top: 30px;
	padding-top: 30px;
	font-weight: bold;
	font-size: 20px;
	background-color: #FDFCF0;
	width: 1100px;
	height: 300px;
	text-align: center;
	margin: auto;
	border-color: #861617;
	border-top: 1px solid;
	border-bottom: 1px solid;
	border-collapse: collapse;
}

#table2 {
	background-color: #FDFCF0;
	border-collapse: collapse;
	text-align: center;
	color: black;
	font-size: 17px;;
	width: 1100px;
	height: 200px;
	margin: auto;
	margin-bottom: 30px;
	border-top: 1px solid;
	border-bottom: 1px solid;
}

#info2 {
	display: none;
}

#info2-table {
	background-color: #FDFCF0;
	border-collapse: collapse;
	text-align: left;
	color: black;
	font-size: 17px;;
	width: 1100px;
	height: 200px;
	margin: auto;
	margin-bottom: 30px;
	border-top: 1px solid;
	border-bottom: 1px solid;
}

#table3 {
	border-top: 1px solid;
	border-bottom: 1px solid;
	border-collapse: collapse;
	background-color: #FDFCF0;
	width: 1100px;
	height: 300px;
	text-align: center;
	margin: auto;
	margin-bottom: 30px;
}

#table4 {
	border-top: 1px solid;
	border-bottom: 1px solid;
	border-collapse: collapse;
	background-color: #FDFCF0;
	width: 1100px;
	height: 300px;
	text-align: center;
	margin: auto;
}

#no {
	text-align: center;
}

button {
	font-size: 16px;
	background: transparent;
	cursor: pointer;
	border: 0px;
	outline: 0px;
}

#b {
	font-size: 16px;
	background: transparent;
	cursor: pointer;
	border: 0px;
	outline: 0px;
	padding-bottom: 40px;
}

.img-title {
	width: 75px;
	height: 75px;
}

.top_line {
	width: 1100px;
	height: 30px;
	background-color: #FDFCF0;
	color: black;
	margin-bottom: 40px;
}

ul {
	list-style: none;
}

li {
	float: left;
}

li a {
	color: black;
}

li a:hover {
	color: #C52F3A;
}

#poster {
	width: 170px;
	height: 200px;
}

#cancel {
	background: transparent;
	cursor: pointer;
	border: 0px;
	outline: 0px;
	font-size: 17px;
}

#use {
	padding-bottom: 30px;
}

#ii {
	padding-left: 30px;
}
</style>

<script>
	function fn_move(seq) {
		var offset = $("#div" + seq).offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);

	}
	$(function() {
		$("#cancel").click(function() {
			var result = confirm("예매를 취소하시겠습니까?");

			if (result) {
				$("#form").submit();
			} else {
				window.location.href = "mypageForm.do";
			}

		});

		$("#b").click(function() {
			$("#info").hide();
			$("#info2").show();
			$("#main").css("height", "1600px");
		});
	});
</script>
</head>

<body>
	<main id="main">
		<form action="cancel" method="post" id="form">
			<input type="hidden" name="customerno" value="${cdto.customerno}" />
			<input type="hidden" name="ticketno" value="${rdto.ticketno}" /> <input
				type="hidden" name="sname" value="${sdto.sname}" />

			<c:forEach var="r" items="${rlist}">
				<input type="hidden" name="seatno" value="${r.seatno}" />
			</c:forEach>
			<div id="container">
				<div class="header">
					<div class="top_line">
						<ul>
							<c:set var="path" value="${pageContext.request.contextPath}" />
							<li><a href="${path}/home">홈</a></li>
							<li>&nbsp; &gt; &nbsp;</li>
							<li>마이페이지</li>
						</ul>
					</div>
				</div>
				<div id="info">
					<table id="table1">
						<tr>
							<td class="" rowspan="3" width="250px"><img
								src="https://i.pinimg.com/236x/f5/01/dd/f501ddf1d0174f84f24be501838cbb46.jpg"
								style="vertical-align: bottom;" width="60%" height="50%" /></td>
							<td class=""></td>
							<td class="" height="100px"><button type="button"
									onclick="fn_move('1')">예매 티켓</button></td>
						</tr>

						<tr>

							<td class="" width="500px"><font size="6"><b>${cdto.id}님
										반갑습니다!</b></font></td>
							<td class="" height="100px"><button type="button"
									onclick="fn_move('2')">나의 관람평</button></td>
						</tr>
						<tr>
							<td class="">보유 포인트: ${cdto.point} P</td>
							<td class="" height="100px"><button type="button"
									onclick="fn_move('3')">나의 문의 내역</button></td>
						</tr>
						<tr>

							<td class=""></td>
							<td class="b"><button type="button" class="b" id="b">회원정보</button>
							</td>
							<td class=""></td>
						</tr>
					</table>
				</div>
				<div id="info2">
					<h2>회원정보</h2>
					<table id="info2-table">
						<tr>
							<td class="" rowspan="3" width="250px"><img id="ii"
								src="https://i.pinimg.com/236x/f5/01/dd/f501ddf1d0174f84f24be501838cbb46.jpg"
								style="vertical-align: bottom;" width="150px" height="150px" /></td>
							<td class="" width="500px"><font size="6"><b>${cdto.id}님
										반갑습니다!</b></font></td>
							<td class="" height="100px"></td>
						</tr>

						<tr>

							<td id="use"><br>이름:    ${cdto.name } <br>
							<br> 생년월일: ${cdto.birth}<br>
							<br> 휴대전화: ${cdto.hp} <br>
							<br>이메일: ${cdto.email}<br>
							<br> 주소:     ${cdto.addres}</td>

							<td class="" height="100px"><button type="button"
									onclick="fn_move('1')">예매 티켓</button>
								<br>
							<br>
							<br>
							<button type="button" onclick="fn_move('2')">나의 관람평</button>
								<br>
							<br>
							<br>
							<button type="button" onclick="fn_move('3')">나의 문의 내역</button></td>
						</tr>
					</table>
				</div>

				<br> <br>

				<div>
					<div id="div1" style="WORD-BREAK: BREAK-ALL">
						<h2>나의 예매 내역</h2>
						<table id="table2">
							<c:set var="t" value="${rdto.ticketno}"></c:set>
							<c:choose>
								<c:when test="${not empty t }">
									<tr class="tr">
										<th></th>
										<th width="15%" class="th">영화제목</th>
										<th width="16%" class="th">티켓번호</th>
										<th width="16%" class="th">상영관</th>
										<th width="16%" class="th">관람일시</th>
										<th width="16%" class="th">좌석</th>
										<th width="16% class="th">예매취소</th>
									</tr>
									<tr class="tr">
										<td><a href="detail?mno=${mdto.mno}"><img id="poster" src="${mdto.poster}" alt="" /></a> </td>
										<td class="td" width="15%">${mdto.mtitle}</td>
										<td class="td" width="16%">${rdto.ticketno}</td>
										<td class="td" width="16%">${sdto.sname}</td>
										<td class="td" width="16%">${sdto.ssdate}</td>
										<td class="td" width="16%"><c:forEach var="r"
												items="${rlist}">
												<span>${r.seatno}</span>
											</c:forEach></td>
										<td width="16%"><input type="button" id="cancel"
											value="취소하기" /></td>
									</tr>
								</c:when>
								<c:when test="${empty t }">
									<tr>
										<th>영화제목</th>
										<th>티켓번호</th>
										<th>관람일시</th>
										<th>상영관</th>
										<th>좌석</th>
									</tr>
									<tr id="no">
										<td colspan="5">예매 내역이 없습니다.</td>
									</tr>
								</c:when>
							</c:choose>
						</table>
					</div>


					<div id="div2">
						<h2>나의 관람평</h2>
						<table id="table3">
							<tr>
								<th>영화</th>
								<th>영화평점</th>
								<th>내용</th>
								<th>등록일</th>
							</tr>
							<c:forEach var="co" items="${colist}">
						 <c:set var="colist" value="${co.mno}"></c:set>
						 <c:choose>
						  <c:when test="${not empty colist}">
							<tr>
								<td>${co.mtitle}</td>
								<td>${co.mcgrade }점</td>
								<td>${co.mccontents}</td>
								<td>${co.mcregdate}</td>
							</tr>
						   </c:when>
						  	<c:when test="${empty colist}">	
						   <tr>
							 <td colspan="4">관람평 작성 내역이 없습니다.</td>
						   </tr>
						   </c:when>
						</c:choose>	
						</c:forEach>
						</table>
					</div>

					<div id="div3">
						<h2>나의 문의 내역</h2>
						<table id="table4">
							<tr>
								<th>유형</th>
								<th>제목</th>
								<th>내용</th>
								<th>등록일</th>
							</tr>
							
						<c:forEach var="n" items="${nlist}">
						 <c:set var="nlist" value="${n.customerno}"></c:set>
						 <c:choose>
						  <c:when test="${not empty nlist}">
							<tr>
								<td>${n.ftype}</td>
								<td><a href="notice.do">${n.ftitle}</a></td>
								<td>${n.fcontents}</td>
								<td>${n.fregdate}</td>
							</tr>
						   </c:when>
						  	<c:when test="${empty nlist}">	
						   <tr>
							 <td colspan="4">문의 내역이 없습니다.</td>
						   </tr>
						   </c:when>
						</c:choose>	
						</c:forEach>	
						</table>
					</div>

				</div>
			</div>
		</form>
	</main>
	<%@ include file="/views/footer.jsp"%>
</body>
</html>