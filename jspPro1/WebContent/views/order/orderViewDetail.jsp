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
  <!-- Latest compiled and minified CSS --> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  <!--스타일 cdn?-->
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!--jQuery연결하는 CDN-->
  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<body>
    <div class="body">
        <div class="body-inner">
        <form action="" style="" id="orderForm">
            <h1>주문이 정상적으로 완료되었습니다</h1>
            <div id="od">
      
            <span>주문번호 : </span><input type="text" value="주문번호"><br>
            <span>구매자명 : </span><input type="text" value="이름"><br>
            <span>주문상품 : </span><input type="text" value="제품명"><br>
            <hr>
            <span>결제 금액 : </span><input type="text" value="금액">
            </div>
        </form>
        </div>
        <br>
        <button class="btn">확인</button>
    </div>
</body>
</html>