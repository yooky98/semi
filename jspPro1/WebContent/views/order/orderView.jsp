<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.cart.model.vo.Cart , com.kh.product.model.vo.Product"%>
<%@ page import="com.kh.product.model.dao.ProductDao"%>
<%@ page import="com.kh.member.model.vo.UserVO" %>
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
    <title>Document</title>
    <link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">

    <!-- Latest compiled and minified CSS --> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!--주소록-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!--결제 -->
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


</head>
<style>
.prodImg{
	width: 60px;
	height: 50px;
}
</style>
<body>

	<%@ include file="/views/common/menubar.jsp"%>
		<br><br><br><br><br><br><br>
 <form action="orderPay.del" name="payOrder" method="post">		
  <div class="container">
    <h1>결제하기</h1>
    <p></p>
    <div class="row" id="prod-Order-detail">
      <div class="col-6">
        <p>주문 상품 정보</p>
        <div class="card">
          <div class="card-body">
      
          
            <table>
            <% 
            	for(Cart c : clist){ %>
              <tr>
                <td><img src='<%=request.getContextPath()%>/resources/images/<%=c.getChangName()%>' class="prodImg"></td>
                <td><input type="text" class="orderProdName" name= prodName value="<%=c.getProdName()%>" readonly></td>
                <td><input type="text" id= "prodAmount" name= prodAmount value="<%=c.getCartAmount()%>" readonly></td>
                <td><input type="hidden" class= prodPrice value="<%=c.getProdPrice() * c.getCartAmount()%>"></td>
                <td><input type="hidden" class= orderProdNo value="<%=c.getProdNo()%>"></td> <!-- 상품번호 -->
                <td><input type="hidden" class= orderForestName value="<%=c.getForestName()%>"></td> <!-- 숲 여러개-->
                <td><input type="hidden" class= orderAmount value="<%=c.getCartAmount()%>"></td> 
                <td><input type="hidden" class= orderPrice value="<%=c.getProdPrice()%>"></td> 
              </tr>
              <%}%>
            </table>
          </div>
        </div>
      </div>
      <div class="col-6" id="final-total-sum">
        <p>최종결제 금액</p>
        <div class="card">
          <div class="card-body">
            <form class="orderForm" >
              <label>상품가격:</label> 
              <input type="text" id="prodSum" value= total readonly><br>
              <label>배송비:</label><input type="text" id="delivery" value=0 readonly><br>
              <label>보유포인트:</label><input type="text" id="point" value="<%=loginUser.getPoint() %>" readonly><br>
              <label>포인트:</label><input type="text" id="usePoint" value=0>
              <button type="button" onclick="Point()">사용</button>
              <button type="button" onclick="PointCancel()">취소</button>
            <hr>
            <label>결제 금액:</label><input type="text" id="finalPrice" value=0 readonly >
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-6">
        <p>배송 정보</p>
        <div class="card">
          <div class="card-body">
            <div>
               <input type="checkbox" id="chk" checked> 주문자 정보와 동일<br>
               <input type="text" class="input-text" placeholder="수령인" id="orderName" value="<%=loginUser.getUser_name()%>">
               <input type="text" class="input-text" placeholder="연락처" id="orderPhone" value="<%=loginUser.getPhone() %>">
               <% String[] arr = loginUser.getAddress().replaceAll(" ", "").split("&");%>
               <input type="text" class="input-text" id="postcode" placeholder="우편번호" value=<%=arr[0]%>>
               <input type="button" class="input-text" onclick="Address()" value="우편번호 찾기"><br>
               <input type="text" class="input-text" id="postcode_address" placeholder="주소" value=<%=arr[1]%>><br>
               <input type="text" class="input-text" id="postcode_detailAddress" placeholder="상세주소" value=<%=arr[2]%>> 
            </div>
               <br>
            <div>
              <select name= "deliverOption" id="deliveryOption">
                <option value="배송시 요청사항을 입력해주세요">배송메모를 선택해주세요</option>
                <option value="배송전에 미리 연락바랍니다">배송전에 미리 연락바랍니다</option>
                <option value="부재시 경비실에 맡겨주세요">부재시 경비실에 맡겨주세요</option>
                <option value="파손의 위험이 있는 상품입니다.배송 시 주의해주세요 ">파손의 위험이 있는 상품입니다.배송 시 주의해주세요 </option>
              </select>
            </div>
            </form>
          </div>
        </div>
      </div>
      <div class="col-6">
        <p>결제하기</p>
        <div class="card">
          <div class="card-body">
            <div class="form-check">
            <input type="radio" id="payCard" value="신용카드">신용카드 
            	 <hr>
			  <input type="checkbox" id= "orderAgree">구매 조건 전체 동의<br>
          	  <button type="button" id="check_module" onclick="iport()" >주문하기</button>	
          </div>
        </div>
      </div>
    </div>
  </div>
  <br><br>
</form>
</body>
<%@ include file="../common/footer.jsp" %>

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
		
	}


	//주소 api
    function Address() {
        new daum.Postcode({
            oncomplete: function(data) {
                
                var addr = ''; 
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
               
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
      
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
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
	function iport(){
		
		if($('#ordreAgree').checked == false){
			alert('개인정보처리방침에 동의하셔야 합니다.')
			$('#ordreAgree').focus(); 	
		}
		   var IMP = window.IMP; // 생략가능
			    IMP.init('imp97085825');

			    // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			    // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			    IMP.request_pay({
			    pg: 'html5_inicis', // version 1.1.0부터 지원.
		
			    pay_method: 'card',

			    merchant_uid: new Date().getTime(),

		
			    name: '주문명:Giftree',
			    //결제창에서 보여질 이름
			    //$('#finalPrice').val() 테스트시 100
			    amount:	$('#finalPrice').val(),
			    //가격
			    buyer_email: 'chltjsghtjsgh12@naver.com',
			    buyer_name: $('#orderName').val(),
			    buyer_tel: $('#orderPhone').val(),
			    buyer_addr: $('#postcode_address').val(),
			    buyer_postcode: $('#postcode').val()
			    
			    /*
			    모바일 결제시,
			    결제가 끝나고 랜딩되는 URL을 지정
			    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			    */
			    }, 
			    function (rsp) {
			   	 	console.log(rsp);
				   if (rsp.success) {
					   
					  var msg = '결제가 완료되었습니다 , 구매해주셔서 감사합니다.';
					    msg += '고유ID : ' + rsp.imp_uid;
					    msg += '상점 거래ID : ' + rsp.merchant_uid;
					    msg += '결제 금액 : ' + rsp.paid_amount;
					    msg += '카드 승인번호 : ' + rsp.apply_num;
				    } else {
					    var msg = '결제에 실패하였습니다.';
					    msg += '에러내용 : ' + rsp.error_msg;
						   
						   $.ajax({
							   
									   url : "pay",	
									  	async: false,
										data : {
											orderName : $('#orderName').val(),
											orderPhone : $('#orderPhone').val(),
											addr : $('#postcode_address').val(),
											postcode : $('#postcode').val(),
											postcode_detailAddress : $('#postcode_detailAddress').val(),
											orderMsg : $('#deliveryOption').val(),
											orderTotalPrice : $('#finalPrice').val(),
											merchant_uid: rsp.merchant_uid, //주문고유번호 (주문번호로 사용하기)
											point : $('#point').val()   
										},
									   type : "post",
									   
									   success: function (result){//ordersNo = result
											
											   var prodNoList = [];
											   var ForestNameList = [];
											   var orderAmountList = [];
											   var orderPriceList = [];
											  
									
											   for(let i =0 ; i < $('.orderProdNo').length ; i++ ){
												   prodNoList.push($('.orderProdNo')[i].value);
												   ForestNameList.push($('.orderForestName')[i].value);
												   orderAmountList.push($('.orderAmount')[i].value);
												   orderPriceList.push($('.orderPrice')[i].value); 
												   
												}
										
											//   console.log("ss=" + delCartList)
											   
												$.ajax({
													url : "orderPay.del",
													traditional: true, 
													data : {
														
														ordersNo : result, 
														prodNo : prodNoList,
														ForestNameList : ForestNameList,
														orderAmountList : orderAmountList,
														orderPriceList : orderPriceList
													
		
													},
													type : "post",
													success : function(){
														 window.location.href="detail.order";                  
													}
													
													
												});
												
										   	},
										
												 
							  		 	});
					  		 	
				    			}
				    });
	}
	
    </script>
    
</html>