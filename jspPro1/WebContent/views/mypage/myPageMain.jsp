<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYPAGE</title>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

 <!-- Latest compiled and minified CSS -->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
       <!-- jQuery library -->
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       <!-- Popper JS -->
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
       <!-- Latest compiled JavaScript -->
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    aside{
        background: rgb(239, 240, 227);
    }

    section{
    /* background:skyblue; */
    text-align:center;
    
    }
    
    .mainSection{
    	padding-top: 90px;
    	padding-bottom: 90px;
    	padding-left: 20px;
    	padding-right: 20px;
    	
    }
    
    .card{
        display: inline-block;
    }

</style>

</head>
<body>

<%@ include file="../common/menubar.jsp" %>

	<div class="container-fluid">

		<div class="row mainSection">
			<aside class="col-sm-2">
				<ul>
					<li><a href="<%=request.getContextPath()%>/views/mypage/myPageMain.jsp">내 정보</a></li>
					<li><a href="#">주문내역 조회</a></li>
					<li><a href="#">위시 리스트</a></li>
					<li><a href="<%=request.getContextPath()%>/views/mypage/review/review.jsp">리뷰 관리</a></li>
					<li><a href="<%=request.getContextPath()%>/list.que">1:1 문의</a></li>
					<li><a href="<%=request.getContextPath()%>/mypage.cam">참여 캠페인</a></li>
				</ul>
			</aside>

			<section class="col-sm-10">
				<div class="card col-sm-4 maypageCard">
					후원한 나무
					<div class="tree">10 그루</div>
				</div>
				<div class="card col-sm-4 maypageCard">
					보유 포인트
					<div class="point">100</div>
				</div>
			</section>
		</div>
	</div>


</body>
</html>