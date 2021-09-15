<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html id="htmlAt">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/adminAside.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>admin aside</title>
</head>
<body id="bodyAt">
	<aside class="col-xl-2 col-lg-2" id="adminAside">
		<nav class="navbar navbar-expand-lg p-0">
			<br>
			<div class="collapse navbar-collapse" id="adminToggleBar">
				<ul class="list-group">
					<li class="list-group-item"><a href="<%=request.getContextPath()%>/prodList.ad">제품 관리</a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath()%>/orderList.ad">주문내역 관리</a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath()%>/answerList.ad">1:1 문의 답변</a></li>
				</ul>
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#adminToggleBar">
                <h4><i class="fa fa-sort-desc" aria-hidden="true"></i></h4>
            </button>                      
		</nav>
	</aside>
</body>
</html>