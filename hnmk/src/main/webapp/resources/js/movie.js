/**
 * 
 */

  $(document).ready(function(){
  /*이미지에 마우스 오버시 id를 가져와 투명도를 올려주어 줄거리를 보여줌*/
      $('.movie-detail').hover(function(){
          var id_check = $(this).attr("id");
          /*console.log(id_check);*/
          $("#"+id_check).fadeTo(300,0.8);
         },function(){  /*마우스가 벗어나면 0.2에 걸쳐 투명도가 0이되며 사용자 측에서 안 보임*/
            $(".movie-detail").fadeTo(200,0);
      });
      $('.btn').on("click",function(){ /*컬러 변경을 통해 사용자가 보고있는 화면이 무엇인지 인지시켜 줌*/
         var btn_id = $(this).attr("id");
         if(btn_id == 'boxoffice'){
         $("#"+btn_id).css({'background-color':'beige','border':'ridge'});
         $("#schedulemovie").css({'background-color':'white','border':'none'});
            }else{
               $("#"+btn_id).css({'background-color':'beige','border':'ridge'});
               $("#boxoffice").css({'background-color':'white','border':'none'});
            }
         
      });
  });
/*tabs를 활용하여 한정된 공간 안에서 다양한 정보 확인 */
  $( function() {
    $( "#tabs" ).tabs();
  } );