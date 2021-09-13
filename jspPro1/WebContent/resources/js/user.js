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
 $('#user_pw').keyup(function(){		
	var regEx = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	 if(false === regEx.test($('#user_pw').val())){		
		$('#pwCheck').html("<span style = 'color:green;'> 비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다</span>");			
	
	}else if($('#user_pw').val() != $('#user_pwCheck').val()){
          $('#pwCheck').html("<span style = 'color:red;'> 비밀번호가 일치하지 않습니다</span>");
        
        } else{
         $('#pwCheck').html("<span style = 'color:blue;'> 사용가능한 비밀번호 입니다</span>");
       
		}
	});
	
    $('#user_pwCheck').keyup(function(){
	var regEx = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	 if(false === regEx.test($('#user_pw').val())){
		$('#pwCheck').html("<span style = 'color:green;'> 비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다</span>");	
       }else if($('#user_pw').val() != $('#user_pwCheck').val()){	
          $('#pwCheck').html("<span style = 'color:red;'> 비밀번호가 일치하지 않습니다</span>");       
        } else{
          $('#pwCheck').html("<span style = 'color:blue;'> 사용가능한 비밀번호 입니다</span>");
       
        }
    });

});	



