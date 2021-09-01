<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
 .mainSection{
    	padding-top: 90px;
    	padding-bottom: 90px;
    	padding-left: 20px;
    	padding-right: 20px;
    	margin: auto;
    
    }
    
</style>

<body>

<%@ include file="/views/common/menubar.jsp" %>


	<div class="container-fluid">

		<div class="mainSection col-sm-10">
			<h3>Campaign</h3>

			<hr>

			<h6>강원 산불 피해 복구 숲 조성 캠패인</h6>
			<hr>

			<div>
			<b>장소 :</b> <span>강원도 강릉시 옥계면 산불피해지</span> <b>일시 :</b> <span>2021-08-19</span>
			</div>
			
			<!-- 가능하면 신청가능한 인원, 정원 표기 해보기 -->
			<hr>
			
			<div>내용</div>
			
			<button onclick="">참여하기</button>
			<!-- 회원만 참여하기 가능 로그인확인-->
			<hr>
			
		</div>

	</div>


</body>
</html>