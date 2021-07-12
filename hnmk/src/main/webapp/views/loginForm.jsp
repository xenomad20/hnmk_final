<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<div class="">
	<div class="">
		<div>
		<c:set var="path" value="${pageContext.request.contextPath}" />
			<form action="${path}/login.do" method="post">
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" id="id" value="younee" required /> </td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
						<input type="password" name="pw" id="pw" value="1234" required />
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="submit" value="로그인" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

</body>
</html>