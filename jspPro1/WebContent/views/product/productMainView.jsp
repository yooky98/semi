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
<script src="https://cdn.jsdelivr.net/npm/bootstrap-detect-breakpoint/src/bootstrap-detect-breakpoint.js"></script>
	<style>
			html, body, div, span,h1, h2, p, a, form, article, section {
				margin: 0;
				padding: 0;
				border: 0;
				font-size: 100%;
				font: inherit;
				vertical-align: baseline;
			}

			article, section {
				display: block;
			}

			body {
				background:	rgb(239, 240, 227);
			}

			header p {
				margin-top: -1em;
			}
		
			h2{
				font-weight: 900;
				line-height: 1.5;
				margin: 0 0 2em 0;
				text-transform: uppercase;
				letter-spacing: 0.35em;
			}

			h2 a{
				color: inherit;
			}

			h2 {
				font-size: 1.1em;
			}

			body, input, select, textarea {
				color: #585858;
				font-family: 'Gowun Batang', serif;
				font-size: 16pt;
				font-weight: 300;
				line-height: 1.75;
			}

			.tiles {
				display: flex;
				flex-wrap: wrap;
				position: relative; 
				margin: -2.5em 0 0 -2.5em;
				margin-top: 2em;
			}

			.tiles article {
				transition: transform 0.5s ease, opacity 0.5s ease;
				position: relative;
				width: calc(33.33333% - 2.5em);
				margin: 2.5em 0 0 2.5em;
			}

			.tiles article > .image {
				transition: transform 0.5s ease;
				position: relative;
				display: block;
				width: 100%;
				border-radius: 4px;
				overflow: hidden;
			}

			.tiles article > .image img {
				display: block;
				width: 100%;
			}

			.tiles article > .image:before {
				pointer-events: none;
				transition: background-color 0.5s ease, opacity 0.5s ease;
				content: '';
				display: block;
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				z-index: 1;
				opacity: 0.15;
			}

			.tiles article > a {
				display: flex;
				flex-direction: column;
				align-items: center;
				justify-content: center;
				/* 글씨 색 변하는 속도 */
				transition: background-color 0.5s ease, transform 0.5s ease;
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				padding: 1em;
				border-radius: 4px;
				border-bottom: 0;
				color: #ffffff;
				text-align: center;
				text-decoration: none;
				z-index: 3;
			}

			.tiles article > a > :last-child {
				margin: 0;
			}

			.tiles article > a:hover {
				color: #ffffff !important;
			}

			.tiles article > a h2 {
				margin: 0;
			}

			.tiles article > a .content {
				transition: max-height 0.5s ease, opacity 0.5s ease;
				width: 100%;
				max-height: 0;
				line-height: 1.5;
				margin-top: 0.35em;
				opacity: 0;
			}

			.tiles article > a .content > :last-child {
				margin-bottom: 0;
			}

			.tiles article > .image:before {
				background-color: black;
			}

			/* 마우스 올렸을때 확대관련 */
			body:not(.is-touch) .tiles article:hover > .image {
				transform: scale(1.1);
			}
			/* 확대 했을때 색상과 투명도 */
			body:not(.is-touch) .tiles article:hover > .image:before {
				background-color: black;
				opacity: 0.55;
			}

			/* 상세 설명 글자관련 */
			body:not(.is-touch) .tiles article:hover .content { 
				max-height: 15em;
				opacity: 1;
			}

			/* 이너의 사이즈 조절 */
			#wrapper > * > .inner {
				width: 100%;
				max-width: 68em;
				margin: 0 auto;
				padding: 0 2.5em;
			}

			/* 반응형 */
			@media screen and (max-width: 1680px) {

				body, input, select, textarea {
					font-size: 14pt;
				}

			}

			@media screen and (max-width: 1280px) {
			
				body, input, select, textarea {
					font-size: 12pt;
				}
			
				.tiles {
					margin: -1.25em 0 0 -1.25em;
				}

				.tiles article {
					width: calc(33.33333% - 1.25em);
					margin: 1.25em 0 0 1.25em;
				}

			}

			@media screen and (max-width: 980px) {
			
				.tiles {
					margin: -2.5em 0 0 -2.5em;
				}

				.tiles article {
					width: calc(50% - 2.5em);
					margin: 2.5em 0 0 2.5em;
				}

			}

			@media screen and (max-width: 736px) {

				.tiles {
					margin: -1.25em 0 0 -1.25em;
				}

				.tiles article {
					width: calc(50% - 1.25em);
					margin: 1.25em 0 0 1.25em;
				}

				.tiles article:hover > .image {
					transform: scale(1.0);
				}

				#wrapper > * > .inner {
					padding: 0 1.25em;
				}

			}

			@media screen and (max-width: 480px) {
			
				html, body {
					min-width: 320px;
				}

				.tiles {
					margin: 0;
				}

				.tiles article {
					width: 100%;
					margin: 1.25em 0 0 0;
				}
			
			}

	</style>
	</head>
	<body class="is-preload">
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
									<a href="generic.html">
										<h2><%=p.getProdName() %></h2>
										<div class="content">
											<p><%=p.getProdPrice() %>원</p>
										</div>
									</a>
								</article> 



								<%} %>					
									
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
								
								
								
								
								<article>
									<span class="image">
										<img src="images/flower1.PNG" alt="" />
									</span>
									<a href="generic.html">
										<h2>제품 2</h2>
										<div class="content">
											<p>제품 2의 설명입니다.</p>
										</div>
									</a>
								</article>
								<article>
									<span class="image">
										<img src="images/flower2.PNG" alt="" />
									</span>
									<a href="generic.html">
										<h2>제품 3</h2>
										<div class="content">
											<p>제품 3의 설명입니다.</p>
										</div>
									</a>
								</article>
								<article>
									<span class="image">
										<img src="images/flower3.PNG" alt="" />
									</span>
									<a href="generic.html">
										<h2>제품 4</h2>
										<div class="content">
											<p>제품 4의 설명입니다.</p>
										</div>
									</a>
								</article>
								<article>
									<span class="image">
										<img src="images/flower4.PNG" alt="" />
									</span>
									<a href="generic.html">
										<h2>제품 5</h2>
										<div class="content">
											<p>제품 5의 설명입니다.</p>
										</div>
									</a>
								</article>
								<article>
									<span class="image">
										<img src="images/flower5.PNG" alt="" />
									</span>
									<a href="generic.html">
										<h2>제품 6</h2>
										<div class="content">
											<p>제품 6의 설명입니다.</p>
										</div>
									</a>
								</article>
								
							</section>
						</div>
					</div>

				<!-- Footer -->
					<!-- <footer id="footer">
				
					</footer> -->

			</div>
	</body>
</html>