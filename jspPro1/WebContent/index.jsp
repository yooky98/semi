<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giftree</title>

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
<body>
	<%@ include file="views/common/menubar.jsp"%>

	<section id="hero" class="d-flex align-items-center">
		<div class="container d-flex flex-column align-items-center"
			data-aos="zoom-in" data-aos-delay="100">
			<h1>Giftree</h1>
			<h2>나에게 주는, 지구에게 주는 선물</h2>
			<a href="<%=contextPath%>/list.pr" class="btn-about">반려나무 입양하러 가기</a>
		</div>
	</section>
	<!-- End Hero -->



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


	<%@ include file="views/common/footer.jsp"%>
</body>
</html>