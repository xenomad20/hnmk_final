<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>

* {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
  border-radius: 5px;
}
 
table {
    width: 300px;
    heignt: 400px;
    background-color: #EEEFF1;
    margin-right: auto;
    margin-left: auto;
    margin-top: 50px;
    margin-bottom: 50px;
    padding: 20px;
    text-align: left;
    border: none;   
}

#loginbtn {
	width: 200px;
	height: 25px;
	margin-top: 20px;
	margin-left: 30px;
	alignment: center;
}

</style>

</head>

<body>
<main>

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
						<td>
						</td>
					</tr>
					<tr>
						<td>
						<a href="/hnmk/joinForm.do"><font color="#c52f3a">회원가입  | </font></a>  
						</td>
						<td>
						<a href="/hnmk/idpwFindForm.do"><font color="#c52f3a">아이디/비밀번호 찾기</font></a>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="submit" id="loginbtn" value="로그인" style="text-align: center;" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

</main>
<%@ include file="/views/footer.jsp" %>
</body>
</html>