/**
 * 
 */

  $(document).ready(function(){
      $('.movie-detail').hover(function(){
          var id_check = $(this).attr("id");
          /*console.log(id_check);*/
          $("#"+id_check).fadeTo(300,0.8);
         },function(){
            $(".movie-detail").fadeTo(200,0);
      });
      $('.btn').on("click",function(){
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
   
  $( function() {
    $( "#tabs" ).tabs();
  } );