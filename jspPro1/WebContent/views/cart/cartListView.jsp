<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

 <!-- Latest compiled and minified CSS -->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
       <!-- jQuery library -->
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       <!-- Popper JS -->
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
       <!-- Latest compiled JavaScript -->
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
       
 <style>
        .carttTble { 
                background-color: rgb(239, 240, 227); 
                    width: 100%;
                    height: 100%;
        }
        .container{
                 padding: auto;
        }
        .totalContain{
                 text-align: center;
        }
        .buttonContain{
                 display: flex;
                justify-content: center;   
        }
        .btn_cart{
                 text-align: center;
        }
    </style>
    
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	
	<div class="contain">
    <h2>장바구니<span class="badge badge-pill badge-primary">1</span></h2>
    <p>* 5만원이상 무료배송</p>  
    <table class="carttTble">
        <thead>
          <tr>
            <th scope="col" colspan="2" ><input type="checkbox" id="allCheck" name="allcheck">상품</th>
            <th scope="col">수량</th>
            <th>숲</th>
            <th scope="col">배송비</th>
            <th scope="col">금액</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input type="checkbox">img</td>
            <td>행복을 주는 청페페</td>
            <td><span class="plus">+</span><input type="number"><span class="minus">-</span></td>
            <td>숲이름</td>
            <td>2500</td>
            <td>3000<input type="button" id="btn_delete" value="삭제"></td>
          </tr>
          <tr>
            <td><input type="checkbox">img</td>
            <td>공기청정기 ,아디안텀</td>
            <td><span class="plus">+</span><input type="text"><span class="minus">-</span></td>
            <td>숲이름</td>
            <td>2500</td>
            <td>3000<input type="button" id="btn_delete" value="삭제"></td>
          </tr>
        </tbody>
      </table>
      <div class="totalContain">
        <div><h5>상품가격 :</h5></div>
        <div><h5>배송비 : </h5>5만원이상이면 0원</div>
        <div><h5>결제 금액 : </h5>총가격 나올곳</div>
      </div>
      <div class="buttonContain">
        <div><input type="button" class="btn_cart" id="btn_order" value="주문하기"></div>
        <div><input type="button" class="btn_cart" id="btn_back" value="쇼핑계속하기"></div>
      </div>
    </div>
</div>

</body>
</html>


