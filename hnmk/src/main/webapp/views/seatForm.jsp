<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
</script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
<style>
main{
	width: 1100px;
	height: 691px;
	margin: 0 auto;
	margin-top:30px;
}

#left-title {
	font-size: 15px;
	padding-bottom:20px;
}
#seat-title{
	padding-top:10px;
	padding-bottom:10px;
}
#seat-section {
	width: 770px;
	height: 555px;
	border-top: 1px solid black;
}

#seat-area {
	width: 770px;
	height: 507px;
	border: 1px solid #d8d9db;
}

#seat-count {
	background: #f2f4f5;
	height: 50px;
}

#seat-count-desc {
	padding-top: 10px;
}

.seat-age {
	padding-left: 20px;
}

.bt-down {
	padding: 5px;
	width: 32px;
	height: 32px;
	margin-right: -10px;
	border-radius: 5px 0 0 5px;
	background-color: white;
	border: 1px solid #d8d9db;
	cursor: pointer;
}

.bt-now {
	padding: 5px;
	width: 42px;
	height: 32px;
	background-color: white;
	border: 1px solid #d8d9db;
}

.bt-up {
	padding: 5px;
	margin-left: -10px;
	width: 32px;
	height: 32px;
	border-radius: 0 5px 5px 0;
	background-color: white;
	border: 1px solid #d8d9db;
	cursor: pointer;
}

#seat-img {
	margin-top: 50px;
	margin-left: 40px;
}

#seat-screen {
	margin: 0px auto;
	width: 390px;
	margin-top: 25px;
}

.avail0 {
	width: 34px;
	height: 24px;
	margin-top: 5px;
	background-color: #747474;
	color: white;
	border: 1px solid #d8d9db;
	cursor: pointer;
}

.avail1 {
	width: 34px;
	height: 24px;
	margin-top: 5px;
	background-color: #747474;
	color: white;
	border: 1px solid #d8d9db;
	cursor: pointer;
}

.avail2 {
	width: 34px;
	height: 24px;
	margin-top: 5px;
	background-color: #747474;
	color: white;
	border: 1px solid #d8d9db;
	cursor: pointer;
}

#corona {
	width: 34px;
	height: 24px;
	margin-top: 5px;
	background-color: rgb(165, 150, 152);
	color: white;
	border: 1px solid #d8d9db;
	margin-left: 20px;
}

#corona-desc {
	font-size: 13px;
	font-weight: bold;
}

#container-right {
	width: 310px;
	height: 570px;
	margin-left: 20px;
	background-color: #333;
	border-radius: 10px;
	overflow: hidden;
	position: relative;
	bottom: 557px;
	left: 770px;
	color: white;
}

#title-area {
	margin: 0px auto;
	width: 242px;
	border-bottom: 1px solid #434343;
	margin-bottom: 30px;
	border-bottom: 1px solid #434343;
}

#movie-title {
	padding-top:20px;
	padding-bottom:20px;
	overflow: hidden;
	padding-left: 20px;
}

#desc-area {
	margin: 0px auto;
	width: 242px;
	height: 150px;
	border-bottom: 1px solid #434343;
	color: #c4c4c4;
	border-bottom: 1px solid #434343;
}

.desc-p {
	font-size: 15px;
	margin-left: 20px;
	padding-top:5px;
}

.desc-span {
	position: relative;
	left: 20px;
	bottom: 85px;
}

#movie-poster {
	width: 80px;
	height: 120px;
	position: relative;
	bottom: 81px;
	left: 50px;
}

#choise-area {
	margin: 0px auto;
	border-radius: 5px;
	border: 1px solid #434343;
	width: 242px;
	height: 220px;
	font-size: 12px;
	color: #c4c4c4;
}

#seat-desc {
	float: left;
	width: calc(100% - 117px);
	height: 220px;
}

#seat-choise {
	font-size: 15px;
	text-align: center;
	float: right;
	width: 116px;
	height: 220px;
	border-left: 1px solid #434343;
	padding-top:20px;
}

.seat-img {
	padding-top: 20px;
	width: 18px;
	height: 18px;
	margin-top: 3px;
	margin-right: 10px;
	margin-left: 20px;
}

#pay-area {
	width: 310px;
	margin: 0px auto;
	margin-top: 20px;
}

#pay {
	font-size: 16px;
	color: white;
	font-weight: bold;
	margin-left: 25px;
}

#page {
	margin: 0px auto;
	width: 310px;
	margin-top: 12px;
	text-align: center;
}

#before {
	float: left;
	width: 155px;
	height: 50px;
	background-color: #53565b;
	padding-top: 1px;
}

#after {
	float: right;
	width: 155px;
	height: 50px;
	background-color: #E0E0E0;
	padding-top: 1px;
}

#before-bt {
	color: white;
	font-size: 20px;
	text-decoration: none;
	cursor: pointer;
}

#after-bt {
	font-size: 20px;
	color: #AAAAAA;
	text-decoration: none;
	cursor: default;
}

#money {
	font-size: 24px;
	padding-left: 60px;
	color: #59bec9;
	padding-right: 10px;
	padding-top: 10px;
}

.select {
	cursor: pointer;
	padding-top:12px;
}

.enroll_top {
	text-align: left;
	position: relative;
	bottom: 100px;
	right: 24px;
	border-radius: 10px 10px 0px 0px;
	width: 230px;
	height: 32px;
	background-color: #503396;
}

.top_msg {
	padding-left: 5px;
	padding-top: 5px;
	font-size: 16px;
	color: white;
}

.modal .btn {
	cursor: pointer;
	border: 1px solid #999999;
	text-align: center;
	border-radius: 5px;
	outline: none;
	font-weight: 500;
}

.dimLayer {
	display: block;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	position: fixed;
	left: 0;
	top: 0px;
	margin: 0;
	padding: 0;
	z-index: 9998;
}

.modal {
	width: 230px;
	height: 160px;
	border-radius: 10px;
	padding: 80px 24px;
	box-sizing: border-box;
	text-align: center;
}

.modal-section {
	background: #ffffff;
	box-sizing: border-box;
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	display: none;
	z-index: 9999;
}

.menu_msg {
	font-size: 13px;
	font-weight: bold;
	padding:5px;
}
.entroll_box{
width:190;
text-align:center;
}
.enroll_box p {

	padding-bottom: 5px;
	position: relative;
	bottom: 85px;
	padding:10px;
}

.navy_btn {
	position: relative;
	bottom: 75px;
	width: 50px;
	background: #503396;
	color: white;
	height: 34px;
	line-height: 36px;
	transition: 0.5s;
	font-size: 15px;
	border: none;
}
#filmgrade{
   width: 23px;
   height: 23px;
	position: relative;
	top:3px;
	right:3px;
}
</style>
<script type="text/javascript">
	var no = 0; //onclick함수 밖에서 성인과 청소년 인원수의 합을 담을 전역변수
	var sung = 0; //성인 인원수 담을 변수
	var chung = 0; //청소년 인원수 담을 변수
	var money = 0; //총가격 담을 변수 ,를표시하기위해 문자열로만드는변수
	var payMoney = 0; //총가격 담을 변수 결제할때 사용하는 변수
	var id; //선택한좌석 parameter로 넘겨주기위한변수
	
	function count(type) {//성인 인원수 버튼 함수
		//숫자표시
		var now = document.getElementById('bt-now-1');
		var now1 = document.getElementById('bt-now-2');
		//현재 버튼의 text값 (0)
		var num = now.innerText;
		var num1 = now1.innerText;
		//버튼 숫자변경
		if (type == 'plus') {
			num = parseInt(num); //성인
			num1 = parseInt(num1);//청소년

			if (num + num1 < 4) {
				num = num + 1;
			} else if (num + num1 == 4) {
				action_popup.alert("인원 선택은 총 4명까지 가능합니다.");
				$(".modal_close").on("click", function() {
					action_popup.close(this);
					$(".modal_close").attr('onclick',"").unbind('click');
				});
			}
		} else if (type == 'minus') {
			num = parseInt(num);
			num1 = parseInt(num1);
			if (num > 0) {
				num = num - 1;
			}
		}
		now.innerText = num;
		no = num + num1;

		sung = num;
	}

	function count2(type) {//청소년 인원수 버튼 함수
		//숫자표시
		var now = document.getElementById('bt-now-2');
		var now1 = document.getElementById('bt-now-1');
		//현재 버튼의 text값 (0)
		var num = now.innerText;
		var num1 = now1.innerText;
		//버튼 숫자변경
		if (type == 'plus') {
			num = parseInt(num); //청소년
			num1 = parseInt(num1); //성인

			if (num + num1 < 4) {
				num = num + 1;
			} else if (num + num1 == 4) {
				action_popup.alert("인원 선택은 총 4명까지 가능합니다.");
				$(".modal_close").on("click", function() {
					action_popup.close(this);
					$(".modal_close").attr('onclick',"").unbind('click');
				});
			}
		} else if (type == 'minus') {
			num = parseInt(num);
			num1 = parseInt(num1);
			if (num > 0) {
				num = num - 1;
			}
		}

		now.innerText = num;

		//성인과 청소년의 합을 전역변수에 담는다
		no = num + num1;

		chung = num;
	}

	$(function() {
		var test = 0; //선택한 좌석 각각담기게하는 변수

		/*코로나 좌석 거리두시 표시*/
		$(".avail1").prop("disabled", true).css("cursor", "default").html('-')
				.css("background-color", "rgb(165, 150, 152)");
		/*예매 완료 좌석 표시  */
		$(".avail2").prop("disabled", true).css("cursor", "default").html('X')
				.css("background-color", "rgb(165, 150, 152)");

		/*좌석 클릭할때  */
		$(".avail0").click(
				function() {
					/*클릭한 좌석의 id값  */
					var id = $(this).attr("id");
					
					test++; //선택한 좌석이 각각담기게 기준을 줌 한번클릭할때마다 늘어남

					money = ((sung * 13000) + (chung * 11000)); //전역변수에 표값담음 money가 전역변수인 이유는 
					// 선택한좌석클릭시 초기화를해줘야하기때문 => 470line

					payMoney = ((sung * 13000) + (chung * 11000));//결제할때 사용할 총가격

					money = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g,
							',');
					//좌석을 성인과 청소년 인원수의 합까지만 선택가능하게
					// no 사용자가 선택한 인원수

					//up down 버튼을 내리다가 해당 인원수가되었을때 
					//선택한좌석이 계속남아서 
					//ex) 4명일때 a1,a1,a1,a1 였는데 3명일때도 a1,a1,a1,a1 가되버려서
					//html로 따로지정을해줌

					if (no == 0) { //총 0명일때는 선택좌석표시 0개
						action_popup.alert("관람하실 인원을 먼저 선택해주세요.");
						$(".modal_close").on("click", function() {
							action_popup.close(this);
							$(".modal_close").attr('onclick',"").unbind('click');
						});
						
						$("#seat-select").html(".");
						$("#seat-select2").html(".");
						$("#seat-select3").html(".");
						$("#seat-select4").html(".");
						test = 0;

					} else if (no == 1) { //총 1명일대는 선택좌석표시 1개
						if (test == 1) { //각!각! 선택한좌석이 담기기위해 
							$("#seat-select").html(id);
							$("#seatno1").val(id);
							$("#" + id).prop("disabled", true).css("cursor",
									"default").html(id).css("background-color",
									"#503396"); //좌석이 중복되지않게 클릭불가
							$("#after").css("background-color", "#329eb1");
							$("#after-bt").css("color", "white").css("cursor",
									"pointer");
							$(".bt-down").prop("disabled", true);
							$(".bt-up").prop("disabled", true);
						}
						$("#seat-select2").html(".");
						$("#seat-select3").html(".");
						$("#seat-select4").html(".");

						$("#money").html(money); //금액표시

						if (test == 2) { //선택좌석외에 다른좌석을 클릭하여 +1이 되었을때
							
							action_popup.alert("좌석 선택이 완료되었습니다.");
							$(".modal_close").on("click", function() {
								action_popup.alert("다시 선택 하시려면 오른쪽 선택한 좌석을 클릭해주세요.");
								$(".modal_close").on("click", function() {
									action_popup.close(this);
								});
							});
						}
					} else if (no == 2) { //총 2명일때는 선택좌석표시 2개
						if (test == 1) {
							$("#seatno1").val(id);
							$("#seat-select").html(id);
							$("#" + id).prop("disabled", true).css("cursor",
									"default").html(id).css("background-color",
									"#503396");
						} else if (test == 2) {
							$("#seatno2").val(id);
							$("#seat-select2").html(id);
							$("#" + id).prop("disabled", true).css("cursor",
									"default").html(id).css("background-color",
									"#503396");
							$("#after").css("background-color", "#329eb1");
							$("#after-bt").css("color", "white").css("cursor",
									"pointer");
							$(".bt-down").prop("disabled", true);
							$(".bt-up").prop("disabled", true);
						}
						$("#seat-select3").html(".");
						$("#seat-select4").html(".");

						$("#money").html(money);
						if (test == 3) {
							action_popup.alert("좌석 선택이 완료되었습니다.");
							$(".modal_close").on("click", function() {
								
								action_popup.alert("다시 선택 하시려면 오른쪽 선택한 좌석을 클릭해주세요.");
								$(".modal_close").on("click", function() {
									action_popup.close(this);
								});
							});
						}
					} else if (no == 3) { //총 3명일때는 선택좌석표시 3개
						if (test == 1) {
							$("#seatno1").val(id);
							$("#seat-select").html(id);
							$("#" + id).prop("disabled", true).css("cursor",
									"default").html(id).css("background-color",
									"#503396");
						} else if (test == 2) {
							$("#seatno2").val(id);
							$("#seat-select2").html(id);
							$("#" + id).prop("disabled", true).css("cursor",
									"default").html(id).css("background-color",
									"#503396");
						} else if (test == 3) {
							$("#seatno3").val(id);
							$("#seat-select3").html(id);
							$("#" + id).prop("disabled", true).css("cursor",
									"default").html(id).css("background-color",
									"#503396");
							$("#after").css("background-color", "#329eb1");
							$("#after-bt").css("color", "white").css("cursor",
									"pointer");
							$(".bt-down").prop("disabled", true);
							$(".bt-up").prop("disabled", true);
						}
						$("#seat-select4").html(".");

						$("#money").html(money);
						
						if (test == 4) {
							action_popup.alert("좌석 선택이 완료되었습니다.");
							
							$(".modal_close").on("click", function() {
								action_popup.alert("다시 선택 하시려면 오른쪽 선택한 좌석을 클릭해주세요.");
								$(".modal_close").on("click", function() {
									action_popup.close(this);
								});
							});
						}
					} else { //총 4명일때는 선택좌석표시 4개
						if (test == 1) {
							$("#seatno1").val(id);
							$("#seat-select").html(id);
							$("#" + id).prop("disabled", true).css("cursor",
									"default").html(id).css("background-color",
									"#503396");
						} else if (test == 2) {
							$("#seatno2").val(id);
							$("#seat-select2").html(id);
							$("#" + id).prop("disabled", true).css("cursor",
									"default").html(id).css("background-color",
									"#503396");
						} else if (test == 3) {
							$("#seatno3").val(id);
							$("#seat-select3").html(id);
							$("#" + id).prop("disabled", true).css("cursor",
									"default").html(id).css("background-color",
									"#503396");
						} else if (test == 4) {
							$("#seat-select4").html(id);
							$("#seatno4").val(id);
							$("#" + id).prop("disabled", true).css("cursor",
									"default").html(id).css("background-color",
									"#503396");
							$("#after").css("background-color", "#329eb1");
							$("#after-bt").css("color", "white").css("cursor",
									"pointer");
							$(".bt-down").prop("disabled", true);
							$(".bt-up").prop("disabled", true);
						}

						$("#money").html(money);
						if (test == 5) {
							action_popup.alert("좌석 선택이 완료되었습니다.");
							$(".modal_close").on("click", function() {
								action_popup.alert("다시 선택 하시려면 오른쪽 선택한 좌석을 클릭해주세요.");
								$(".modal_close").on("click", function() {
									action_popup.close(this);
								});
							});
						}
					}
				});

		$(".select").on('click', function() {//선택좌석을 클릭하면
			//모든값들이 계속 유지되는걸 방지
			
			//인원수 초기화
			no = 0;
			sung = 0;
			chung = 0;
			//선택좌석기준 초기화
			test = 0;
			//금액 초기화
			money = 0;
			$("#money").html("0");
			//인원수 html 초기화
			$("#bt-now-1").html("0");
			$("#bt-now-2").html("0");
			//선택한 좌석들 모두초기화
			$("#seat-select").html(".");
			$("#seat-select2").html(".");
			$("#seat-select3").html(".");
			$("#seat-select4").html(".");

			//선택한좌석 css 초기화 그리고 클릭은 다시 되게하여야한다다
			$(".avail0").removeAttr("style").prop("disabled", false);

			//변경할수없게한 인원수 버튼도 초기화
			$(".bt-down").prop("disabled", false);
			$(".bt-up").prop("disabled", false);

			//다음페이지이동 버튼 css도 초기화
			$("#after").removeAttr("style");
			
			$(".modal_close").attr('onclick',"").unbind('click');
			
			//넘길 parameter값들 초기화
			$("#seatno1").val("");
			$("#seatno2").val("");
			$("#seatno3").val("");
			$("#seatno4").val("");
			$("#amount").val("");

		});
		
		
		//naver 결제창
		$("#after-bt").on('click',function() {
				//클릭이벤트들을 초기화 안해주면 좌석때 사용했던 모달들이랑 겹쳐져서 초기화
				$(".modal_close").attr('onclick',"").unbind('click');
				$("#amount").val(payMoney);
				//결제창 열기
			    var naverpop = window.open(
									"https://nsp.pay.naver.com/payments/developer?"
									+ "clientId=u86j4ripEt8LRfPGzQ8"
									+ "&productName=HNMKCinema&totalPayAmount="
									+ payMoney //결제금액
									+ "&isOnAuthorize=true",
									'네이버팝업',
									'width=900px,height=900px,top=50px,left=450px,scrollbars=yes');
						
						//결제창이 닫혔을때 실행되는 코드
					interval = window.setInterval(function(){	
						if (naverpop == null || naverpop.closed) {
							window.clearInterval(interval);
									//결제창 닫은후 모달창
									action_popup.alert("예매가 완료되었습니다.");
									$(".modal_close").on("click", function() {
										action_popup.close(this);
										$("#form").submit();
									});
									
																
						}
					} ,  500);	
			});
		
	});// jquery end
	
		
	
	
	//모달창 jsop 타입
	var action_popup = {
		timer : 500,
		alert : function(txt) {
			this.open("type-alert", txt);
		},
		open : function(type, txt, txt2) {
			var popup = $("." + type);
			popup.find(".menu_msg").text(txt);
			popup.find(".top_msg").text(txt2);
			$("body").append("<div class='dimLayer'></div>");
			$(".dimLayer").css('height', $(document).height()).attr("target",
					type);
			popup.fadeIn(this.timer);
		},
		close : function(target) {
			var modal = $(target).closest(".modal-section");
			var dimLayer;
			if (modal.hasClass("type-alert")) {
				dimLayer = $(".dimLayer[target=type-alert]");
			}
			modal.fadeOut(this.timer);
			setTimeout(function() {
				dimLayer != null ? dimLayer.remove() : "";
			}, this.timer);
		}
	}
</script>
</head>
<body>
 <main>
	<form action="pay" method="post" id="form">
	
	<input type="hidden" name="sname" value="${sname}" />
	<input type="hidden" name="seatno1" id="seatno1" value="" />
	<input type="hidden" name="seatno2" id="seatno2" value="" />
	<input type="hidden" name="seatno3" id="seatno3" value="" />
	<input type="hidden" name="seatno4" id="seatno4" value="" />
	<input type="hidden" name="amount" id="amount" value="" />
	<input type="hidden" name="ssno"  value="${schdto.ssno}" />
	
	

	<div id=container>
		<div id=container-left>
			<div id=left-title>
				<h2>빠른예매</h2>
			</div>
			<div id=seat-section>
				<div id=seat-title>
					<h3>관람인원선택</h3>
				</div>
				<div id=seat-area>
					<div id="seat-count">
						<div id="seat-count-desc">
							<span class="seat-age">성인</span>
							<button type="button" class="bt-down" id="bt-down-1"
								onclick="count('minus')">-</button>
							<button type="button" class="bt-now" id="bt-now-1">0</button>
							<button type="button" class="bt-up" id="bt-up-1"
								onclick="count('plus')">+</button>
							<span class="seat-age">청소년</span>
							<button type="button" class="bt-down" id="bt-down-2"
								onclick="count2('minus')">-</button>
							<button type="button" class="bt-now" id="bt-now-2">0</button>
							<button type="button" class="bt-up" id="bt-up-2"
								onclick="count2('plus')">+</button>
							<button type="button" id="corona">-</button>
							<span id="corona-desc">사회적 거리두기로 인해 좌석간 거리두기가 실행중입니다.</span>
						</div>
					</div>

					<div id=seat-layout>
						<img id=seat-img src="resources/images/screen.png" alt="" />
						<div id=seat-screen>
							<c:forEach var="seat" items="${seatScreen}">
								<button type="button" class="avail${seat.avail}" id="${seat.seatno}"
									value="${seat.seatno}">${seat.seatno}</button>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id=container-right>
			<div id="title-area">
				<p id="movie-title"><img id="filmgrade" src="resources/images/${mdidto.filmgrade}2.png" alt="" />${movieOne.mtitle}</p>
			</div>
			<div id="desc-area">
				<p class="desc-p">${theaterOne.location}</p>
				<p class="desc-p">${schdto.sname}관</p>
				<p class="desc-p">${schdto.ssdate}</p>
				<span class="desc-span">${schdto.starttime}~</span><span
					class="desc-span">${schdto.endtime}</span> <img
					src="${movieOne.poster}" alt="${movieOne.mtitle}" id="movie-poster" />
			</div>
			<div id="choise-area">
				<div id="seat-desc">
					<p>
						<img class="seat-img" src="resources/images/seat4.png" alt="" /><span
							class="choise-span">선택</span>
					</p>
					<p>
						<img class="seat-img" src="resources/images/seat1.png" alt="" /><span
							class="choise-span">예매완료</span>
					</p>
					<p>
						<img class="seat-img" src="resources/images/seat2.png" alt="" /><span
							class="choise-span">띄어앉기석</span>
					</p>
					<p>
						<img class="seat-img" src="resources/images/seat3.png" alt="" /><span
							class="choise-span">일반</span>
					</p>
				</div>
				<div id="seat-choise">
					<p>선택좌석</p>
					<p class="select" id="seat-select">.</p>
					<p class="select" id="seat-select2">.</p>
					<p class="select" id="seat-select3">.</p>
					<p class="select" id="seat-select4">.</p>



				</div>
			</div>
			<div id="pay-area">
				<div id="pay">
					<span>최종결제금액</span><span id="money">0</span><span>원</span>
				</div>
				<div id="page">
					<div id="before">
						<a href="reserve" id="before-bt">이전</a>
					</div>
					<div id="after">
						<a href="#" id="after-bt">결제</a>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- alert 모달을 쓸 페이지에 추가 start-->
	<section class="modal modal-section type-alert">
		<div class="enroll_top">
			<p class="top_msg">알림</p>
		</div>
		<div class="enroll_box">
			<p class="menu_msg"></p>
		</div>
		<div class="enroll_btn">
			<button type="button" class="btn navy_btn modal_close">확인</button>
		</div>
	</section>
	<!-- alert 모달을 쓸 페이지에 추가 end-->
	</form>
  </main>	
  <%@ include file="/views/footer.jsp" %>
</body>
</html>