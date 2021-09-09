<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.cart.model.vo.Cart , com.kh.product.model.vo.Product"%>
<%@ page import="com.kh.product.model.dao.ProductDao"%>
<%@ page import="com.kh.cart.model.dao.CartDao"%>
<%
	String message = (String) request.getAttribute("message");
%>
<%
	ArrayList<Cart> list = (ArrayList) request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
body {
	background-color: rgb(239, 240, 227);
}

.pAmount {
	width: 40px;
	text-align: center;
}

.upimg {
	width: 15px;
	height: 15px;
}

.downimg {
	width: 15px;
	height: 15px;
}

.totalContainer{
    float: center;
    text-align: right;
    margin-right : 15%;
 }
.form-block-inner-div{
      display: block;
}
.form-block-inner-div-btn{
	 text-align: center;
	 
}
.prodOrder{
	text-align: center;
}

</style>
<body>

	<%@ include file="/views/common/menubar.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>

	<form class="cart-outerForm" action="">
		<div class="cartList">
			<table class="table table-hovar">
				<thead>
					<tr>
						<th><input type="checkbox" id="checkAll" onclick="CheckAll()" />cart</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>숲</th>
						<th>배송비</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (list.isEmpty()) {
					%>
					<div calss="emptyList">
						<h2>장바구니가 비어있습니다.</h2>
					</div>

					<%
						} else {
					%>
					<form class="cartTable" id="inner-form" method="post">
						<%
							for (Cart c : list) {
						%>
						<tr>
							<td><input type="checkbox" name="selectCheck"
								value="<%=c.getCartNo()%>"></td>
							<td><%=c.getProdName()%></td>
							<td><span> <img
									src="<%=request.getContextPath()%>/resources/images/plus.png"
									class="upimg" onclick="upBtn()">
							</span> <input type="text" class="pAmount"
								value="<%=c.getCartAmount()%>" readonly /> <span> <img
									src="<%=request.getContextPath()%>/resources/images/minus.png"
									class="downimg" onclick="downBtn()">
							</span></td>
							<td><%=c.getForestName()%></td>
							<td>2500</td>
							<td><input type="hidden" name="prodPrice"
								value="<%=c.getProdPrice()%>"> <%=c.getProdPrice()%></td>
							<td>
								<button type="button"
									onclick="location.href='<%=contextPath%>/del.cart?cartNo=<%=c.getCartNo()%>'">삭제</button>
							</td>
						</tr>
					</form>
					<%}%>
					<%}%>
				</tbody>
			</table>
				<div class="totalContainer">
			<hr>
			<form class="form-block">
				<div class="form-block-inner-div">
					<label class="mb-2 mr-sm-2">상품가격</label> <input type="text" class="prodOrder" value=0 readonly>
				</div>
				<div class="form-block-inner-div">
					<label class="mb-2 mr-sm-2">배송비</label> <input type="text" class="prodOrder" value=2500 readonly>
				</div>
				<hr>
				<div class="form-block-inner-div">
					<label class="mb-2 mr-sm-2">결제금액</label> <input type="text" class="prodOrder" value=0 readonly>
				</div>
				<div class="form-block-inner-div-btn">
					<button type="submit" class="btn btn-primary mb-2">쇼핑계속하기</button>
					<button type="submit" class="btn btn-primary mb-2">주문하기</button>
				</div>
			</form>
		</div>
	</div>
	</form>
	<script>
		//상품 전체리스트 선택,해제
		var check = false;
		function CheckAll() {
			var chk = document.getElementsByName("selectCheck");
			if (check == false) {
				check = true;
				for (var i = 0; i < chk.length; i++) {
					chk[i].checked = true;
				}
			} else {
				check = false;
				for (var i = 0; i < chk.length; i++) {
					chk[i].checked = false;
				}
			}
		}
		
		//total값 출력
		
	</script>
</body>
</html>

