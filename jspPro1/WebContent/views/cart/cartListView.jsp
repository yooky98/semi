<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.cart.model.vo.Cart , com.kh.product.model.vo.Product"%>
<%@ page import="com.kh.product.model.dao.ProductDao"%>
<%@ page import="com.kh.cart.model.dao.CartDao"%>
<%
	String message = (String) request.getAttribute("message");
%>
<% ArrayList<Cart> list = (ArrayList) request.getAttribute("list");%>

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
.prodImg{
	width: 100px;
	height: 80px;
}


</style>
<body onload="updateTotal();">

	<%@ include file="/views/common/menubar.jsp"%>
	<br><br><br><br><br>

	<form class="cartForm"  name ="cartForm1" action="<%= contextPath %>/list.order" method="post"  onSubmit="oderValidation(); return false" >
		<div class="cartList">
			<table class="table table-hovar">
				<thead>
					<tr>
						<th><input type="checkbox" id="checkAll" onclick="CheckAll()" checked="checked"/>cart</th>
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
					<td colspan="6" id="emptyCart" value=0;><h2>장바구니가 비어있습니다.</h2></td> 
			
					</div>

					<%
						} else {
					
							for (Cart c : list) {
						%>
						
							<td>
							<input type="checkbox" class="chk" name="selectCheck[]" value="<%=c.getCartNo()%>" checked="checked" onclick="check()">
							<img src='<%=request.getContextPath()%>/resources/images/<%=c.getChangName()%>' class="prodImg">
							</td>
							<td><input type="text" name="prodName" value="<%=c.getProdName()%>"></td>
							<td>
							<img src="<%=request.getContextPath()%>/resources/images/plus.png"  id="upVal" class="upimg" onclick="upBtn(<%= c.getCartNo() %>)">
								<input type="text" class="pAmount" name ="Cartamount" id="amount" value="<%=c.getCartAmount()%>" readonly />
							<img src="<%=request.getContextPath()%>/resources/images/minus.png" class="downimg" onclick= "downBtn(<%= c.getCartNo() %>)">
							</td>
							<td><input type="text" name="forestName" value="<%=c.getForestName()%>"></td>
							<td>2500원</td>
							<td>
							<input type="text" class="prodPrice" value="<%=c.getProdPrice() * c.getCartAmount()%>">원</td>
							<td>
								<button type="button"
									onclick="location.href='<%=contextPath%>/del.cart?cartNo=<%=c.getCartNo()%>'">삭제</button>
							</td>
						</tr>
					<%}%>
					<%}%>
				</tbody>
			</table>
				<div class="totalContainer">
			<hr>

				<div class="form-block-inner-div">
					<label class="mb-2 mr-sm-2">상품가격</label> <input type="text" class="prodOrder" name="prodOrder" id="prodSum" value= 0 readonly>
				</div>
				<div class="form-block-inner-div">
					<label class="mb-2 mr-sm-2">배송비</label> <input type="text" id="deliverPrice" value=2500 readonly>
				</div>
				<hr>
				<div class="form-block-inner-div">
					<label class="mb-2 mr-sm-2">결제금액</label> <input type="text" id="finalPrice" value=0 readonly>
				</div>
				<div class="form-block-inner-div-btn">
					<button type="button" class="btn btn-primary mb-2" onclick="location.href='<%=contextPath %>/list.pr'">쇼핑계속하기</button>
					<button type="submit" class="btn btn-primary mb-2">주문하기</button>
				</div>
				</div>
		</div>
	<br><br>
		<%@ include file="../common/footer.jsp" %>
	</form>
	
	<script>
		//상품 전체리스트 선택,해제
		   $(function(){
			   let total = 0;
		      //전체선택 체크박스 클릭
		      $("#checkAll").click(function(){
		         if($("#checkAll").prop("checked")) { 
		            $("input[type=checkbox]").prop("checked",true);
		            updateTotal()
		         }else{ 
		            $("input[type=checkbox]").prop("checked",false);
		            $('#prodSum').val(0);
		            $('#deliverPrice').val(0);
					$('#finalPrice').val(0);
		         }
		      })
		   });
	
	//체크된값 가격만 출력
	function updateTotal() {
			let total = 0;
		    const listSize = <%= list.size() %>; 
		    const prodPrice = $('.prodPrice'); 
		 //   console.log("prodPrice" + prodPrice)
		 for (let i = 0; i < listSize; i++) {
				if ($('.chk')[i].checked == true) {
						total += Number( $('.prodPrice')[i].value);	
		        }
		    }
		 $('#prodSum').val(total);
		
		 //배송비 70000원이상 무료배송
		 if( total > 70000){
			 $('#deliverPrice').val(0);
			 $('#finalPrice').val(total);
		 }else{
			 $('#deliverPrice').val(2500);
			 $('#finalPrice').val(total+2500);
		 }
			 
	}
		
	//체크박스 해지시 가격변동
	function check(){
		
			let total = 0;
		    const listSize = <%= list.size() %>; 
		    const prodPrice = $('.prodPrice'); 

			 for (let i = 0; i < listSize; i++) {
					if ($('.chk')[i].checked == true) {
							 total += Number( $('.prodPrice')[i].value);	
							 
		       		 }
	        }
			 $('#prodSum').val(total);
			 //배송비 70000원이상 무료배송
			 if( total > 70000){
				 $('#deliverPrice').val(0);
				 $('#finalPrice').val(total);
			 }else{
				 $('#deliverPrice').val(2500);
				 $('#finalPrice').val(total+2500);
			 }
	    }
	
		 
	//수량 증가
	function upBtn(cartNo) {
		const amount = $('.pAmount'); 
		const listSize = <%= list.size() %>; 
		const prodPrice = $('.prodPrice');
		var btns = document.getElementsByClassName("upimg");
		
		 for (let i = 0; i < listSize; i++) {
			if ($('.chk')[i].value == cartNo) {
				var prevAmount= amount[i].value
				amount[i].value++;
//				console.log("no" + $('.chk')[i].value)
//				console.log(" $('.prodPrice')" +  $('.prodPrice')[i].value);
				//수량 버튼 클릭시 DB수량 업데이트
				$.ajax({
					url : "update.cart",
					data : {
						amount:amount[i].value , 
						cartNo:cartNo
					},
					type : "post",
				})	
				//수량이 변경되면 자동으로 상품가격 변경
				$('.prodPrice')[i].value = $('.prodPrice')[i].value/prevAmount*amount[i].value; 
				updateTotal(); //수량이 변경되면 총 상품가격 업데이트
				}
			
		 }		
	}

	//수량감소
	function downBtn(cartNo){
		
		const amount = $('.pAmount');
		const prodPrice = $('.prodPrice');
		const listSize = <%= list.size() %>; 
		var btns = document.getElementsByClassName("downimg");
	 for (let i = 0; i < listSize; i++) {
			if ($('.chk')[i].value == cartNo) {
				var prevAmount= amount[i].value
				//최소수량이 0개이하로 내려가면 안된다
				if(prevAmount > 1){
					amount[i].value--;
				}else{
					alert('최소수량은 1개 이상입니다.')
					amount[i].value = 1;
				}
				
				
				$.ajax({
					url : "update.cart",
					data : {
						amount:amount[i].value , 
						cartNo:cartNo
					},
					type : "post",
					
				})
				$('.prodPrice')[i].value = $('.prodPrice')[i].value/prevAmount*amount[i].value;
				updateTotal();
//				console.log("amount" + (amount[i].value))
//				console.log(" $('.prodPrice')" +  $('.prodPrice')[i].value)
//				console.log(" -----)" +  $('.prodPrice')[i].value/(amount[i].value+1))
    		 }
     	}
	}

	//주문개수 확인
	function oderValidation(){
			if(	$('#prodSum').val() == 0){
				alert('주문하실 상품을 선택해주세요')
				
			}else{
				document.cartForm1.submit();
				return true;
				
			}
			
	}
	
	//장바구니 비어있을때
	$(function(){
		if($('#emptyCart').val() == 0){
			$('#prodSum').val(0);
	        $('#deliverPrice').val(0);
			$('#finalPrice').val(0);
		} 
		
	})


	</script>
</body>
</html>

