<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMINPAGE</title>
<style>
	#adminWorkArea {
		height: 800px;
	}
	
	#adminPageTitle {
		text-align: center;
	}
	
	aside {
		padding-top: 100px;
		background-color: yellowgreen;
	}
	
	section {
		background-color: skyblue;
	}
	
	#adminWorkArea>aside>div>div>ul>li {
		background-color: yellowgreen;
		text-align: left;
		padding-left: 50px;
		border: 0;
		outline: 0;
}
</style>
</head>
<body>
	<div class="row" id="adminWorkArea">
		<aside class="col-lg-3 col-md-3 col-sm-3 col-3 col-xl-3">
			<div>
				<br>
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title" id="adminPageTitle">관리자페이지</h3>
					</div>
					<br> <br>
					<ul class="list-group">
						<li class="list-group-item"><a href="#">제품 관리</a></li>
						<li class="list-group-item"><a href="#">1:1 문의 답변</a></li>
						<li class="list-group-item"><a href="#">주문내역 관리</a></li>
					</ul>
				</div>

			</div>
		</aside>
		<section class="col-lg-9 col-md-9 col-sm-9 col-9 col-xl-9">
			<div></div>
		</section>
	</div>
</body>
</html>