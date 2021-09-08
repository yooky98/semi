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
	<div class = "userbox" style="margin:auto;text-align:center;padding-top:30px;">
	<form method="post" action="<%=request.getContextPath() %>/user?command=findPw"> 
	<input type = "text" style="width: 75%;font-size: 15px;" class = "userform" name = "user_id" maxlength="10" placeholder="아이디"> <br><br>
	<input type = "text" style="width: 75%;font-size: 15px;" class = "userform" name = "user_name" maxlength="20" placeholder="이름"> <br><br>
	<input style="width: 36%;font-size: 15px;" type = "text"  class = "userform" name = "user_no" maxlength="6" placeholder ="주민번호 앞자리" > -
	<input  style="width: 36%;font-size: 15px;" type = "password" class = "userform" name = "user_no1" maxlength="7" placeholder = "주민번호 뒷자리"><br><br>
		<input type = "submit" style="width:75%;"value = "비밀번호 찾기" class = "userbtn">
	</form>
	</div>
</body>
</html>