<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/views/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
		
		//다음 우편 번호 서비스
		window.onload = function() {
			var btn = document.getElementById("btn");
			btn.onclick = openKaKaoPostCode;
		}
		
		//다음 우편 번호 서비스
		function openKaKaoPostCode(){
			new daum.Postcode({
				//JSON 타입으로 작성
				oncomplete: function(data) {
					//console.dir(data);
					
					//팝업에서 검색 결과 항목을 클릭하면 실행되는 코드
					document.getElementById("addres").value=data.zonecode;
					document.getElementById("addresdetail").value=data.address;
				}
			}).open();
		}
		
	</script>
	
	<script type="text/javascript">
	
	//아이디 중복 체크
	function fn_idDupCheck(){
	    $.ajax({
	      url : "/hnmk/idDupCheck",
	      type : "get",
	      dataType : "text",
	      data : {"id" : $("#id").val()},
	      success : function(data){
	        if(data == 1){
	          alert("사용불가");
	          console.log("사용불가");
	        }else if(data == 0){
	          $("#idDupCheck").attr("value", "Y");
	          alert("사용가능");
	          console.log("사용가능");
	        }
	      }
	    })
	  }
	
	//입력 확인 경고창 띄우기
    function checkValue() {
       
       var agreement = document.getElementById("agreement");
       var id = document.getElementById("id").value;         
       var pwd = document.getElementById("pwd").value;
       var pwdCheck = document.getElementById("pwdCheck").value;         
       var name = document.getElementById("name").value;     
       var birth = document.getElementById("birth").value; 
       var hp = document.getElementById("hp").value;         
       var email = document.getElementById("email").value;         
       var addres = document.getElementById("addres").value;
       
       if (agreement.checked == false) {
          alert("약관에 동의하세요");
          return false;
       }
       
       if (id == "") {
          alert("아이디를 입력하세요");
          return false;
       }
       
       if (pwd == "") {
          alert("비밀번호를 입력하세요");
          return false;
       } else {
          if (pwd != pwdCheck) {
             alert("비밀번호가 일치하지 않습니다");
             return false;   
          }
       }
       
       if (name == "") {
          alert("이름을 입력하세요");
          return false;
       }
       
       if (birth == "") {
           alert("생년월일을 입력하세요");
           return false;
        }
       
       if (hp == "") {
          alert("전화번호를 입력하세요");
          return false;
       }
       
       if (email == "") {
          alert("이메일을 입력하세요");
          return false;
       }
       
       if (addres == "") {
          alert("주소를 입력하세요");
          return false;
       }
       
       
       document.getElementById('joinForm').submit();
       
      }
	
	</script>

<style>

* {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
  border-radius: 5px;
}
 
#agreementDiv {
	width: 1100px;
    heignt: 400px;
    background-color: #fdfcf0;
    margin-right: auto;
    margin-left: auto;
    margin-top: 50px;
    margin-bottom: 50px;
    padding: 20px;
    text-align: left;
    border: none; 
}

#agreementDiv textarea {
	width: 98%;
}

#joinInfoDiv {
    width: 1100px;
    heignt: 400px;
    background-color: #fdfcf0;
    margin-right: auto;
    margin-left: auto;
    margin-top: 50px;
    margin-bottom: 50px;
    padding: 20px;
    text-align: left;
    border: none;   
}

#registerbtn {
	display: flex;
	justify-content: center;
}

</style>

</head>
<body>
	<main>
	<div id="join-form">
		<br>
		<br>
		<form id="joinForm" action="/hnmk/joinProc.do" method="get">

		<!-- 약관동의 division -->
		<div id="agreementDiv">
			<b><font size="6" color="gray">회원가입</font></b>
			<br>
			<br>
			<b><font size="4">1. 약관 동의</font></b>
			<br>
			<textarea name="agreeContents" form="inform" cols="170" rows="10">제 1조. 목적 
본 약관은 HNMK시네마(주)(이하 “회사”라 합니다)가 제공하는 온라인, 오프라인 서비스(이하 "서비스"라 합니다) 이용과 관련하여 회사와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다. 

제 2조. 약관의 효력 및 변경 
본 약관은 서비스를 이용하고자 본 약관에 동의한 모든 회원에 대하여 그 효력을 발생합니다. 본 약관의 내용은 회원(서비스)가입 시 게재되거나 공지된 내용에 회원이 동의함으로써 그 효력이 발생합니다. 회사는 합리적인 사유가 발생될 경우 본 약관을 변경(수정 또는 개정)할 수 있으며, 약관을 개정할 경우 회사는 시행일 및 개정 사유를 명시하여 현행 약관과 함께 시행일로부터 최소 7일 전, 고객에게 불리하게 변경되거나 중요한 내용인 경우에는 최소 30일 전에 회사의 웹사이트 또는 전자메일 등을 통해 공지합니다. 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, 변경된 약관의 효력 발생일 이후 탈퇴 요청을 하지 않을 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.

제 3조. 약관 외 준칙
본 약관에 명시되지 아니한 사항에 대해서는 전자상거래 등에서의 소비자보호에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령의 규정에 따릅니다. 본 약관에 명시되지 않은 서비스에 대한 사항은 당사 홈페이지, 모바일 또는 영화관 현장을 통한 해당 서비스 공지사항에 따릅니다.</textarea>
			<br>
			<input type="checkbox" id="agreement" name="agreement" />약관에 동의합니다.
		</div>
		
		<!-- 회원정보 division -->
		<div id="joinInfoDiv">
			<b><font size="4">2. 회원정보</font></b>
			<br>
			<br>
				<table>
				
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" id="id" name="id" value="" maxlength="20" />
							<button type="button" id="idDupCheck" onclick="fn_idDupCheck();" value="N">중복확인</button>
						</td>
					</tr>
					
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" id="pwd" name="pwd" value="" maxlength="15" />
						</td>
					</tr>
					
					<tr>
						<td>비밀번호 확인</td>
						<td>
							<input type="password" id="pwdCheck" name="pwdCheck" value="" maxlength="15" />
							<div class="valid"><font size="2" color="gray">비밀번호를 다시 입력하세요</font></div>
						</td>
					</tr>
					
					<tr>
						<td>이름</td>
						<td>
							<input type="text" id="name" name="name" value="" maxlength="40" />
						</td>
					</tr>
					
					<tr>
						<td>생년월일</td>
						<td>
							<input type="text" id="birth" name="birth" value="" maxlength="40" />
							<div class="valid"><font size="2" color="gray">공백 없이 입력하세요 예)19800101</font></div>
						</td>
					</tr>
					
					<tr>
						<td>휴대전화</td>
						<td>
							<input type="text" id="hp" name="hp" value="" maxlength="30" />
							<div class="valid"><font size="2" color="gray">공백 없이 입력하세요 예)01012345678</font></div>
						</td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td>
							<input type="text" id="email" name="email" value="" maxlength="30" />
						</td>
					</tr>
					
					<tr>
                         <td>주소</td>
                         <td><input type="text" id="addres" name="addres" size="5" />
							 <input type="button" id="btn" value="우편번호 찾기" />
							 <br>
							 <input type="text" id="addresdetail" name="addresdetail" size="40" />
                         </td>
                    </tr>
					
				</table>
			</div>			
			<div id="registerbtn">			
				<input type="button" value="가입하기" style="width:500px; height:30px;"onclick="checkValue()" />
			</div>
			<br>
			<br>
			<br>
			<br>
		</form>
	</div>
	</main>
<%@ include file="/views/footer.jsp" %>
</body>
</html>