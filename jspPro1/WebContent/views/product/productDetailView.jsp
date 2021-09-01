<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.product.model.vo.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	Product p = (Product)request.getAttribute("p");
	
	for(int i = 0 ; i<list.size() ; i++){
		if(list.get(i).getProdName().equals(p.getProdName())){
			p.setTitleImg(list.get(i).getTitleImg()); 
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ProductDetailView</title>
<link href='https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap' rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="<%=request.getContextPath() %>/resources/css/productDetailViewStyle.css" rel="stylesheet">
<style>
	html {
		background-image: url('<%=request.getContextPath() %>/resources/images/<%=p.getTitleImg() %>');
		background-repeat: no-repeat;
		background-size:cover;
	}
	#contImg{
		aspect-ratio:16/9;
	}
</style>
</head>
<body class="is-preload-0 is-preload-1 is-preload-2">
	<%@ include file="../common/menubar.jsp" %>
		<!-- Main -->
			<div id="detailMain">
				<br>
				<br>
				<br>
				<!-- Header -->
				<header id="detailHeader">
					<h1><%=p.getProdName() %></h1>
					<p><%=p.getProdDetail() %></p>
					<div class="updown">
						<input type="text" name="p_num1" id="p_num1" size="2" maxlength="10" class="p_num" value="1">
						<span><i class="fas fa-arrow-alt-circle-up up" onclick="countUp()"></i></span>
						<span><i class="fas fa-arrow-alt-circle-down down" onclick="countDown()"></i></span>
					</div><br>
					<button id = "cart" onclick="moveCart()">장바구니로</button>
			
				</header>
				<hr>
				<!-- 여기에 후기 , 혹시 후기가 없다면, 추천상품만 보여주기--> 
				<header id="detailHeader">
					<h1>후기</h1>

				</header>

				<hr>
				<!-- Thumbnail -->
				<header id="detailHeader">
					<h1>다른제품</h1>
				</header>
				<section id="thumbnails">
					<!-- article별 for문 돌려서 리스트 가져오기 -->
					<%for(Product pl : list){ %>
						<article>
							<a class="thumbnail" data-position="left center">
								<input type="hidden" value="<%= pl.getProdNo() %>">	
								<img src="<%=request.getContextPath() %>/resources/images/<%=pl.getTitleImg() %>" id = "contImg" alt="" />
							</a>

							<h2><%=pl.getProdName() %></h2> 
								
							<p><%=pl.getProdDetail() %></p> 
						</article>
					<%} %>	
					<br><br><br>
					<script>
						$(function(){
							$(".thumbnail").click(function(){
								var pNo = $(this).children().eq(0).val();
								console.log(pNo);
								location.href= "<%=request.getContextPath() %>/detail.pr?pNo=" + pNo;
							});
						});
					</script>
				</section>

			</div>
		

	</body>
</html>