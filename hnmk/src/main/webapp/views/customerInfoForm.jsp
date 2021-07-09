<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>

<style>
	div {
		width: 1100px;
		margin: auto;
	}
</style>

</head>
<body>
	<div>
        <font size="4"><b>회원 정보</b></font>
		<br>
		<br>
		<table cellpadding="5px">
				
			<tr>
				<td><strong>아이디: ${dto2.id} </strong></td>
				<td>
				</td>
			</tr>
					
			<tr>
				<td><strong>비밀번호: ${dto2.pwd}</strong></td>
				<td>
				</td>
			</tr>
					
			<tr>
				<td><strong>이름: ${dto2.name} </strong></td>
				<td>
				</td>
			</tr>
			
			<tr>
				<td><strong>생년월일: ${dto2.birth} </strong></td>
				<td>
				</td>
			</tr>
					
			<tr>
				<td><strong>휴대전화: ${dto2.hp}</strong></td>
				<td>
				</td>
			</tr>
					
			<tr>
				<td><strong>이메일: ${dto2.email}</strong></td>
				<td>
				</td>
			</tr>
					
			<tr>
                <td><strong>주소: ${dto2.addres}</strong></td>
                <td>
                </td>
            </tr>
					
		</table>
				
	<br>
	<div class="btn-center">
	<input type="button" class="btn" value="홈으로">
	<input type="button" class="btn" value="수정하기">
	<input type="button" class="btn" value="탈퇴하기">
    </div>
    
    </div>
</body>
</html>