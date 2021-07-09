$(document).on('click', '#btn_delete', function(e) {
		if(confirm("정말 삭제하시겠습니까 ?") == true){
			$("#viewForm").attr("action", "inquiryDelete.do");
			$("#viewForm").submit();
	    }
	    else{
	        return ;
	    }
	});