<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.product.model.vo.*, com.kh.wish.model.vo.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	Product p = (Product)request.getAttribute("p");
	ArrayList<Wish> w_list = (ArrayList<Wish>)request.getAttribute("w_list");
	
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

	.stage {
  		position: fixed;
  		top: 95%;
  		left: 3%;
  		transform: translate(-50%, -50%);
	}


	.heart {
  		width: 100px;
  		height: 100px;
  		background: url("https://cssanimation.rocks/images/posts/steps/heart.png") no-repeat;
  		cursor: pointer;
  		transition: background-position 1s steps(28);
  		transition-duration: 0s;
 	}
	
	.is-active {
   		transition-duration: 1s;
   		background-position: -2800px 0;
	}
</style>
</head>
<body class="is-preload-0 is-preload-1 is-preload-2">
	<%@ include file="../common/menubar.jsp" %>
	<div class="stage">
  		<div class="heart"></div>
	</div>
	
	<form id="cartForm" action="insert.cart" method="post" enctype="multipart/form-data">
		<input type="hidden" name="prodNo" value="<%= p.getProdNo() %>">
		
		<!-- Main -->
			<div id="detailMain" style = user-select:none>
				<br>
				<br>
				<br>
				<!-- Header -->
				<header id="detailHeader">
					<h1><%=p.getProdName() %></h1>
					<p><%=p.getProdDetail() %></p>
					<!-- select 숲 선택하기  -->
					<select name = "forest" required>
						<option value = "">원조할 숲을 선택해주세요 </option>
						<option value = "숲1">숲1</option>
						<option value = "숲2">숲2</option>
						<option value = "숲3">숲3</option>
					</select>
					<div class="updown">
						<h2><%=p.getProdPrice() %> 원  &emsp;
							<input type="text" name="count" id="num" size="2" maxlength="2" value="1">
							<span><i class="fas fa-arrow-alt-circle-up up" onclick="countUp()"></i></span>
							<span><i class="fas fa-arrow-alt-circle-down down" onclick="countDown()"></i></span>
			
						</h2>
						
					</div>
					<br>
					<button type = "submit" id = "cart">장바구니로</button>
			
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
						</article>
					<%} %>	
					<br><br><br><br><br><br>
					<script>
						$(function(){
							$(".thumbnail").click(function(){
								var pNo = $(this).children().eq(0).val();
								console.log(pNo);
								location.href= "<%=request.getContextPath() %>/detail.pr?pNo=" + pNo;
							});
						});
						
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
					
					<script type = "text/javascript">
						$(function(){
							$("html").dblclick(function() {
								<% if(loginUser != null){ %>
									<%-- <%if(w_list)%> --%>
									var pNo = <%=p.getProdNo() %>;
									var userId = "<%=loginUser.getUser_id() %>";
									
									$.ajax({
										url:"insert.ws",
										type:"post",
										data:{
											pNo : pNo,
											userId : userId
										},
										
										success:function(status){
											if(status == "success"){
												$(".heart").toggleClass("is-active");
												alert("찜 목록에 추가되었습니다.");
											}else if(status == "fail"){
												$(".heart").toggleClass("is-active");
												alert("찜 목록에 이미 추가되어 있는 상품입니다.");
											}
										},
										
										error:function(){
											console.log("error : 찜");
										}
									})
									
						    	<% } else { %>
						    		alert("비회원은 찜을 할 수 없습니다.")
						   		<% } %> 
						    });
						});
						
						$(function(){
							$("html").children().dblclick(function(e){
								// html이 아닌 자식클래스를 더블클릭하면 이벤트 실행 안되게하기
								e.stopPropagation();
							});
						});
						
						$(function() {
							$(".heart").on("click", function() {
								$(this).toggleClass("is-active");
								console.log("<%=w_list%>");
							});
						});
								
					</script>
				</section>

			</div>
		</form>

	</body>
</html>