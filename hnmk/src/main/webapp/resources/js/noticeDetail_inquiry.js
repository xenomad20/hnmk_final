function pass(obj){
	console.log(obj.form[0].value);
	console.log(obj.form[1].value);
	console.log(obj.form[2].value);
	$.ajax({
		url: "passChk.do",
		type : "GET",
		dataType : "JSON",
		data : { "fpwd" : obj.form[0].value,"fno" : obj.form[1].value},
		success : function(data){
			if(data==1){
				console.log("dddd");
				location.href = "noticeDetail_inquiry.do?fno="+obj.form[1].value;
			}else if(obj.form[2].value=="jadmin"){
				location.href = "noticeDetail_inquiry.do?fno="+obj.form[1].value;
			}else{

				alert("비밀번호가 틀렸습니다!!");
				return;
			}
		}
	})
	
}