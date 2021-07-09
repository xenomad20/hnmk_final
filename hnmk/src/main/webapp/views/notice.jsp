<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/views/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- faq css -->
<link rel="stylesheet" href="resources/css/notice.css">
<link rel="stylesheet" href="resources/css/notice_table.css">

<!-- accodion,tabs + js -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script src="resources/js/notice_faq.js"></script>
<script src="resources/js/notice_notice.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
<script>
	
	function test(obj){
		$.ajax({
			url: "passChk.do",
			type : "GET",
			dataType : "JSON",
			data : { "fpwd" : obj.form[0].value,"fno" : obj.form[1].value},
			success : function(data){
				if(data==1){
					console.log("dddd");
					$("#delForm").submit();
				}else{

					alert("비밀번호가 틀렸습니다!!");
					return;
				}
			}
		})
		
	}

	
	
</script>
</head>
<body>

<!-- faq  -->
	<div class="contents">
		<div class="title_top">
			<h1>고객센터</h1>
		</div>
		<div id="tabs">
			<div class="tab_wrap">
				<!-- 고객센터 메뉴바 -->
				<ul>
					<li><a href="#tabs-1"><button class="tab_tit">FAQ</button></a>
					</li>
					<li><a href="#tabs-2"><button class="tab_tit">공지사항</button></a>
					</li>
					<li><a href="#tabs-3"><button class="tab_tit">1:1문의</button></a>
					</li>
				</ul>
			</div>
			<div class="tab_inquiry">
				<!-- 1:1 문의로 바로가기 -->
				<p>더 궁금한 점이 있거나, 이미 문의한 내용과 답변을 확인하려면?</p>
				<a href="notice_write.do?customerno=">1:1문의 바로가기</a>
			</div>

			<div class="table_faq" id="tabs-1">
				<!-- FAQ 메뉴 -->
				<table class="recruit">
					<colgroup style="width: 1100px;">
						<col width="25%">
						<col width="75%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">구분</th>
							<th scope="col">질문</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list }">
							<tr class="item">
								<td>${dto.ftype }</td>
								<td>${dto.ftitle }</td>
							</tr>
							<tr class="hide">
								<td colspan="2">${dto.fcontents }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div id="tabs-2">
				<div class="table_notice">
					<table>
						<colgroup>
							<col width="10%;" />
							<col width="auto;" />
							<col width="15%;" />
							<col width="7%;" />
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${important }">
							<tr class="notice_important">
								<td><strong></strong></td>
								<td id="important" ><a href="noticeDetail.do?nno=${dto.nno }">${dto.ntitle }</a></td>
								<td>${dto.nregdate }</td>
								<td>${dto.nhits }</td>
							</tr>
							
							</c:forEach>
							
							<c:forEach var="dto" items="${notice }" >
							<tr class="notice_tit">
								<td>${dto.nno }</td>
								<td><a href="noticeDetail.do?nno=${dto.nno }">${dto.ntitle }</a></td>
								<td>${dto.nregdate }</td>
								<td>${dto.nhits }</td>
							</tr>
							</c:forEach>
							<tr>
						<!-- 페이지 넘버 -->
							<td colspan="4"><c:if test="${prev1 }">
									<a href="notice.do?currentPageNo=${currentPageNo-1 }#tabs-2"><button>이전</button></a>
								</c:if> <c:forEach var="no" begin="${startPageNo1 }" end="${endPageNo1 }">
									<a href="notice.do?currentPageNo=${no }#tabs-2"><button>${no }</button></a>
								</c:forEach> <c:if test="${next1 }">
									<a href="notice.do?currentPageNo=${currentPageNo+1 }#tabs-2"><button>다음</button></a>
								</c:if>
							</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="tabs-3">
				<div>
					
					<table class="inquiry_pwd">
						<colgroup>
							<col width="auto;"/>
							<col width="10%;"/>
							<col width="7%;"/>
						</colgroup>
						<thead>
							<tr>
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="fdto" items="${inquiry }">
							<tr class="item">
								<td id="sc_tit">${fdto.ftitle }</td>
								<td>${fdto.fregdate }</td>
								<td>${fdto.fhits }</td>
							</tr>
							<tr	class="hide">
							<form action="noticeDetail_inquiry.do?fno=${fdto.fno }" id="delForm" > 
								<td>
									비밀번호 : <input type="password" name="fpwd" id="fpwd" />
									<input type="hidden" name="fno"  value="${fdto.fno }" />
								</td>
								<td colspan="2"><input type="button" id="passChk" onclick="test(this);" value="입력"></td>
							  </form> 
							</tr>
							</c:forEach>
						</tbody>
							<tr>
						<!-- 페이지 넘버 -->
								<td colspan="4"><c:if test="${prev2 }">
										<a href="notice.do?currentPageNo=${currentPageNo -1}#tabs-3"><button type="button">이전</button></a>
									</c:if> <c:forEach var="no" begin="${startPageNo2 }" end="${endPageNo2 }">
										<a href="notice.do?currentPageNo=${no }#tabs-3"><button>${no }</button></a>
									</c:forEach> <c:if test="${next2 }">
										<a href="notice.do?currentPageNo=${currentPageNo }#tabs-3"><button type="button">다음</button></a>
									</c:if>
								</td>
							</tr>
					</table>
				</div>

			</div>
		</div>
	</div>

<%@ include file="/views/footer.jsp" %> 
</body>
</html>