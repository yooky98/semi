<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giftree</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- counter -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/counterup.min.js"></script> 

<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

</head>
<body>
	<%@ include file="views/common/menubar.jsp"%>
	<%-- <%@ include file="/views/admin/adminNotice/noticeView.jsp"%>--%>
	

	<section id="hero" class="d-flex align-items-center">
	
		<div class="container d-flex flex-column align-items-center">
			<h1>Giftree</h1>
			<h2>나에게 주는, 지구에게 주는 선물</h2>
			<p>기프트리는 여러분이 입양한 나무 수 만큼 숲에 나무를 심습니다.</p>
			
			<div class="row counters countMain">

				<div class="card countContent col-6 text-center">
					<p>조성한 숲</p><span class="counter" id="fNum" data-toggle="counter-up"></span>
				</div>

				<div class="card countContent col-6 text-center ">
					<p>심은 나무 수</p><span class="counter" id="tNum" data-toggle="counter-up"></span>
				</div>

			</div>
			
			<a href="<%=contextPath%>/list.pr" class="btn-about">반려나무 입양하러 가기</a>
		</div>
		
	</section>

	<%@ include file="views/common/footer.jsp"%>

<script type="text/javascript"></script>

<script>
$(function(){
	  
    $.ajax({
    	
    	url:"forest.ma",
    	type: "get",
    	success: function(result){
    			
			$('#fNum').html(result[0]);
			$('#tNum').html(result[1]);
				
			$('[data-toggle="counter-up"]').counterUp({
				delay: 10,
				time: 1000
			});
				
		},
		error: function(e){
			console.log(e);
		}
    })
    
})

</script>
	
</body>
</html>