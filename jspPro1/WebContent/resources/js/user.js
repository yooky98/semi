$(document).ready(function() {

$('#user_id').keyup(function(){
        var user_id = $('#user_id').val();
        $.ajax({
            url:"http://localhost:9090/Giftree/user?command=idCheck", 
            type:'post', 
            data:{"user_id":user_id},
			dataType:"text",
			
  	          success:function(data){
			$('#checkId').html(data);
				
            },
            error:function(){
                alert("에러입니다");
            }
        });
	});
});
$(function(){    

    $('#user_pwCheck').keyup(function(){
        if($('#user_pw').val() != $('#user_pwCheck').val()){
          $('#pwCheck').html('비밀번호 일치하지 않습니다');
          $('#pwCheck').attr('color', 'red');
        } else{
          $('#pwCheck').html('비밀번호 일치합니다');
          $('#pwCheck').attr('color', 'blue');
        }
    });
});	



