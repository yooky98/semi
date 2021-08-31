<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.product.model.vo.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	Product p = (Product)request.getAttribute("p");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ProductDetailView</title>
<link href='https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap' rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body class="is-preload-0 is-preload-1 is-preload-2">

		<!-- Main -->
			<div id="main">

				<!-- Header -->
				<header id="header">
					<h1>수량</h1>
					<div class="updown">
						<input type="text" name="p_num1" id="p_num1" size="2" maxlength="10" class="p_num" value="1">
						<span><i class="fas fa-arrow-alt-circle-up up" onclick="countUp()"></i></span>
						<span><i class="fas fa-arrow-alt-circle-down down" onclick="countDown()"></i></span>
					</div><br>
					<button id = "basket">장바구니로</button>
			
				</header>
				<hr>
				<!-- 여기에 후기 , 혹시 후기가 없다면, 추천상품만 보여주기--> 
				<header id="header">
					<h1>후기</h1>

				</header>

				<hr>
				<!-- Thumbnail -->
				<header id="header">
					<h1>다른제품</h1>
				</header>
				<section id="thumbnails">
					<!-- article별 for문 돌려서 리스트 가져오기 -->
					<%for(Product pl : list){ %>
						<article>
							<a class="thumbnail" href="images/fulls/01.jpg" data-position="left center"><img src="images/thumbs/01.jpg" alt="" /></a>
							<h2><%=pl.getProdName() %></h2> 
								
							<p><%=pl.getProdDetail() %></p>
						</article>
					<%} %>	

				</section>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>