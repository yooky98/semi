<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.kh.member.model.vo.Member" %>
    <%
    	Member loginUser = (Member)session.getAttribute("loginUser");
    
    	String msg = (String)session.getAttribute("msg");
    			
    	String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

<!-- icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
       
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	header a:hover {
	  text-decoration: none;
	}
</style>

</head>
<body>

<!--  
	<div class= "loginArea">
		<% if(loginUser == null){ %>
			<div class ="btns" align="center">
				
				<button id = "loginBtn" type="submit">로그인</button>
			    <button id = "enrollBtn" type="button" onclick="enrollPage();">회원가입</button>
			</div>
		
		<%}else{ %>
		<div id = "userInfo">
				<b style = "color:white;"><%=loginUser.getUserName() %> 님 </b> 의 방문을 환영합니다.
				<br><br>
				<div class ="btns" align="center">
					<a href = "<%=request.getContextPath() %>/mypage.me">마이페이지</a>
					<a href = "<%=request.getContextPath() %>/logout.me">로그아웃</a>
				</div>
			
			</div>
			<%} %>
	</div> -->

	<header id="header" class="fixed-top">

		<div
			class="container-fluid d-flex justify-content-between align-items-center">

			<h1 class="logo"><a href="index.jsp">Giftree</a></h1>
			
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<nav class="nav-menu d-lg-block collapse" id="nav-menu">
				<ul class="nav">
					<li class="active"><a href="index.jsp">Home</a></li>
					<li><a href="#">shop</a></li>
					<li><a href="#">compaign</a></li>
					<li><a href="#">brand</a></li>
					<li><a href="#">faq</a></li>
				</ul>
			</nav>

			<div class="nav-menu">
				<ul>
					<li><a href="#">login</a></li>
					<li><a href="#">sign up</a></li>
				</ul>
			</div>

			
			 <button type="button" class="navbar-toggle d-lg-none" data-toggle="collapse" data-target="#navbar-menu-2">
                <i class="fas fa-bars"></i>
              </button>

		</div>

		<nav class="nav-menu d-lg-none collapse" id="navbar-menu-2">
			<ul class="nav">
				<li class="active"><a href="index.jsp">Home</a></li>
				<li><a href="#">shop</a></li>
				<li><a href="#">compaign</a></li>
				<li><a href="#">brand</a></li>
				<li><a href="#">faq</a></li>
			</ul>
		</nav>

	</header>

</body>
</html>