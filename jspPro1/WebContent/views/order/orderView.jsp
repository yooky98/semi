<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.cart.model.vo.Cart , com.kh.product.model.vo.Product"%>
<%@ page import="com.kh.product.model.dao.ProductDao"%>
<%@ page import="com.kh.member.model.vo.UserVO"%>
<%@ page import="com.kh.cart.model.dao.CartDao"%>
<%
	String message = (String) request.getAttribute("message");
%>
<% ArrayList<Cart> clist = (ArrayList)request.getAttribute("clist");%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giftree</title>

<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!--주소록-->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--결제 -->
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
.prodImg {
	width: 90px;
	height: 85px;
}

.card-body {
	background-color: rgb(239, 240, 227);
}

.orderProdName, #prodAmount, .chk, .input-text {
	text-align: center;
	margin: auto;
}

.upPt {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	margin-bottom: 20px;
	margin-top: 20px;
}

.downPt {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	margin-bottom: 10px;
	margin-top: 30px;
}

/*최종결제 금액 텍스트 박스 정렬*/
.divBox {
	display: inline-block;
	float: right;
	margin-right: 220px;
}

.poinBox {
	display: inline-block;
	margin-left: 61px;
}

.PointdivBox {
	display: inline-block;
	margin-left: 30px;
}
/*결제 css*/
#prodSum, #delivery, #point, #usePoint, #finalPrice {
	border-radius: 5px;
	width: 124px;
	border: 1px solid rgb(158, 164, 107);
}

#prodSum, #delivery, #point, #usePoint, #finalPrice {
	text-align: right;
}
/*주문상품css*/
.orderProdName, #prodAmount {
	background-color: rgb(239, 240, 227);
	border-color: rgb(239, 240, 227);
	border: none;
}
/*배송정보*/
#orderName, #orderPhone, #postcode {
	border-radius: 5px;
	width: 200px;
	border: 1px solid rgb(158, 164, 107);
	margin-bottom: 10px;
}

#postcode_address, #postcode_detailAddress {
	border-radius: 5px;
	width: 400px;
	border: 1px solid rgb(158, 164, 107);
	margin-bottom: 10px;
}

#postcode {
	margin-right: 30px;
}

#deliveryOption {
	height: 40px;
	border: 1px solid rgb(158, 164, 107);
}
/*포인트 버튼*/
#pointBtn {
	font-family: 'Gowun Batang', serif;
	width: 55px;
	color: white;
	background: none;
	background-color: rgb(158, 164, 107);
	border-radius: 4px;
	border: 2px solid rgb(158, 164, 107);
	margin-left: 15px;
}

#pointDelBtn {
	font-family: 'Gowun Batang', serif;
	width: 55px;
	color: black;
	background: none;
	background-color: lightgray;
	border-radius: 4px;
	border: 3px solid lightgray;
}
/*주문하기 버튼*/
#check_module {
	font-family: 'Gowun Batang', serif;
	width: 90px;
	color: white;
	background: none;
	background-color: rgb(158, 164, 107);
	border-radius: 4px;
	border: 4px solid rgb(158, 164, 107);
	margin-top: 30px;
}
/*우편번호 찾기 버튼*/
#addressBtn {
	font-family: 'Gowun Batang', serif;
	width: 150px;
	color: white;
	background: none;
	background-color: rgb(158, 164, 107);
	border-radius: 4px;
	border: 4px solid rgb(158, 164, 107);
}

#addressBtn:hover, #check_module:hover {
	background: rgb(143, 148, 96);
	border: 4px solid rgb(143, 148, 96);
}
</style>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form action="orderPay.del" name="payOrder" method="post">
		<div class="container">
			<h1
				style="text-align: center; font-weight: bold; font-family: 'Gowun Batang', serif;">결제하기</h1>
			<p></p>
			<div class="row" id="prod-Order-detail">
				<div class="col-6">
					<p class="upPt">주문 상품 정보</p>
					<div class="card ">
						<div class="card-body">
							<table class="orderTable">
								<thead style="text-align: center;">
									<th></th>
									<th>상품정보</th>
									<th>수량</th>
								</thead>
								<% 
            	for(Cart c : clist){ %>
								<tr>
									<td><img
										src='<%=request.getContextPath()%>/resources/images/<%=c.getChangName()%>'
										class="prodImg"></td>
									<td><input type="text" class="orderProdName" name=prodName
										value="<%=c.getProdName()%>" readonly></td>
									<td><input type="text" id="prodAmount" name=prodAmount
										value="<%=c.getCartAmount()%>" readonly></td>
									<td><input type="hidden" class=prodPrice
										value="<%=c.getProdPrice() * c.getCartAmount()%>"></td>
									<td><input type="hidden" class=orderProdNo
										value="<%=c.getProdNo()%>"></td>
									<!-- 상품번호 -->
									<td><input type="hidden" class=orderForestName
										value="<%=c.getForestName()%>"></td>
									<!-- 숲 여러개-->
									<td><input type="hidden" class=orderAmount
										value="<%=c.getCartAmount()%>"></td>
									<td><input type="hidden" class=orderPrice
										value="<%=c.getProdPrice()%>"></td>
								</tr>
								<%}%>
							</table>
						</div>
					</div>
				</div>
				<div class="col-6" id="final-total-sum">
					<p class="upPt">최종결제 금액</p>
					<div class="card">
						<div class="card-body">
							<form class="orderForm">
								<label>상품가격</label>
								<div class="divBox">
									<input type="text" id="prodSum" value=total readonly> 원
								</div>
								<br> <label>배송비</label>
								<div class="divBox">
									<input type="text" id="delivery" value=0 readonly> 원
								</div>
								<br> <label>보유포인트(P)</label>
								<div class="PointdivBox">
									<input type="text" id="point"
										value="<%=loginUser.getPoint() %>" readonly>
								</div>
								<br> <label>포인트(P)</label>
								<div class="poinBox">
									<input type="text" id="usePoint" value=0>
								</div>
								<button type="button" id="pointBtn" onclick="Point()">사용</button>
								<button type="button" id="pointDelBtn" onclick="PointCancel()">취소</button>
								<hr>
								<label>결제 금액:</label>
								<div class="divBox">
									<input type="text" id="finalPrice" value=0 readonly>원
								</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					<p class="downPt">배송 정보</p>
					<div class="card">
						<div class="card-body">
							<div>
								<input type="checkbox" id="chk" onclick="orderValidation()">
								주문자 정보와 동일
								<hr>
								<input type="text" class="input-text" placeholder="수령인"
									id="orderName" value=""> <input type="text"
									class="input-text" placeholder="연락처" id="orderPhone" value="">
								<% String[] arr = loginUser.getAddress().replaceAll(" ", "").split("&");%>
								<input type="text" class="input-text" id="postcode"
									placeholder="우편번호" value=""> <input type="button"
									class="input-text" id="addressBtn" onclick="Address()"
									value="우편번호 찾기"><br> <input type="text"
									class="input-text" id="postcode_address" placeholder="주소"
									value=""><br> <input type="text"
									class="input-text" id="postcode_detailAddress"
									placeholder="상세주소" value="">
								<%----------------------------------------------------------- --%>
								<input type="hidden" class="input-text" placeholder="수령인"
									id="orderNamec" value="<%=loginUser.getUser_name()%>">
								<input type="hidden" class="input-text" placeholder="연락처"
									id="orderPhonec" value="<%=loginUser.getPhone() %>"> <input
									type="hidden" class="input-text" id="postcodec"
									placeholder="우편번호" value=<%=arr[0]%>> <input
									type="hidden" class="input-text" id="postcode_addressc"
									placeholder="주소" value=<%=arr[1]%>><br> <input
									type="hidden" class="input-text" id="postcode_detailAddressc"
									placeholder="상세주소" value=<%=arr[2]%>>
								<hr>
							</div>
							<div>
								<select name="deliverOption" id="deliveryOption">
									<option value="배송시 요청사항을 입력해주세요">배송메모를 선택해주세요</option>
									<option value="배송전에 미리 연락바랍니다">배송전에 미리 연락바랍니다</option>
									<option value="부재시 경비실에 맡겨주세요">부재시 경비실에 맡겨주세요</option>
									<option value="파손의 위험이 있는 상품입니다.배송 시 주의해주세요 ">파손의 위험이
										있는 상품입니다.배송 시 주의해주세요</option>
								</select>
							</div>
	</form>
	</div>
	</div>
	</div>
	<div class="col-6">
		<p class="downPt">결제하기</p>
		<div class="card">
			<div class="card-body">
				<div class="form-check">
					<input type="radio" id="payCard" checked value="신용카드">신용카드
					<hr>
					<input type="checkbox" id="orderAgree">구매 조건 전체 동의<br>
					<button type="button" id="check_module" onclick="iport()">주문하기</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	<br>
	<br>
	</form>
</body>
<%@ include file="../common/footer.jsp"%>

<script>
	
	//결제 가격
	$(function(){
		let total = 0;
		const prodPrice = $('.prodPrice');
		const listSize = <%= clist.size() %>;
		
		for(let i =0 ; i<listSize ; i++){
			total += Number($('.prodPrice')[i].value);
			console.log("총값 = " +$('.prodPrice')[i].value)
		}
		$('#prodSum').val(total);
		
		if(	total < 70000){
			$('#delivery').val(2500);
			$('#finalPrice').val(total+2500);
		}else{
			$('#delivery').val(0);
			$('#finalPrice').val(total);
		}
	
	});
	
	//포인트 사용
	var prePoint = Number($('#point').val()); //이전 포인트 저장
	var preFinalPrice = Number($('#finalPrice').val(total));

	function Point(){
	
		var point = Number($('#point').val()); // 보유 포인트
		var usePoint = Number($('#usePoint').val()); // 사용 포인트

		if(usePoint > point){
			alert('사용가능한 포인트를 초과하였습니다.')
		}else if(usePoint < 0){
			alert('잘못된 사용방식입니다.')
		}else{
			$('#finalPrice').val(($('#finalPrice').val() - usePoint));
			$('#point').val(point - usePoint);
		}
	}
	
	//포인트 취소
	function PointCancel(){
		$('#point').val(prePoint);
		$('#usePoint').val(0);
		
		let total = 0;
		const prodPrice = $('.prodPrice');
		const listSize = <%= clist.size() %>;

		for (let i = 0; i < listSize; i++) {
			total += Number($('.prodPrice')[i].value);

		}
		$('#prodSum').val(total);

		if (total < 70000) {
			$('#delivery').val(2500);
			$('#finalPrice').val(total + 2500);
		} else {
			$('#delivery').val(0);
			$('#finalPrice').val(total);
		}

	}

	//주문자 동일 체크 박스
	function orderValidation() {
		$('#orderName').val($('#orderNamec').val());
		$('#orderPhone').val($('#orderPhonec').val());
		$('#postcode').val($('#postcodec').val());
		$('#postcode_address').val($('#postcode_addressc').val());
		$('#postcode_detailAddress').val($('#postcode_detailAddressc').val());
	}

	//주소 api
	function Address() {
		new daum.Postcode({
			oncomplete : function(data) {

				var addr = '';
				var extraAddr = '';

				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}

				if (data.userSelectedType === 'R') {

					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}

					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
				}

				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("postcode_address").value = addr;

				document.getElementById("postcode_detailAddress").focus();
			}
		}).open();
	}

	var ordersNo; //전역변수

	//결제
	function iport() {

		//체크박스 선택안하고 넘어갔을때
		if (!$("input:checked[id='orderAgree']").is(":checked")) {
			alert("구매조건 확인에 동의하여 주시기 바랍니다.");
			$("#orderAgree").focus();
			return;
		} else if (!$("input:checked[id='chk']").is(":checked")) {
			alert("배송정보를 입력해주세요");
			$("#chk").focus();
			return;
		}

		var IMP = window.IMP;
		IMP.init('imp97085825');

		IMP
				.request_pay(
						{
							pg : 'html5_inicis', // version 1.1.0부터 지원.

							pay_method : 'card',

							merchant_uid : new Date().getTime(),

							name : '주문명:Giftree',
							
							amount : $('#finalPrice').val(),
							//가격
							buyer_email : 'chltjsghtjsgh12@naver.com',
							buyer_name : $('#orderName').val(),
							buyer_tel : $('#orderPhone').val(),
							buyer_addr : $('#postcode_address').val(),
							buyer_postcode : $('#postcode').val()

						},
						function(rsp) {
							console.log(rsp);
							if (rsp.success) {


								$.ajax({

											url : "pay",
											async : false,
											data : {
												orderName : $('#orderName')
														.val(),
												orderPhone : $('#orderPhone')
														.val(),
												addr : $('#postcode_address')
														.val(),
												postcode : $('#postcode').val(),
												postcode_detailAddress : $(
														'#postcode_detailAddress')
														.val(),
												orderMsg : $('#deliveryOption')
														.val(),
												orderTotalPrice :100,//$('#finalPrice').val(),
												merchant_uid : rsp.merchant_uid, 
												point : $('#point').val()
											},
											type : "post",

											success : function(result) {//ordersNo = result

												var prodNoList = [];
												var ForestNameList = [];
												var orderAmountList = [];
												var orderPriceList = [];

												for (let i = 0; i < $('.orderProdNo').length; i++) {
													prodNoList.push($('.orderProdNo')[i].value);
													ForestNameList.push($('.orderForestName')[i].value);
													orderAmountList.push($('.orderAmount')[i].value);
													orderPriceList.push($('.orderPrice')[i].value);
												}
												$.ajax({
															url : "orderPay.del",
															traditional : true,
															data : {
																ordersNo : result,
																prodNo : prodNoList,
																ForestNameList : ForestNameList,
																orderAmountList : orderAmountList,
																orderPriceList : orderPriceList
															},
															type : "post",
															success : function() {
																window.location.href = "detail.order";
															}

														});

											},

										});
							} else {
								var msg = '결제에 실패하였습니다.';
								msg += '에러내용 : ' + rsp.error_msg;


							}
						});
	}
</script>

</html>