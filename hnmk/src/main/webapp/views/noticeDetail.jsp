<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- detail페이지 css -->
<link rel="stylesheet" href="resources/css/notice_detail.css" />

</head>
<body>
<div class="detail">
	<div>
		<h1 style="color: black; padding: 20px;">공지사항</h1>
	</div>
	
		<table>
			<thead>
				<tr>
					<td colspan="3" id="detail_tit">${detail.ntitle }</td>
				</tr>
			</thead>
			<tbody>
				<tr id="detail_info">
					<td>작성자 || ${detail.id}</td>
					<td>등록일 || ${detail.nregdate }</td>
					<td>조회수 || ${detail.nhits}</td>
				</tr>
			
			<tr>
				<td colspan="3" id="detail_contants">${detail.ncontents}</td>
			</tr>
			</tbody>
			
			<tr>
				<td colspan="3"><a href="notice.do?#tabs-2"><button>목록</button></a></td>
			</tr>
		</table>
	</div>

<%@ include file="/views/footer.jsp" %> 
</body>
</html>