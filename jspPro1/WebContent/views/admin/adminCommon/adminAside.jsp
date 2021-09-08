<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath() %>/resources/css/adminAside.css" rel="stylesheet">
<title>admin aside</title>
</head>
<body>
	<aside class="col-lg-3 col-md-3 col-sm-3 col-3 col-xl-3">
		<div>
			<br>
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title" id="adminPageTitle">관리자페이지</h3>
				</div>
					<br> <br>
					<ul class="list-group">
						<li class="list-group-item"><a href="<%=request.getContextPath()%>/prodList.ad">제품 관리</a></li>
						<li class="list-group-item"><a href="<%=request.getContextPath()%>/answerList.ad">1:1 문의 답변</a></li>
						<li class="list-group-item"><a href="<%=request.getContextPath()%>/orderList.ad">주문내역 관리</a></li>
					</ul>
			</div>

		</div>
	</aside>
</body>
</html>