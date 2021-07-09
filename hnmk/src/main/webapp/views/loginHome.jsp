<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 홈</title>
</head>
<body>
	<h1>로그인아웃 테스트용 홈</h1>
	<h2>${id}님, 반갑습니다</h2>

		<input type="button" value="회원가입"onclick="location.href='/hnmk/joinForm.do'" />
		<input type="button" value="로그인" onclick="location.href='/hnmk/loginForm.do'" />
		<input type="button" value="로그아웃" onclick="location.href='/hnmk/logout.do'" />
		<input type="button" value="마이페이지" onclick="location.href='/hnmk/mypageForm.do'" />

</body>
</html>