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
  

    section{
    /*background:skyblue;*/
    text-align:center;
    margin-left: 15%;
   
    
    }
    
    .mainSection{
    	padding-top: 100px;
    	padding-left: 20px;
    	padding-right: 20px;
    	
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

	<div class="container-fluid">

		<div class="row mainSection">
			<%@ include file="../common/mypageAside.jsp" %>
	
			<section class="col-sm-10">
				<div class="card col-sm-4 maypageCard">
					<b>후원한 나무</b>
					<div class="tree">10 그루</div>
				</div>
				<div class="card col-sm-4 maypageCard">
					<b>보유 포인트</b>
					<div class="point"><%=loginUser.getPoint() %>p</div>
				</div>
			</section>
		</div>
	</div>


</body>
</html>