<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giftree</title>

<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!--스타일 cdn?-->
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--jQuery연결하는 CDN-->
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
body {
	background-color: rgb(239, 240, 227);
	text-align: center;
}

.card {
	height: 300px;
	border-radius: 2em;
	border: 2px solid rgb(158, 164, 107);
}

span {
	font-family: 'Gowun Batang', serif;
	font-weight: bolder;
	font-size: 20px;
}

.fa-envira {
	width: 40px;
	color: rgb(158, 164, 107);
}
/*버튼*/
#home, #orderChk {
	font-family: 'Gowun Batang', serif;
	width: 95px;
	height: 40px;
	color: white;
	background: none;
	background-color: rgb(158, 164, 107);
	border-radius: 4px;
	border: 2px solid rgb(158, 164, 107);
	margin-top: 30px;
	margin-right: 10px;
	font-weight: bold;
}

#home:hover, #orderChk:hover {
	font-family: 'Gowun Batang', serif;
	background-color: rgb(239, 240, 227);
	color: rgb(158, 164, 107);
	border: 2px solid rgb(158, 164, 107);
}

#title {
	font-family: 'Gowun Batang', serif;
	margin-top: 80px;
}

#subTitle {
	font-family: 'Gowun Batang', serif;
	margin-top: 40px;
}
</style>
<body>
	<%@ include file="/views/common/menubar.jsp"%>

	<br><br><br><br><br><br><br><br><br>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<div id="title">
					<h4 class="card-title" id="orderTitle">
						<i class="fab fa-envira"></i>주문이 정상적으로 완료되었습니다.
					</h4>
				</div>
				<div id="subTitle">
					<p class="card-text" id="orderSubTitle">
						<span><%=loginUser.getUser_name()%></span> 님 Giftree를 방문해주셔서감사합니다.</p>
				</div>
			</div>
		</div>
	</div>
	<button type="button" id="home" onclick="homeBtn()">HOME</button>
	<button type="button" id="orderChk" onclick="mypage()">주문확인</button>
</body>
<script type="text/javascript">
        function mypage(){
            location.href="<%=request.getContextPath()%>/forestList.my";
        }
        
        function homeBtn(){
        	 location.href="<%=request.getContextPath()%>/index.jsp";
	}
</script>
</html>