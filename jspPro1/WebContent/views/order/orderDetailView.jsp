<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body{
           text-align: center;
       }
 .btn{
        display: block;
        text-align: center;
         margin: auto;
      }
.orderForm{
       margin: auto;
      text-align: center;
       display: block;
        }
.body{
        background-color: rgb(239, 240, 227);
}
 #od{
         background-color: white;
         display: inline-block;
         width: 900px;
         height: 300px;
 }
</style>
</head>
 <link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
  <!-- Latest compiled and minified CSS --> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  <!--스타일 cdn?-->
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!--jQuery연결하는 CDN-->
  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<body>

	<%@ include file="/views/common/menubar.jsp"%>
		<br><br><br><br><br><br><br><br><br>
    <div class="body">
        <div class="body-inner">
        <form action="" style="" id="orderForm">
            <div id="od">
          	<h1>주문이 정상적으로 완료되었습니다</h1>
          	<h3><%=loginUser.getUser_name() %>님 Giftree를 방문해주셔서 감사합니다.</h3>	
            </div>
        </form>
        </div>
        <br>
        <button class="btn" onclick="mypage()">확인</button>
    </div>
</body>
<script type="text/javascript">
	function mypage(){
		location.href="<%=request.getContextPath()%>/forestList.my";
		
	}

</script>
</html>