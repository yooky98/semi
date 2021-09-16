<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.wish.model.vo.*"%>
 
  
<%
	ArrayList<Wish> w_list = (ArrayList<Wish>) request.getAttribute("w_list");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>

<%-- jQuery CDN --%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


<%-- BootStrap CDN --%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

<style>

    
    .mainSection{
    	padding-top: 90px;
    	padding-bottom: 90px;
    	padding-left: 20px;
    	padding-right: 20px;
    	
    }
    .prodImg{
	width: 100px;
	height: 80px;
}
    
    
</style>

</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>




			<%@ include file="/views/common/mypageAside.jsp" %>

	<div class="container">
	
		<div class="jumbotron">
			<h2>찜한 상품 </h2>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>image</th>
					<th>상품번호</th>
					<th>상품명</th>
					<th>가격</th>

				</tr>
			</thead>

			<tbody>
			
			<%
				if(w_list.isEmpty()){ 
			%>
			<tr>
				<td colspan="5" align="center">찜한 상품이 존재하지 않습니다.</td>
			</tr>
			<%
				} else {
				for(Wish wish : w_list){
			%>
			<tr>
			<td><input id="wishNo" type="text" value="<%=wish.getWishNo() %>"></td>
			<td><img src="<%=request.getContextPath()%>/resources/images/<%=wish.getChangeName()%>" class="prodImg"></td>
			<td><input id="prodNo" type="text" value="<%=wish.getProdNo() %>"></td>
			<td><%=wish.getProdName() %></td>
			<td><%=wish.getProdPrice() %></td>
			<td>
				<button type="button"
				onclick="location.href='<%=contextPath%>/delete.ws?wishNo=<%=wish.getWishNo()%>'">삭제</button>
			</td>
				<%} %>
			<%} %>
			</tbody>
			</tr>
		</table>
	</div>
	<script>
	$(function(){
	$(".prodImg").click(function(){
		var pNo = $("#prodNo").val();
		console.log(pNo);
		location.href= "<%=request.getContextPath() %>/detail.pr?pNo=" + pNo;
		});
	});
	</script>
	
</body>
</html>