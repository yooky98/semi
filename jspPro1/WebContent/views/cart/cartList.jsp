<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


</head>
<body>
<%@ include file="../common/menubar.jsp" %>

<div class="container">
    <table class="carttTble" >
        <thead>
          <tr>
            <th scope="col"><input type="checkbox">CART</th>
            <th scope="col">상품정보</th>
            <th scope="col">수 량</th>
            <th scope="col">상품금액</th>
            <th scope="col">배송비</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input type="checkbox">img</td>
            <td>행복을 주는 청페페</td>
            <td>1</td>
            <td>3000</td>
            <td>2500</td>
          </tr>
          <tr>
            <td><input type="checkbox">img</td>
            <td>공기청정기 ,아디안텀</td>
            <td>3</td>
            <td>2000</td>
            <td>2500</td>
          </tr>
  
        </tbody>
      </table>
    </div>
</div>
</body>
</html>