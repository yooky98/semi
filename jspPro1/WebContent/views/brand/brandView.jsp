<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
    	
    	padding-top: 30px;
    	padding-bottom: 30px;
    	padding-left: 20px;
    	padding-right: 20px;
    	margin: auto;
    	text-align: center;
    
    }
    
    .banner{
    	background: url("/Giftree/resources/images/brandBanner1.jpg");
  		background-size: cover;
  		color: white;
  		text-align: center;
    	width: 100%;
    	height: 500px;
    	padding-top: 250px;
    	
    	font-size: 30px;
    	font-weight: 600;
    }
    
    
</style>

</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

	
	<div class="banner">Brand Mission</div>
	<div class="container-fluid">

		<div class="mainSection col-sm-10">
			<h4>함께 숲을 만들어갈 수 있도록!</h4>
			<hr>
			<p>
			 많은 사람들이 숲이 중요하다는 것을 알지만<br>
			 개인이 숲을 만들기는 어려운 것이 현실입니다.<br><br>
			 기프트리는 많은 사람들과 함께 숲을 만들어 갈 수 있도록 노력합니다.<br>
			 반려나무를 입양하면 숲에 나무를 심는 방법으로 개인이 숲을 만들수 있도록 하였습니다.<br>
			 또한 캠페인을 통해 직접 나무를 심을 수 있는 자리를 마련하였습니다.<br><br>
			 기프트리와 함께 더 많은 숲을 만들어 주세요.<br>
			 지구에게 그리고 나에게 숲을 선물해 주세요.
			</p>
		</div>

	</div>
	
	<section id="facts" class="facts">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>기프트리 임팩트</h2>
				<p>기프트리는 여러분이 입양한 나무 수 만큼 숲에 나무를 심습니다.</p>
			</div>

			<div class="row counters">

				<div class="col-6 text-center">
					<span class="counter" data-toggle="counter-up">20</span>
					<p>조성한 숲</p>
				</div>

				<div class="col-6 text-center ">
					<span class="counter" data-toggle="counter-up">1251</span>
					<p>심은 나무 수</p>
				</div>

			</div>

		</div>
	</section>
<%@ include file="/views/common/footer.jsp"%>
</body>
</html>