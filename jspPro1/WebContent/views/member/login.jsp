<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="<%=request.getContextPath() %>/resources/css/user.css" rel="stylesheet">
</head>
<body class = tbody>
	<span class="usertitle">로그인</span>
	<div class = "userbox">
	<form method="post" action="<%=request.getContextPath() %>/user?command=login">
	
	<table class = "usertable">
	<tr><td><input type = "text" class = "userform" name = "user_id" maxlength="20" placeholder="아이디"></td></tr>  
	<tr><td><input type = "password" class = "userform" name = "user_pw" placeholder="비밀번호"></td> </tr>
					
		</table>
		<input type = "submit" value = "LOGIN" class = "btn">
	</form>
	
	</div>
</body>
</html>