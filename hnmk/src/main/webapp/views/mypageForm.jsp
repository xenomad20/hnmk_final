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
	height: 1500px;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 30px;
}

#table1 {
	background-color: #f3f4f6;
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
	border-top: 1px solid;
	border-bottom: 1px solid;
	border-collapse: collapse;
	text-align: left;
	color: black;
	font-size: 20px;
	width: 1100px;
	height: 300px;
	margin: auto;
	background-color: #f3f4f6;
	margin-bottom: 30px;
	margin-top: 30px;
}

#table4 {
	width: 1100px;
	height: 300px;
	text-align: center;
	margin: auto;
}

#r1 {
	padding-top: 50px;
	padding-left: 40px;
	float: left;
}

#r2 {
	padding-top: 50px;
	padding-left: 330px;
	float: left;
}

#r3 {
	padding-left: 40px;
	padding-bottom: 40px;
	float: left;
}

#r4 {
	padding-left: 310px;
	padding-bottom: 40px;
	float: left;
}

#r5 {
	padding-left: 40px;
	float: left;
	padding-bottom: 50px;
}

#r6 {
	padding-left: 30px;
}

#r7 {
	padding-right: 30px;
}

#r8 {
	padding-left: 30px;
}

#r9 {
	padding-right: 30px;
}

#r10 {
	padding-left: 30px;
}

button {
	font-size: 16px;
	background: transparent;
	border: 0px;
	outline: 0px;
	cursor: pointer;
}

#b {
	font-size: 16px;
	background: transparent;
	border: 0px;
	outline: 0px;
	cursor: pointer;
}
</style>

<script>
	function fn_move(seq) {
		var offset = $("#div" + seq).offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);
	}
</script>
</head>

<body>
	<main>
		<form action="cancel" method="post">
			<input type="hidden" name="customerno" value="${cdto.customerno}" />
			<input type="hidden" name="ticketno" value="${rdto.ticketno}" />
			<input type="hidden" name="sname" value="${sdto.sname}" />
			
			<c:forEach var="r" items="${rlist}">
				<input type="hidden" name="seatno" value="${r.seatno}" />
			</c:forEach>
			<div id="container">
				<table id="table1">
					<tr>
						<td class="" rowspan="3" width="250px"><img
							src="resources/images/customer.png"
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
						<td class="">보유 포인트: ${cdto.point}</td>
						<td class="" height="100px"><button type="button"
								onclick="fn_move('3')">나의 문의 내역</button></td>
					</tr>

					<tr>
						<td class="b"><input type="button" id="b" value="회원정보"
							onclick="location.href='/hnmk/customerInfoForm.do'" /></td>
						<td class=""></td>
						<td class="" height="100px"><button type="button"
								onclick="fn_move('4')">나의 참여 이벤트</button></td>
					</tr>
				</table>

				<br> <br>

				<div>
					<div id="div1">
						<h2>나의 예매 내역</h2>
						<hr>
						<table id="table2">
							<c:set var="t" value="${rdto.ticketno}"></c:set>
							<c:choose>
								<c:when test="${not empty t }">
									<tr>
										<td id="r1">영화제목 : ${mdto.mtitle}</td>
										<td id="r2">티켓번호 : ${rdto.ticketno}</td>
									</tr>

									<tr>
										<td id="r3">관람일시 : ${sdto.ssdate}</td>
										<td id="r4">상영관 : ${sdto.sname}</td>
									</tr>

									<tr>
										<c:forEach var="r" items="${rlist}">
											<td colspan="2" id="r5">관람좌석 : ${r.seatno}</td>
										</c:forEach>
									</tr>
									<tr>
										<td><input type="submit" value="예매취소" /></td>
									</tr>
								</c:when>
								<c:when test="${empty t }">
									<tr>
										<td id="r6">영화제목 :</td>
										<td id="r7">티켓번호 :</td>
									</tr>

									<tr>
										<td id="r8">관람일시 :</td>
										<td id="r9">상영관 :</td>
									</tr>

									<tr>
										<td colspan="2" id="r10">관람좌석 :</td>
									</tr>
								</c:when>
							</c:choose>
						</table>
					</div>

					<div id="div2">
						<h2>나의 관람평</h2>
						<hr>
						<p style="text-align: center;">
							<br> <br> <br> <br> <br> <font
								color="gray">나의 관람평이 없습니다.</font> <br> <br> <br>
							<br> <br>
					</div>

					<div id="div3">
						<h2>나의 문의 내역</h2>
						<hr>
						<table id="table4">
							<tr>
								<th>유형</th>
								<th>제목</th>
								<th>답변상태</th>
								<th>등록일</th>
							</tr>

							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>

							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>

							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>

							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>

					<div id="div4">
						<h2>나의 참여 이벤트</h2>
						<hr>
						<p style="text-align: center;">
							<br> <br> <br> <br> <br> <font
								color="gray">나의 참여 이벤트가 없습니다.</font> <br> <br> <br>
							<br> <br>
					</div>
				</div>
			</div>
		</form>
	</main>
	<%@ include file="/views/footer.jsp"%>
</body>
</html>