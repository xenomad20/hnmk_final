<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HNMK 시네마</title>

<style>
	
	* { 
	margin: 0;
	padding: 0;
	}
	
	li {
	list-style: none;
	}
	
	a {
	text-decoration: none;
	}
	
	header {
	width: 1100px;
	height: 140px;
	margin: 0 auto;
	background-color: #c52f3a;
	color: white;
	}
	
	h1 {
	margin: 0 auto;
	color: white;
	line-height: 40px;
	text-align: center;
	}
	
	.wrap-top {
	float: right;
	}
	
	.wrap-bottom {
	float: center;
	}
	
	.menu-top {
	display: flex;
	}
	
	.menu-top li {
	margin-top: 0;
	margin-right: 20px;
	}
	
	.menu-bottom {
	display: flex;
	}
	
	.menu-bottom li {
	margin-bottom: 0;
	margin-left: 160px;
	font-size: 20px;
	line-height: 150px;
	}


</style>
 
	<header>
        <div class="wrapper">
        <a href="/hnmk/home"><h1>HNMK CINEMA</h1></a>
        
            <div class="wrap-top">
                    <ul class="menu-top">     
                    	<c:if test="${empty sessionScope.id}">
                  
	                        <li><a href="/hnmk/loginForm.do"><font color="white">로그인</font></a></li>
	                        <li><a href="/hnmk/joinForm.do"><font color="white">회원가입</font></a></li>
                        </c:if>
                        
                        <c:if test="${not empty sessionScope.id}">
	                        <li><a href="/hnmk/logout.do"><font color="white">로그아웃</font></a></li>
	                        <li><a href="/hnmk/mypageForm.do"><font color="white">마이페이지</font></a></li>
                        </c:if>
                    </ul>
            </div>
            
            <div class="wrap-bottom">
                    <ul class="menu-bottom">
                        <li><a href="/hnmk/movie"><font color="white">영화</font></a></li>
                        <li><a href="/hnmk/reserve"><font color="white">예매</font></a></li>
                        <li><a href="/hnmk/theater?cno=1"><font color="white">극장</font></a></li>
                        <li><a href="/hnmk/notice.do"><font color="white">고객센터</font></a></li>
                    </ul>
            </div>
            
        </div>
    </header>

</head>

</html>