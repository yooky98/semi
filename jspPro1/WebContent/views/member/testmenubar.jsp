<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.kh.member.model.vo.UserVO" %>
    <%

    	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
    	
		String msg = (String)session.getAttribute("msg");
    

    	String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<!-- icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
       

<style>
	header a:hover {
	  text-decoration: none;
	}
</style>

<script>
	$(function(){
		var msg = "<%=msg %>";
		if(msg != "null"){
			alert(msg);
			<%session.removeAttribute("msg");%>
		}
	})
</script>

</head>
<body>

	<header id="header" class="fixed-top">

		<div class="container-fluid d-flex justify-content-between align-items-center">

			<h1 class="logo"><a href="<%=contextPath%>/index.jsp">Giftree</a></h1>
			
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<nav class="nav-menu d-lg-block collapse" id="nav-menu">
				<ul class="nav">
					<li class="active"><a href="<%=contextPath%>/index.jsp">Home</a></li>
					<li><a href="<%=contextPath%>/list.pr">shop</a></li>
					<li><a href="<%=contextPath%>/views/campaign/campaignListView.jsp">compaign</a></li>
					<li><a href="#">brand</a></li>
					<li><a href="<%=request.getContextPath() %>/faqList">faq</a></li>
					<li><a href="<%=contextPath%>/views/mypage/myPageMain.jsp">mypage</a></li>
					<li><a href="<%=request.getContextPath() %>/prodList.ad">adminpage</a></li>
					<li><a href="<%=request.getContextPath() %>/views/cart/cartListView.jsp">cart</a></li>
				</ul>
			</nav>

			<div class="nav-menu">
				<ul>
					<% if(loginUser == null) {%>
				
					<li><a href="<%=contextPath%>/views/member/login.jsp">login</a></li>
					<li><a href="<%=contextPath%>/views/member/join.jsp">sign up</a></li>
					
				<%--	<%}else if(loginUser.getUser_id().equals("admin")){ %>
					
					<li><a href="#"><%=loginUser.getUser_name() %></a></li>
					<li><a href="#">adminpage</a></li>
					 --%>
					<%}else{ %>
					
					<li><a href="#"><%=loginUser.getUser_name() %></a></li>
					<li><a href="<%=contextPath%>/views/mypage/myPageMain.jsp">mypage</a></li>
					<li><a href="#">cart</a></li>
					<li><a href="<%=request.getContextPath() %>/user?command=logout">logout</a></li>
					<li><a href="<%=request.getContextPath() %>/views/member/userUpdate.jsp">회원정보</a></li>
					
					<%} %>
				</ul>
			</div>

			
			 <button type="button" class="navbar-toggle d-lg-none" data-toggle="collapse" data-target="#navbar-menu-2">
                <i class="fas fa-bars"></i>
              </button>

		</div>

		<nav class="nav-menu d-lg-none collapse" id="navbar-menu-2">
			<ul class="nav">
				<li class="active"><a href="<%=contextPath%>/index.jsp">Home</a></li>
				<li><a href="<%=contextPath%>/list.pr">shop</a></li>
				<li><a href="#">compaign</a></li>
				<li><a href="#">brand</a></li>
				<li><a href="#">faq</a></li>
			</ul>
		</nav>

	</header>

</body>
</html>