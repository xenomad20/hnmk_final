<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- faq css -->
<link rel="stylesheet" href="resources/css/notice.css">
<link rel="stylesheet" href="resources/css/notice_table.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- 1:1문의 css, 숫자카운터js -->
<link rel="stylesheet" href="resources/css/notice_write.css" />
<script src="resources/js/notice_write.js"></script>

</head>
<body>
	<div class="contents">
		<div class="title_top">
			<h1>고객센터</h1>
		</div>
		<div id="tabs">
			<div class="tab_wrap">
				<!-- 고객센터 메뉴바 -->
				<ul>
					<li><a href="notice.do"><button class="tab_tit">FAQ</button></a>
					</li>
					<li><a href="notice.do#tabs-2"><button class="tab_tit">공지사항</button></a>
					</li>
					<li><a href="notice.do#tabs-3"><button class="tab_tit">1:1문의</button></a>
					</li>
				</ul>
			</div>
		</div>

		<div class="write_con">
			<div class="con_top">
				<div class="icon">
					<p>FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수 있습니다.</p>
					<ul>
						<li>1:1 문의 글 답변 운영시간 10:00 ~ 19:00</li>
						<li>접수 후 48시간 안에 답변 드리겠습니다.</li>
					</ul>
				</div>
			</div>
			<div class="contxt_type1">
				<p>
					고객님의 문의에 <span class="type1_color">답변하는 직원은 고객 여러분의 가족 중 한
						사람</span> 일 수 있습니다.
				</p>
				<p class="type1_bottom">고객의 언어폭력(비하, 욕설, 반말, 성희롱 등)으로부터 직원을 보호하기
					위해 관련 법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.</p>
			</div>
			<div class="contxt_type2">
				<h4>문의내용 수정하기</h4>
				<span class="type2_color">*필수입력</span>
			</div>
		</div>
		<form action="inquiryModify.do" method="post">
			<table>
				<colgroup>
					<col width="15%;" />
					<col width="auto;" />
				</colgroup>
				<tbody>
					<tr>
						<th>작성자</th>
						<td>${modify.id }</td>
					</tr>
					<tr>
						<th>
						<span id="star">*</span> 제목
						<input type="hidden" name="ftype" value="1:1문의" />
						<input type="hidden" name="customerno" value="3" /><!-- 회원테이블이랑 연결? -->
						<input type="hidden" name="fno" value="${modify.fno }" />
						</th>
						<td>
							<input type="text" id="ntit" name="ftitle" placeholder="${modify.ftitle }" /> 
							<span id="ntit_cnt">(0/최대 50자)</span>
						</td>
					</tr>
					<tr>
						<th><span id="star">*</span> 내용</th>
						<td>
							<textarea id="ncon" name="fcontents" placeholder="${modify.fcontents}" cols="10" rows="10"></textarea>
							<span id="ncon_cnt">(0/최대 2000자)</span>
						</td>
					</tr>
					<tr>
						<th><span id="star">*</span> 비밀번호</th>
						<td><input type="text" name="fpwd" id="fpwd" placeholder="비밀번호 4자리이상 입력" maxlength="10" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="취소" id="reset" />
							<input type="submit" value="확인" id="ok"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

<%@ include file="/views/footer.jsp" %> 
</body>
</html>