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
    aside{
        background: rgb(239, 240, 227);
    }
    
    .mainSection{
    	padding-top: 90px;
    	padding-bottom: 90px;
    	padding-left: 20px;
    	padding-right: 20px;
    	
    }
    
</style>

</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

	<div class="container-fluid">

		<div class="row mainSection">
			<aside class="col-sm-2">
				<ul>
					<li><a href="<%=request.getContextPath()%>/views/mypage/myPageMain.jsp">내 정보</a></li>
					<li><a href="<%=request.getContextPath()%>/views/mypage/buylist/gumeList.jsp">주문내역 조회</a></li>
					<li><a href="<%=request.getContextPath()%>/views/mypage/wish/wishList.jsp">위시 리스트</a></li>
					<li><a href="#">리뷰 관리</a></li>
					<li><a href="<%=request.getContextPath()%>/views/mypage/question/questionListView.jsp">1:1 문의</a></li>
					<li><a href="#">참여 캠페인</a></li>
				</ul>
			</aside>

			<section class="col-sm-10">
				<h4>주문 내역 조회</h4>
				<hr>

	    <table class="gume">
	        <tr>
	            <th>
	                주문날짜
	            </th>
	
	            <th>
	                상품이미지
	            </th>
	
	            <th>
	                상품명
	            </th>
	
	            <th>
	                가격
	            </th>
	
	            <th>
	                수량
	            </th>
	            <th>
	                주문 상태
	            </th>
	
	        </tr>
<%
		if(order.size() == 0) {
%>
		<tr align='center'>
			<td colspan= '5'>
				주문 내역이 없습니다.
			</td>
		</tr>
		
	        <tr>
	
	            <td>
	                <input type="text" name="name" value="">
	            </td>
	
	            <td>
	                <input type="text" name="name" value="">
	            </td>
	            <td>
	                <input type="text" name="name" value="">
	            </td>
	            <td>
	                <input type="text" name="name" value="">
	            </td>
	            <td>
	                <input type="text" name="name" value="">
	            </td>
	            <td>
	                <input type="text" name="name" value="">
	            </td>
	        </tr>
	    </table>
				<hr>
				
				
				<button onclick="location.href='<%=request.getContextPath() %>/views/mypage/review/review.jsp'">리뷰 쓰기</button>
				
			</section>
			
		</div>
	</div>


</body>
</html>