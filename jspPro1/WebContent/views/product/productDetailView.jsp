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
	width:80%;
	height:100vh;
	background: top right;
	background-image:
		url('<%=request.getContextPath()%>/resources/images/<%=p.getTitleImg()%>');
	background-repeat: no-repeat;
	background-size: cover;
}

#contImg {
	aspect-ratio: 16/9;
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
	int i = 1;
		for (Review r : r_list) {
	%>
	<!-- 각각의 리뷰와 매칭시키기 위해서 i를 통해서 id 부여 -->
	<div class = "modal_wrap" id = "modal_wrap<%=i%>">
		<div class = "modal_close">
			<svg width="48" height="48" viewBox="0 0 172 172">
			<g fill="#9ea46b"><path d="M30.76239,40.89934l10.13502,-10.13537l100.3402,100.3367l-10.13502,10.13537z"></path><path d="M30.75985,131.08675l100.35246,-100.32444l10.13378,10.13661l-100.35246,100.32444z"></path></g></svg>
		</div>
		<div>
			<h1><%=r.getReview_title()%></h1>
			<h2><%=r.getReview_content()%></h2>
			<h3>작성자 : <%=r.getUser_id()%></h3>
			<div id = "star">
			<%for(int j = 0; j<r.getReview_star(); j++){%>
				<img src="https://img.icons8.com/fluency/14/000000/star.png"/>
			<%} %>
			</div>
		</div>
	</div>
	<%	i++;
	} %>
	<!-- 모달을 각 후기 갯수만큼 만들고, 번호에 맞게 조회해서 모달을 보여주게끔 함 -->
	
	
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
				if(r_list.size() > 0){
					int j = 1;
					for (Review r : r_list) {	
				%>
						<section class="reviews">
							<div class = "review_btn">
							<!-- 인자를 wrap'i' 로 하여 해당 모달과 매칭시킴 -->
								<span><a href="javascript:openModal('wrap<%=j%>')"><%=r.getReview_title()%></a></span>
								<span class = "writer"><a>작성자 : <%=r.getUser_id()%></a></span>
							</div>
							<div class = "star">
									<%for(int k = 0; k<r.getReview_star(); k++){%>
										<img src="https://img.icons8.com/fluency/14/000000/star.png"/>
									<%} %>
								</div>
						</section>
				<%
						j++;
					}
				
				}else{%>
					<h5>남겨진 후기가 존재하지 않습니다.</h5>
					
				<%}%>
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
			function openModal(modalname){
				$("#modal_"+modalname).fadeIn();
				$(".black_bg").fadeIn();
			}
			
			$(function(){
				$(".modal_close").click(function(){
					$(".modal_wrap").fadeOut();
					$(".black_bg").fadeOut();
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
