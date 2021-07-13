<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- detail_inquiry페이지 css -->
<link rel="stylesheet" href="resources/css/notice_detail_inquiry.css" />
<script src="resources/js/notice_inquiryDelete.js"></script>

</head>
<body>
	<div class="detail_inquiry">
		<form action="noticeDetail_inquiry.do" method="post" id="viewForm">
			<table>
				<thead>
					<tr>
						<td colspan="2" id="detail_inquiry_tit">${inquiryOne.ftitle }</td>
						<td>
							<a href="inquiryModify.do?fno=${inquiryOne.fno }"><button type="button" id="btn_modify">수정</button></a>	
							<button type="button" id="btn_delete">삭제</button>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr id="detail_inquiry_info">
						<td>작성자 || ${inquiryOne.id}</td>
						<td>등록일 || ${inquiryOne.fregdate }</td>
						<td>조회수 || ${inquiryOne.fhits}</td>
					</tr>
				
				<tr>
					<td colspan="3" id="detail_inquiry_contants">${inquiryOne.fcontents}</td>
				</tr>
				</tbody>
			</table>
			
			<table>
				<colgroup>
					<col width="15%;"/>
					<col width="auto;"/>
					<col width="15%;"/>
					<col width="10%;"/>
				</colgroup>
				<tr >
					<td>${cdto.id } : <!-- 회원번호테이블에서 id 받아옴 -->
						<input type="hidden" name="customerno" value="${inquiryOne.customerno }" /> <!-- id받아오면서 customerno도 받아와서 값으로 넣어줌 -->
						<input type="hidden" name="fno" value="${inquiryOne.fno }" />	<!-- fno도 조인해서 받아와야 겠네요 -->
					</td>	
					<td ><textarea name="acontents" id="acontents" cols="30" rows="10"></textarea></td>
					<td colspan="2"><input type="submit" id="enter" value="입력" /></td>
				</tr>
				<c:forEach var="dto" items="${answer }">
				<tr>
					<td>${dto.id } </td>	<!-- answer테이블 가져오기 id도 조인해서 받아옴 -->
					<td colspan="2"><p>${dto.acontents }</p></td>
					<td>${dto.aregdate }</td>
					
				</tr>
				</c:forEach>
			</table>
		</form>
		<div class="detail_inquiry_button">
			<a href="notice.do?#tabs-3"><button>목록</button></a>
			
		</div>
	</div>

<%@ include file="/views/footer.jsp" %> 
</body>
</html>