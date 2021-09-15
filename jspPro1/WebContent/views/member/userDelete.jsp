<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
	<span class="usertitle">회원탈퇴</span>
	<form method="post" action="<%=request.getContextPath() %>/user?command=userDelete">
	
	<table class = "usertable">
	<tr><td><input type = "text" class = "userform" maxlength="20" value=<%=loginUser.getUser_id()%> disabled></td></tr>  
	<tr><td><input type="hidden" name="user_id" value=<%=loginUser.getUser_id()%>></td></tr>
	<tr><td><input type = "password" class = "userform" name = "user_pw" placeholder="비밀번호"></td> </tr>					
		</table>		
		<input type = "submit"  value = "탈퇴하기" class = "userbtn" onclick = "return confirm('정말 탈퇴 하시겠습니까?')" >		
	</form>
	</div>
</body>
</html>