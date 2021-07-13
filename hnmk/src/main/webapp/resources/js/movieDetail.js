/**
 * 
 */

  $( function() {
    $( "#tabs" ).tabs();
  } );
  

$(function() {
	$("#tabs").tabs();

	/*코멘트 작성버튼 클릭시 confirm창으로 로그인구분*/ 
	var c = '<c:out value="${id}"/>'; /*현재 로그인되어있는 회원*/
	var m = '<c:out value="${mno}"/>'; /*현재 영화상세페이지에있는 영화번호*/
	var im = '<c:out value="${idmno}"/>'; /*현재 로그인되어있는 회원이 예매한 영화번호*/
	$("#btn").click(function() {
		if (c == "") {
			var result = confirm("   로그인이 필요한 서비스입니다.\n   로그인하러 가시겠습니까?");
			if (result) {
				window.location.href = "loginForm.do";
			} else {
				window.location.href = "detail?mno=" + m;
			}
		}
		else if (m == im) { /*현재 디테일페이지에 있는 영화와 로그인되어있는 회원이 예매한 영화가 같은지(무조건 예매만했다고 작성할수있는게아니고 관람한 영화이여야하기때문에)*/
			
			if ($("#gr").val() > 10) { /*평점이10점 초과이면*/
				alert("평점은 10점까지 가능합니다.");
				window.location.href = "detail?mno=" + m; /*다시 영화상세페이지 m=영화번호*/
			}else if($("#gr").val() == ""){ /*평점이 공백이면*/
				alert("평점이 비어있습니다.") 
				window.location.href = "detail?mno=" + m;
			} 
			else if($("#review").val()==""){ /*감상평이 공백이면*/
				alert("감상평이 비어있습니다.") 
				window.location.href = "detail?mno=" + m;
			}else{
				$("#form").submit();
			}
				
		} else { /*현재 디테일페이지에 있는 영화와 로그인되어있는 회원이 예매한 영화와 같지않는경우*/
			alert("관람평은 관람 이후 작성 가능합니다.");
			window.location.href = "detail?mno=" + m;
		}
	});

});