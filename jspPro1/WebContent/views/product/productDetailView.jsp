<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.product.model.vo.*, com.kh.wish.model.vo.*, com.kh.review.model.vo.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
	Product p = (Product) request.getAttribute("p");
	ArrayList<Wish> w_list = (ArrayList<Wish>) request.getAttribute("w_list");
	ArrayList<Review> r_list = (ArrayList<Review>) request.getAttribute("r_list");

	for (int i = 0; i < list.size(); i++) {
		if (list.get(i).getProdName().equals(p.getProdName())) {
			p.setTitleImg(list.get(i).getTitleImg());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ProductDetailView</title>
<link
	href='https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap'
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="<%=request.getContextPath()%>/resources/css/productDetailViewStyle.css"
	rel="stylesheet">
<style>
html {
	background-image:
		url('<%=request.getContextPath()%>/resources/images/<%=p.getTitleImg()%>');
	background-repeat: no-repeat;
	background-size: cover;
}

#contImg {
	aspect-ratio: 16/9;
}

.modal_wrap{
        display: none;
        width: 500px;
        height: 500px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 8889;
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.7);
        top:0;
        left: 0;
        z-index: 8888;
    }
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
    
</style>
</head>
<body class="is-preload-0 is-preload-1 is-preload-2">
	<%@ include file="../common/menubar.jsp"%>
	
	<!-- 찜목록 하트 -->
	<div class="stage">
		<div class="heart"></div>
	</div>
	
	<!-- 후기 조회시 모달창 -->
	<div class = "black_bg"></div>
	<%
		for (Review r : r_list) {
	%>
	<div class = "modal_wrap">
		<div class = "modal_close"><a href="#">close</a></div>
		<div>
			<h2><%=r.getReview_title()%></h2>
			<%=r.getReview_content()%><br>
			<%=r.getUser_id()%><br>
			<%=r.getReview_star()%>
		</div>
	</div>
	<%} %>
	<form id="cartForm" action="insert.cart" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="prodNo" value="<%=p.getProdNo()%>">

		<!-- Main -->
		<div id="detailMain" style="user-select: none">
			<br> <br> <br>
			<!-- Header -->
			<header id="detailHeader">
				<h1><%=p.getProdName()%></h1>
				<p><%=p.getProdDetail()%></p>
				<!-- select 숲 선택하기  -->
				<select name="forest" required>
					<option value="">원조할 숲을 선택해주세요</option>
					<option value="숲1">숲1</option>
					<option value="숲2">숲2</option>
					<option value="숲3">숲3</option>
				</select>
				<div class="updown">
					<h2><%=p.getProdPrice()%>원 &emsp; 
						<input type="text" name="count" id="num" size="2"maxlength="2" value="1"> 
						<span><i class="fas fa-arrow-alt-circle-up up" onclick="countUp()"></i></span> 
						<span><i class="fas fa-arrow-alt-circle-down down" onclick="countDown()"></i></span>
					</h2>

				</div>
				<br>
				<button type="submit" id="cart">장바구니로</button>

			</header>
			<hr>
			
			
			<!-- 여기에 후기 , 혹시 후기가 없다면, 추천상품만 보여주기-->
			<header id="detailHeader">
				<h1>후기</h1>
				<%
					for (Review r : r_list) {
				%>
						<section class="reviews">
							<h2 class = "review_btn"><%=r.getReview_title()%></h2>
							<%=r.getReview_content()%><br>
							<%=r.getUser_id()%><br>
							<%=r.getReview_star()%>
						</section>
				<%
					}
				%>
			</header>

			<hr>


			<!-- Thumbnail -->
			<header id="detailHeader">
				<h1>다른제품</h1>
			</header>
			<section id="thumbnails">
				<!-- article별 for문 돌려서 리스트 가져오기 -->
				<%
					for (Product pl : list) {
				%>
						<article>
							<a class="thumbnail" data-position="left center"> 
							<input type="hidden" value="<%=pl.getProdNo()%>"> 
							<img src="<%=request.getContextPath()%>/resources/images/<%=pl.getTitleImg()%>"
								id="contImg" alt="" />
							</a>
						</article>
				<%
					}
				%>
				<br> <br> <br> <br> <br> <br>


			</section>

		</div>
	</form>


	<script>
			$(function(){
				// 로그인 한 회원이 detailView에 들어왔을 때, 찜목록에서 이미 찜 한 상품이라면 heart on시켜주기
				<%if (loginUser != null) {
					for (Wish w : w_list) {
						if (w.getProdNo() == p.getProdNo()) {%>
							$(".heart").toggleClass("on_heart");
						<%}%>
					<%}%>
				<%}%>
			})
			
			// 다른제품에서 썸네일 클릭시 해당 상품으로 가기
			$(function(){
				$(".thumbnail").click(function(){
					var pNo = $(this).children().eq(0).val();
					console.log(pNo);
					location.href= "<%=request.getContextPath()%>/detail.pr?pNo=" + pNo;
				});
			});
			
			
			// 단추 클릭시 카운트 업, 다운
			function countUp(){
				var num = Number($("#num").val());
					$("#num").val(num+1);
				};
						
			function countDown(){
				var num = Number($("#num").val());
				if(num>0){
					$("#num").val(num-1);	
				}
				// 총액 관련한 부분 추가해야함.
			};					
					
		</script>

		<script type="text/javascript">
	
			// 찜목록 추가 부분
			function addWish(){
				<%if (loginUser != null) {%>
					var pNo = <%=p.getProdNo()%>;
					var userId = "<%=loginUser.getUser_id()%>";

					$.ajax({
						url : "insert.ws",
						type : "post",
						data : {
							pNo : pNo,
							userId : userId
						},

						success : function(status) {
							if (status == "success") {
								$(".heart").toggleClass("on_heart");
							} else if (status == "fail") {
								alert("찜 목록에 이미 추가되어 있는 상품입니다.");
								// 삭제는 추후 추가
							}
						},

						error : function() {
							console.log("error : 찜");
						}
					})
				<%} else {%>
					alert("비회원은 찜을 할 수 없습니다.")
				<%}%>
			};

			$(function() {
				$("html").dblclick(function() {
					addWish();
				});
				
				$(".heart").click(function() {
					addWish();
				});
				
				$("html").children().dblclick(function(e) {
					// html이 아닌 자식클래스를 더블클릭하면 이벤트 실행 안되게하기
					e.stopPropagation();
				});
			});

			
			//리뷰 모달 기능
			$(function(){
				$(".modal_close").click(function(){
					$(".modal_wrap").fadeOut();
					$(".black_bg").fadeOut();
				});
				
				$(".review_btn").click(function(){
					$(".modal_wrap").fadeIn();
					$(".black_bg").fadeIn();
				});
				
				$(".black_bg").click(function(){
					$(".modal_wrap").fadeOut();
					$(".black_bg").fadeOut();
				});
				
			});
			
			
			
			
			/* 
			window.onload = function() {
				 
			    function onClick() {
			        document.querySelector('.modal_wrap').style.display ='block';
			        document.querySelector('.black_bg').style.display ='block';
			    }   
			    function offClick() {
			        document.querySelector('.modal_wrap').style.display ='none';
			        document.querySelector('.black_bg').style.display ='none';
			    }
			 
				document.getElementById('review_btn').addEventListener('click', onClick);
			    document.querySelector('.modal_close').addEventListener('click', offClick);
			 
			};
 */
	</script>

</body>
</html>
