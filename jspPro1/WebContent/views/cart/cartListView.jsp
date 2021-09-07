<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.cart.model.vo.Cart , com.kh.product.model.vo.Product"%>
<%@ page import = "com.kh.product.model.dao.ProductDao" %>
<%  ArrayList<Cart> list = (ArrayList)request.getAttribute("list"); %>
<% String message = (String)request.getAttribute("message"); %>
<% ArrayList<Product> plist = (ArrayList<Product>)request.getAttribute("list");%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
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
<style>
	body{
		background-color: rgb(239, 240, 227);	
	}
</style>
<body>

<%@ include file="/views/common/menubar.jsp" %>
<br><br><br><br><br>

    <form class = "cartForm" action="">
        <div class="cartList">
            <table class="table table-hovar">
			<thead> 
					<tr>
						<th><input type="checkbox">cart</th>
						<th>상품정보</th>
						<th>수량</th>
                        <th>숲</th>
						<th>배송비</th>
						<th>가격</th>
					</tr>
			</thead>
			<tbody>
			<%if(list.isEmpty()){%>
				<div calss = "emptyList">
				<h2>장바구니가 비어있습니다.</h2>
				</div>

			<%}else{%>
				<% for(Cart c : list){ %>
                    <tr>
                     	<td></td>
                        <td><%=c.getProdNo()%></td>
                      	<td>
       					<span>
       					<img src="<%=request.getContextPath()%>/resources/images/plus.png" width=12 height = 12>	
       					</span>
                      	<%=c.getCartAmount()%>
                      	<span>
       					<img src="<%=request.getContextPath()%>/resources/images/minus.png" width=12 height = 12>	
       					</span>
                      	</td>
                        <td><%=c.getForestName()%></td>
                        <td>2500</td>
                        <td>
                        <button type="button" class="btn btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                	<%}%>
				 <%}%>
             </tbody>
            </table>
        </div>
    </form>
</body>
</html>

