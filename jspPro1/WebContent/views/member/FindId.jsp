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
	<span class="usertitle">아이디 찾기</span>
	<form method="post" action="<%=request.getContextPath() %>/user?command=FindId"> 
	
	<table class = "usertable">
	<tr><td><input type = "text" class = "userform" name = "user_name" maxlength="10" placeholder="이름"></td></tr>  
	
	<tr><td><input type = "text" class = "userform" name = "Email" placeholder="이메일"></td> </tr>
					
		</table>
		
		<input type = "submit" value = "아이디 찾기" class = "userbtn">
	</form>
	
	</div>
</body>
</html>