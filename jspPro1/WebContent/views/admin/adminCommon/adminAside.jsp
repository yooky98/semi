<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/adminAside.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<title>admin aside</title>
</head>
<body>
	<aside class="col-lg-3 col-md-3 col-sm-3 col-3 col-xl-3" id="adminAside">
		<div>
			<br>
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title" id="adminAsideTitle">관리자페이지</h3>
				</div>
					<br> <br>
					<ul class="list-group">
						<li class="list-group-item"><a href="<%=request.getContextPath()%>/prodList.ad">제품 관리</a></li>
						<li class="list-group-item"><a href="<%=request.getContextPath()%>/orderList.ad">주문내역 관리</a></li>
						<li class="list-group-item"><a href="<%=request.getContextPath()%>/answerList.ad">1:1 문의 답변</a></li>						
					</ul>
			</div>

		</div>
	</aside>
</body>
</html>