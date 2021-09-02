<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.product.model.vo.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>product_mainView</title>
<link href='https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap' rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link href="<%=request.getContextPath() %>/resources/css/productMainViewStyle.css" rel="stylesheet">
</head>
<body class="is-preload">
	<%@ include file="../common/menubar.jsp" %>
		<!-- Wrapper -->
	<div id="wrapper">
	
				<!-- Main -->
		<div id="main" style = user-select:none>
			<div class="inner">
				<br>
				<br>
				<input type="search" id = "search" name="search" onkeyup="searchData();">
				<br>		
				<br>
				<section class="tiles">
					<!-- for문 돌려서 등록된 제품만큼 가져오기 -->
					<%for(Product p : list){ %>
						<article>
							<span class="image">
								<img src="<%=request.getContextPath() %>/resources/images/<%=p.getTitleImg() %>" alt="" />
							</span>
							<!-- 히든으로 제품번호 넘겨서 해당 제품 띄우기 -->
							<%-- <a href="<%=request.getContextPath() %>/detail.pr"> --%>
							<a class="productImg">
								<input type="hidden" value="<%= p.getProdNo() %>">
								<h2><%=p.getProdName() %></h2>
								<div class="content">
									<p><%=p.getProdPrice() %>원</p>
								</div>
							</a>
						</article> 



					<%} %>					
					<script>
						$(function(){
							$(".productImg").click(function(){
								var pNo = $(this).children().eq(0).val();
								console.log(pNo);
								location.href= "<%=request.getContextPath() %>/detail.pr?pNo=" + pNo;
							});
						});
						
						function searchData(){
							if (window.event.keyCode == 13) {
								alert($("#search").val());
					        }
						};
					</script>
						
								
							
				</section>
			</div>
		</div>

				<!-- Footer -->
					<!-- <footer id="footer">
				
					</footer> -->

	</div>
</body>
</html>