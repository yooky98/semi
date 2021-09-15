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
 <form>		
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
                <td><input type="text" name= prodName value="<%=c.getProdName()%>" readonly></td>
                <td><input type="text" name= prodAmount value="<%=c.getCartAmount()%>" readonly></td>
                <td><input type="hidden" class= prodPrice value="<%=c.getProdPrice() * c.getCartAmount()%>"></td>
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
               <input type="text" class="input-text" placeholder="수령인" value="<%=loginUser.getUser_name()%>">
               <input type="text" class="input-text" placeholder="연락처"  value="<%=loginUser.getPhone() %>">
               <% String[] arr = loginUser.getAddress().replaceAll(" ", "").split("&");%>
               <input type="text" class="input-text" id="postcode" placeholder="우편번호" value=<%=arr[0]%>>
               <input type="button" class="input-text" onclick="Address()" value="우편번호 찾기"><br>
               <input type="text" class="input-text" id="postcode_address" placeholder="주소" value=<%=arr[1]%>><br>
               <input type="text" class="input-text" id="postcode_detailAddress" placeholder="상세주소" value=<%=arr[2]%>>  
            </div>
               <br>
            <div>
              <select name= "deliverOption">
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
            <h5 class="card-title">결제방법</h5>
            <div class="form-check">
              <label class="form-check-label">
                <input type="radio" class="form-check-input" name="optradio" value="신용카드">신용카드
              </label>
            </div>
            <div class="form-check">
              <label class="form-check-label">
                <input type="radio" class="form-check-input" name="optradio" value="실시간계좌이체">실시간 계좌이체
              </label>
            </div>
            <div class="form-check">
              <label class="form-check-label">
                <input type="radio" class="form-check-input" name="optradio" value="카카오페이">카카오페이
              </label>
            </div>
            <hr>
            <input type="checkbox">구매 조건 전체 동의<br>
          </div>
        </div>
      </div>
    </div>
  </div>
  <br><br>
  <button type="button" id="orderBtn" value = 1>주문하기</button>
</form>
</body>
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

    $("#orderBtn").click(function () {
	    var IMP = window.IMP; // 생략가능
	    IMP.init('imp97085825');
	    console.log('121212212')
	    // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	    IMP.request_pay({
	    pg: 'html5_inicis', // version 1.1.0부터 지원.
	    /*
	    'kakao':카카오페이,
	    html5_inicis':이니시스(웹표준결제)
	    'nice':나이스페이
	    'jtnet':제이티넷
	    'uplus':LG유플러스
	    'danal':다날
	    'payco':페이코
	    'syrup':시럽페이
	    'paypal':페이팔
	    */
	    pay_method: 'card',
	    /*
	    'samsung':삼성페이,
	    'card':신용카드,
	    'trans':실시간계좌이체,
	    'vbank':가상계좌,
	    'phone':휴대폰소액결제
	    */
	    merchant_uid: 'merchant_' + new Date().getTime(),
	    /*
	    merchant_uid에 경우
	    https://docs.iamport.kr/implementation/payment
	    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	    참고하세요.
	    나중에 포스팅 해볼게요.
	    */
	    name: '주문명:결제테스트',
	    //결제창에서 보여질 이름
	    amount: 1000,
	    //가격
	    buyer_email: 'iamport@siot.do',
	    buyer_name: '구매자이름',
	    buyer_tel: '010-1234-5678',
	    buyer_addr: '서울특별시 강남구 삼성동',
	    buyer_postcode: '123-456',
	    m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	    /*
	    모바일 결제시,
	    결제가 끝나고 랜딩되는 URL을 지정
	    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	    */
	    }, function (rsp) {
	    console.log(rsp);
	    if (rsp.success) {
	    var msg = '결제가 완료되었습니다.';
	    msg += '고유ID : ' + rsp.imp_uid;
	    msg += '상점 거래ID : ' + rsp.merchant_uid;
	    msg += '결제 금액 : ' + rsp.paid_amount;
	    msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	    var msg = '결제에 실패하였습니다.';
	    msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	    });
    });
    
    
    
    </script>
</html>