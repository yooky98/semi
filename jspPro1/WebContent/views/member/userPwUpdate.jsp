<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.member.model.vo.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
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
<%	UserVO loginUser = (UserVO)session.getAttribute("loginUser"); %>
	<div class = "userbox" style="margin:auto;text-align:center;padding-top:50px;" >
	<b>정보 보호를 위해 비밀번호를 입력해주세요 </b>
	<form method="post" action="<%=request.getContextPath() %>/user?command=userPwUpdate">
	
	<table class = "usertable">
	<tr><td><input class="userform" type = "text" maxlength="20" placeholder="아이디" value ="<%=loginUser.getUser_id() %>" disabled >
	<input type="hidden" name="user_id" value ="<%=loginUser.getUser_id() %>">
	<tr><td><input type = "password" class = "userform" name = "user_pw" placeholder="비밀번호"></td> </tr>					
		</table>		
		<input type = "submit" value = "확인" class = "userbtn">
	</form>
		
	
	<br>
	
	</div>
</body>
</html>