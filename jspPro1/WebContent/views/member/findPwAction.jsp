<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width,initial-scale=1">
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
<body class = "tbody">
<% String findPw=(String)request.getAttribute("findPw");
String  user_id = (String)request.getAttribute("user_id");%>
	<div class = "userbox" style="margin:auto;text-align:center;padding-top:30px;">
	<form method ="post" action ="<%=request.getContextPath() %>/user?command=findPwUpdate">	


 <b>새로운 비밀번호를 입력해주세요</b>
 <br><br>

<input type= "hidden" name= "user_id" value =  "<%=user_id%>"> 
<input type = "password" style="width: 300px;font-size: 15px;" class = "userform" name = "user_pw" maxlength="10" placeholder="새 비밀번호"> <br><br>
<input type = "password" style="width: 300px;font-size: 15px;" class = "userform" name = "user_pwCheck" maxlength="10" placeholder="새 비밀번호 확인"><br><br>

	<input type = "submit" value = "비밀번호 변경" class = "userbtn" style ="width:300px; height:40px">
</form>
	</div>
</body>
</html>