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


<!-- icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >


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

			<nav class="nav-menu d-lg-block collapse" id="nav-menu">
				<ul class="nav">
					<li class="active"><a href="<%=contextPath%>/index.jsp">Home</a></li>
					<li><a href="<%=contextPath%>/list.pr">shop</a></li>
					<li><a href="<%=contextPath%>/list.cam">compaign</a></li>
					<li><a href="#">brand</a></li>
					<li><a href="<%=request.getContextPath() %>/faqList">faq</a></li>
					<li><a href="<%=contextPath%>/views/mypage/myPageMain.jsp">mypage</a></li>
					<li><a href="<%=request.getContextPath() %>/prodList.ad">adminpage</a></li>
					<li><a href="<%=request.getContextPath() %>/list.cart">cart</a></li>
				</ul>
			</nav>

			<div class="dropdown nav-menu ">
				<ul>
					<% if(loginUser == null) {%>
				
					<li><a href="<%=contextPath%>/views/member/login.jsp">login</a></li>
					<li><a href="<%=contextPath%>/views/member/join.jsp">sign up</a></li>
					
					<%}else if(loginUser.getUser_id().equals("admin")){ %>
					
					<li><a href="#"><%=loginUser.getUser_id() %></a></li>
					<li><a href="<%=request.getContextPath() %>/prodList.ad">adminpage</a></li>
					<li><a href="<%=request.getContextPath() %>/user?command=logout">logout</a></li>
					
					<%}else{ %>
					
					<li><a class="dropdown-toggle" data-toggle="dropdown" ><%=loginUser.getUser_id() %></a>
					<div class="dropdown-menu">
      					<a class="dropdown-item" href="<%=contextPath%>/views/member/userUpdate.jsp">회원정보 수정</a>
      					<a class="dropdown-item" href="<%=contextPath%>/views/member/userDelete.jsp">회원 탈퇴</a>
     					<a class="dropdown-item" href="<%=request.getContextPath() %>/user?command=logout">로그아웃</a>
    				</div>
					</li>

					<li><a href="<%=contextPath%>/views/mypage/myPageMain.jsp">mypage</a></li>
					<li><a href="<%=request.getContextPath() %>/list.cart">cart</a></li>
					<li><a href="<%=request.getContextPath() %>/user?command=logout">logout</a></li>
					
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
				<li><a href="<%=contextPath%>/list.cam">compaign</a></li>
				<li><a href="#">brand</a></li>
				<li><a href="<%=request.getContextPath() %>/faqList">faq</a></li>
			</ul>
		</nav>

	</header>

</body>
</html>