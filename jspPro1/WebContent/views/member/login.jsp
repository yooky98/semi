<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/user.css" rel="stylesheet">
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
<body class = tbody>
<%@ include file="../common/menubar.jsp"%>
	<div class = "userbox">
	<span class="usertitle">로그인</span>
	<form method="post" action="<%=request.getContextPath() %>/user?command=login">
	
	<table class = "usertable">
	<tr><td><input type = "text" class = "userform" name = "user_id" maxlength="20" placeholder="아이디"></td></tr>  
	
	<tr><td><input type = "password" class = "userform" name = "user_pw" placeholder="비밀번호"></td> </tr>
					
		</table>
		
		<input type = "submit" value = "LOGIN" class = "userbtn">
	</form>
	<a href="<%=request.getContextPath() %>/user?command=userUpdate&user_id=abc">내 정보</a>
	</div>
</body>
</html>