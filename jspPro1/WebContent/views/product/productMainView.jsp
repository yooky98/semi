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
	
				<!-- Header -->
					<!-- <header id="header">
					
					</header> -->

				<!-- Menu -->
					<!-- <nav id="menu">


					</nav> -->

				<!-- Main -->
		<div id="main">
			<div class="inner">
				<header>
					<h1>상품 메인이고, 이 자리는 메뉴자리입니다 이 부분엔 menubar가 들어옵니다.<br>
						해야할 일 <br>
						사진 끌어오기, 제품 정보 끌어오기, 사진과 제품 연결하기, detail이 아닌 price 보여주기
						클릭 했을 때 상품 detailview로 이동하기
					</h1>
								
				</header>
						<!-- for문 돌려서 등록된 제품만큼 가져오기 -->
				<section class="tiles">
								
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
					</script>
								<%-- <article>
									<span class="image">
										<img src="<%=request.getContextPath() %>/resources/images/city1.PNG" alt="" />
									</span>
									<a href="generic.html">
										<h2>제품 1</h2>
										<div class="content">
											<p>제품 1의 설명입니다.</p>
										</div>
									</a>
								</article> --%>
								
							
				</section>
			</div>
		</div>

				<!-- Footer -->
					<!-- <footer id="footer">
				
					</footer> -->

	</div>
</body>
</html>