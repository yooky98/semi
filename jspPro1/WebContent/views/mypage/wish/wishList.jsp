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
    
</style>

</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>



		<%@ include file="/views/common/mypageAside.jsp" %>


	<div class="container">
		<div class="jumbotron">
			<h2>위시 리스트 </h2>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>Title</th>
					<th>ID</th>
					<th>상품번호</th>
					<th>구매여부</th>
					<th>별점</th>
					<th>작성일</th>
				</tr>
			</thead>

			<tbody>
				
				<c:forEach var="Review" items="${requestScope.list}">
				
				<tr class="info">
					<td>${Review.review_num}</td>
					<td>${Review.user_id}</td>
					<td><a data-toggle="modal" data-target="#myModal2" onclick="review_read(${Review.review_num})">${Review.review_title}</a></td>
					<td>${Review.prod_no}</td>
					
					<%-- 구매여부 1 : 구매O  0 : 구매X --%>
					<c:choose>
						
						<%-- if(a == 1){ --%>
						<c:when test="${Review.review_buy_opt == 1}">
							<td>O</td>
						</c:when>
						<%-- } else if(a == 0){ --%>
						<c:when test="${Review.review_buy_opt == 0}">
							<td>X</td>
						</c:when>
						
					</c:choose>
					
					<%-- 별점 --%>
					<c:choose>
						
						<%-- if(a == 1){ --%>
						<c:when test="${Review.review_star == 1}">
							<td>★☆☆☆☆</td>
						</c:when>
						<%-- if(a == 2){ --%>
						<c:when test="${Review.review_star == 2}">
							<td>★★☆☆☆</td>
						</c:when>
						<%-- if(a == 3){ --%>
						<c:when test="${Review.review_star == 3}">
							<td>★★★☆☆</td>
						</c:when>
						<%-- if(a == 4){ --%>
						<c:when test="${Review.review_star == 4}">
							<td>★★★★☆</td>
						</c:when>
						<%-- if(a == 5){ --%>
						<c:when test="${Review.review_star == 5}">
							<td>★★★★★</td>
						</c:when>
						
						
					</c:choose>
					
					<td>${Review.review_regdate}</td>
				</tr>
				
				</c:forEach>
			
			</tbody>
		</table>
	</div>

</body>
</html>