<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.cart.model.vo.Cart , com.kh.product.model.vo.Product"%>
<%@ page import="com.kh.product.model.dao.ProductDao"%>
<%@ page import="com.kh.cart.model.dao.CartDao"%>
<%
	String message = (String) request.getAttribute("message");
%>
<% ArrayList<Cart> list = (ArrayList) request.getAttribute("list"); %>
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
</head>
<body>

	<%@ include file="/views/common/menubar.jsp"%>
		<br><br><br><br><br><br><br>
		
  <div class="container">
    <h1>결제하기</h1>
    <p></p>
    <div class="row" id="prod-Order-detail">
      <div class="col-6">
        <p>주문 상품 정보</p>
        <div class="card">
          <div class="card-body">
            <table>
              <tr>
                <td>상품이미지</td>
                <td>상품이름</td>
                <td>주문수량</td>
              </tr>
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
              <input type="text" class="prodPrice" ><br>
              <label>배송비:</label><input type="text" class="delivery" ><br>
              <label>포인트 사용:</label><input type="text" class="point" >
            <hr>
            <label>결제 금액:</label><input type="text" class="orderPrice" >
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-6">
        <p>배송 정보</p>
        <div class="card">
          <div class="card-body">
            <form>
            <div>
               <input type="checkbox"> 주문자 정보와 동일<br>
               <input type="text" placeholder="수령인">
               <input type="text" placeholder="연락처">
               <input type="text" id="postcode" placeholder="우편번호">
               <input type="button" onclick="Address()" value="우편번호 찾기"><br>
               <input type="text" id="postcode_address" placeholder="주소"><br>
               <input type="text" id="postcode_detailAddress" placeholder="상세주소">
            </div>
               <br>
            <div>
              <select>
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
                <input type="radio" class="form-check-input" name="optradio">신용카드
              </label>
            </div>
            <div class="form-check">
              <label class="form-check-label">
                <input type="radio" class="form-check-input" name="optradio">실시간 계좌이체
              </label>
            </div>
            <div class="form-check">
              <label class="form-check-label">
                <input type="radio" class="form-check-input" name="optradio">카카오페이
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
  <input type="submit" value="주문하기" >
</form>
</body>
<script>
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
</script>
</html>