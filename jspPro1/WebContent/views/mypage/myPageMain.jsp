<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYPAGE</title>


 <!-- Latest compiled and minified CSS -->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
       <!-- jQuery library -->
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       <!-- Popper JS -->
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
       <!-- Latest compiled JavaScript -->
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
       
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<style>
    
    .mainSection{
    	margin: auto;
 		margin-bottom: 20px;
 		padding: 120px 40px 30px 20px;
 		overflow-y: auto;
 		height: 100vh;
 		text-align: center;
    }
    
    .card{
        display: inline-block;
        height: 150px;
        padding: 50px;
    }
 

</style>

</head>
<body>

<%@ include file="../common/menubar.jsp" %>

	<section class="container-fluid">
		
		<div class="row flex-nowrap">	
		<%@ include file="../common/mypageAside.jsp" %>
		
			<div class="mainSection col-sm-9">
				<h3>My Giftree</h3>
				<div class="card col-sm-4 maypageCard">
					<b>후원한 나무</b>
					<div class="tree">10 그루</div>
				</div>
				<div class="card col-sm-4 maypageCard">
					<b>보유 포인트</b>
					<div class="point"><%=loginUser.getPoint() %>p</div>
				</div>
			</div>
		</div>
	</section>
	
<%@ include file="/views/common/footer.jsp"%>
</body>
</html>