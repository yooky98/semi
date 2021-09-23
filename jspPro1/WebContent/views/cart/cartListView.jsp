<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.cart.model.vo.Cart , com.kh.product.model.vo.Product"%>
<%@ page import="com.kh.product.model.dao.ProductDao"%>
<%@ page import="com.kh.cart.model.dao.CartDao"%>
<%
	String message = (String) request.getAttribute("message");
%>
<%ArrayList<Cart> list = (ArrayList) request.getAttribute("list");%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giftree</title>
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap'
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
<!-- 폰트  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
body {
	background-color: rgb(239, 240, 227);
	text-align: center;
}
/*input[type="text"]*/
#name, #forest, .prodPrice, #prodSum, #deliverPrice, #finalPrice {
	background-color: rgb(239, 240, 227);
	border-color: rgb(239, 240, 227);
	border: none;
}

input[type="checkbox"] {
	width: 30px;
}

/*태그정렬*/
td {
	text-align: center;
}

tr {
	margin-bottom: 10px;
}

p {
	text-align: center;
	margin-top: 30px;
}

/*가격수량 부분*/
.pAmount {
	width: 40px;
	text-align: center;
	border: 2px solid rgb(158, 164, 107);
	border-radius: 10px;
}

.pAmount:hover {
	border: 2px solid gray;
}

/*수량  (+,-)*/
.upimg {
	width: 15px;
	height: 15px;
}

.downimg {
	width: 15px;
	height: 15px;
}

/*결제,쇼핑하기 버튼*/
.form-block-inner-div-btn {
	text-align: center;
}

/*결제부분 수직정렬*/
.form-block-inner-div {
	display: block;
	text-align: right;
	margin-right: 120px;
}

/*상품이미지크기*/
#prodImg {
	width: 110px;
	height: 90px;
	margin-left: 40px;
}

/*상단 체크박스 줄 맞추기위해서*/
#checkAll {
	margin-right: 150px;
}

/*테이블안에 가운데 정렬*/
#name, #amount, #forest, .prodPrice {
	text-align: center;
	margin-top: 30px;
}

.prodPrice {
	width: 20%
}
/*삭제 버튼 */
#deleteBtn {
	font-family: 'Gowun Batang', serif;
	text-align: center;
	margin-top: 30px;
	padding-right: 10px;
	padding-left: 10px;
}

.prodOrder, #deliverPrice, #finalPrice {
	text-align: center;
	width: 10%;
}
/*테이블위의 제목*/
#title {
	text-align: left;
	margin-left: 100px;
	margin-bottom: 10px;
}

#caption {
	font-weight: bold;
}

#deleteBtn {
	font-weight: bolder;
	color: rgb(158, 164, 107);
	background: none;
	border-radius: 3px;
	border: 2px solid rgb(158, 164, 107);
}

#shopBackBtn, #ordersBtn {
	font-family: 'Gowun Batang', serif;
	height: 50px;
	color: white;
	background: none;
	background-color: rgb(158, 164, 107);
	border-radius: 4px;
	border: 2px solid rgb(158, 164, 107);
}

#deleteBtn:hover {
	font-family: 'Gowun Batang', serif;
	border: 2px solid gray;
	color: gray;
}

#shopBackBtn:hover, #ordersBtn:hover {
	font-family: 'Gowun Batang', serif;
	background-color: rgb(239, 240, 227);
	color: rgb(158, 164, 107);
	border: 2px solid rgb(158, 164, 107);
}

/*아이콘*/
.fa-shopping-cart {
	font-size: 40px;
	color: rgb(158, 164, 107);
	margin-left: 20px;
}

.fa-question-circle:hover {
	color: red;
}

#emptyCart {
	margin-top: 30px;
	font-family: 'Gowun Batang', serif;
}
/*장바구니 수량 개수*/
#chkCnt {
	width: 30px;
	height: 30px;
	text-align: center;
	margin-left: 5px;
	margin-bottom: 5px;
	background-color: rgb(239, 240, 227);
	border-radius: 10px;
	border: 3px solid rgb(158, 164, 107);
	font-size: 25px;
	font-weight: bolder;
}

#titleTxt {
	font-size: 30px;
	font-family: 'Gowun Batang', serif;
	font-weight: bolder;
}
</style>
<body onload="updateTotal();">

	<%@ include file="/views/common/menubar.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>

	<form class="cartForm" name="cartForm1"
		action="<%=contextPath%>/list.order" method="post"
		onSubmit="oderValidation(); return false">
		<div class="cartList">
			<div id="title">
				<i class="fas fa-shopping-cart"></i>
				<caption>
					<a id="titleTxt">Cart<input type="text" vlaue="0" id="chkCnt"></a>
				</caption>
			</div>
			<table class="table">
				<thead>
					<tr class="text-center">
						<th><input type="checkbox" id="checkAll" onclick="CheckAll()"
							checked="checked" /><label id="chkLabel"></label></th>
						<th>상품정보</th>
						<th>수량</th>
						<th>숲</th>
						<th>배송비 <i a class="far fa-question-circle"
							data-toggle="tooltip" data-placement="top"
							title="[조건부 무료배송] 70,000원 이상 무료배송"></th>
						<th>가격</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
						if (list.isEmpty()) {
					%>
					<div calss="emptyList">
						<td colspan="6"><div id="emptyCart">
								<h2>장바구니가 비어있습니다.</h2>
								<br>
								<h5>상품을 추가해주세요</h5>
							</div></td>
					</div>

					<%
						} else {

					for (Cart c : list) {
					%>
					<td><input type="checkbox" class="chk" name="selectCheck[]"
						value="<%=c.getCartNo()%>" checked="checked" onclick="check()">
						<img
						src='<%=request.getContextPath()%>/resources/images/<%=c.getChangName()%>'
						id="prodImg" readonly></td>
					<td><input type="text" id="name" name="prodName"
						value="<%=c.getProdName()%>" readonly></td>
					<td><img
						src="<%=request.getContextPath()%>/resources/images/plus.png"
						id="upVal" class="upimg" onclick="upBtn(<%=c.getCartNo()%>)">
						<input type="text" class="pAmount" id="amount"
						value="<%=c.getCartAmount()%>" readonly /> <img
						src="<%=request.getContextPath()%>/resources/images/minus.png"
						class="downimg" onclick="downBtn(<%=c.getCartNo()%>)"></td>
					<td><input type="text" id="forest" name="forestName"
						value="<%=c.getForestName()%>" readonly></td>
					<td><p>2500원</p></td>
					<td><input type="text" class="prodPrice"
						value="<%=c.getProdPrice() * c.getCartAmount()%>" readonly>원

					
					<td>
						<button type="button" id="deleteBtn"
							onclick="location.href='<%=contextPath%>/del.cart?cartNo=<%=c.getCartNo()%>'">삭제</button>
					</td>
					</td>
					</tr>
					<%
						}
					%>
					<%
						}
					%>
				</tbody>
			</table>
			<div class="totalContainer">
				<hr>
				<div id="cartPriceForm">
					<div class="form-block-inner-div">
						<label class="mb-2 mr-sm-2" name="paytext">상품가격</label> <input
							type="text" class="prodOrder" name="prodOrder" id="prodSum"
							value=0 readonly>원
					</div>
					<div class="form-block-inner-div">
						<label class="mb-2 mr-sm-2" name="paytext">배송비</label> <input
							type="text" id="deliverPrice" value=2500 readonly>원
					</div>
					<hr>
					<div class="form-block-inner-div">
						<label class="mb-2 mr-sm-2" name="paytext">결제금액</label> <input
							type="text" id="finalPrice" value=0 readonly>원
					</div>
				</div>
				<div class="form-block-inner-div-btn">
					<span><button type="button" id="shopBackBtn"
							onclick="location.href='<%=contextPath%>/list.pr'">쇼핑계속하기</button></span>
					<span><button type="submit" id="ordersBtn">주문하기</button></span>
				</div>

			</div>
		</div>
		<br>
		<br>
		<%@ include file="../common/footer.jsp"%>
	</form>

	<script>
		//상품 전체리스트 선택,해제
		   $(function(){
			   let total = 0;
		      //전체선택 체크박스 클릭
		      $("#checkAll").click(function(){
		         if($("#checkAll").prop("checked")) { 
		            $("input[type=checkbox]").prop("checked",true);
		            //체크박스 개수
		            var obj_length = $("input:checkbox[name='selectCheck[]']:checked").length;
			        $('#chkCnt').val(obj_length);
		            updateTotal()
		         }else{ 
		            $("input[type=checkbox]").prop("checked",false);
		            $('#prodSum').val(0);
		            $('#deliverPrice').val(0);
					$('#finalPrice').val(0);
			        $('#chkCnt').val(0);
		         }
		      })
		   });
	
	//체크된값 가격만 출력
	function updateTotal() {
			let total = 0;
		    const listSize = <%=list.size()%>; 
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
		
	//체크박스 해지시 가격변동
	function check(){
			let total = 0;
		    const listSize = <%=list.size()%>; 
		    const prodPrice = $('.prodPrice'); 

			 for (let i = 0; i < listSize; i++) {
					if ($('.chk')[i].checked == true) {
							 total += Number( $('.prodPrice')[i].value);
							 //체크박스 개수
								var obj_length = $("input:checkbox[name='selectCheck[]']:checked").length;
						        $('#chkCnt').val(obj_length);  
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
		const listSize = <%=list.size()%>; 
		const prodPrice = $('.prodPrice');
		var btns = document.getElementsByClassName("upimg");
		
		 for (let i = 0; i < listSize; i++) {
			if ($('.chk')[i].value == cartNo) {
				var prevAmount= amount[i].value
				amount[i].value++;
				
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
		const listSize = <%=list.size()%>; 
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

	//체크박스 수량 체크 
	$(function(){
		var obj_length = $("input:checkbox[name='selectCheck[]']:checked").length;
	        $('#chkCnt').val(obj_length);
	})

	//배송비 툴팁
	$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
	

	
	</script>
</body>
</html>

