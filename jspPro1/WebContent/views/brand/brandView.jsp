<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.forest.model.vo.Forest"%>
<%
	ArrayList<Forest> forestList = (ArrayList<Forest>)request.getAttribute("forestList");
	int forestCount = (Integer)request.getAttribute("forestCount");
	int treeCount = (Integer)request.getAttribute("treeCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Brand</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 카카오 지도 -->      
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06eb71c1421813889ecc4fbc8655acb0"></script>

<!-- counter -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/counterup.min.js"></script>

<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

<style>
    
    .brandMission .mainSection, .forestMap{
    	padding: 30px 20px;
    	margin: auto;
    	text-align: center;
    
    }
    
    .brandBanner{
    	background: url("/Giftree/resources/images/brandBanner1.jpg");
  		background-size: cover;
  		color: white;
  		text-align: center;
    	width: 100%;
    	height: 500px;
    	padding-top: 250px;
    }
    
    .brandBanner  h1{
    	font-family: 'Gowun Batang', serif;
  		font-weight: 700;
    }
    
    .forestTable{
    	font-size: 13px;
    	height: 400px;
    	overflow-y: auto;
    }
    
    .forestTable::-webkit-scrollbar { 
		display: none; 
	}
    
  
</style>

</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="brandBanner"><h1>Brand Mission</h1></div>
	
	<section class="brandMission">
		<div class="container-fluid">

			<div class="mainSection col-sm-10">
			
				<div class="section-title">
					<h3>함께 숲을 만들어갈 수 있도록!</h3>
					<hr>
				</div>
				
				<p>
					 많은 사람들이 숲이 중요하다는 것을 알지만<br>
					 개인이 숲을 만들기는 어려운 것이 현실입니다.<br><br>
					 기프트리는 많은 사람들과 함께 숲을 만들어 갈 수 있도록 노력합니다.<br>
					 반려나무를 입양하면 숲에 나무를 심는 방법으로 개인이 숲을 만들수 있도록 하였습니다.<br>
					 또한 캠페인을 통해 직접 나무를 심을 수 있는 자리를 마련하였습니다.<br><br>
					 기프트리와 함께 더 많은 숲을 만들어 주세요.<br>
					 지구에게 그리고 나에게 숲을 선물해 주세요.
				</p>
			</div>

		</div>
	</section>
	
	
	<section id="facts" class="facts">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h3>기프트리 임팩트</h3>
				<p>기프트리는 여러분이 입양한 나무 수 만큼 숲에 나무를 심습니다.</p>
			</div>

			<div class="row counters col-sm-8 factsCounter" >

				<div class=" col-sm-6 text-center">
					<span class="counter" data-toggle="counter-up"><%=forestCount %></span>
					<p>조성한 숲</p>
				</div>

				<div class=" col-sm-6 text-center">
					<span class="counter" data-toggle="counter-up"><%=treeCount %></span>
					<p>심은 나무 수</p>
				</div>

			</div>

		</div>
	</section>
	
	<section id="forestMap" class="forestMap">
		<div class="container-fluid">

			<div class="section-title">
				<h3>숲 리스트</h3>
			</div>

			<div class="row counters">

				<div class="forestTable col-5 ">
					<table class="table">
			      		<thead class="thead-light">
				      		<tr>
				      			<th>숲 이름</th><th>위치</th><th>나무 수</th>
				      		</tr>
			      		</thead>
			      		
			      		<%for(Forest forest : forestList) {%>
			      			<tr>
			      				<td><%=forest.getForestName() %></td>
			      				<td><%=forest.getForestLocation() %></td>
			      				<td><%=forest.getTreeQuantity() %></td>
			      			</tr>
			      		
			      		<%} %>
			      	</table>
		      	</div>

				<div class="map col-7">
					<div id="map" style="width:800px;height:400px;"></div>
				</div>

			</div>

		</div>
	</section>
<%@ include file="/views/common/footer.jsp"%>
	
<script>

	$(function(){
		  
	    $('[data-toggle="counter-up"]').counterUp({
	        delay: 10,
	        time: 1000
	      });
	    
	})

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(37.550473, 126.990182), // 지도의 중심좌표
	    level: 13 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	
		<%for(Forest forest : forestList){%>
			{
		    	title:'<%=forest.getForestName()%>',
		    	latlng: new kakao.maps.LatLng(<%=forest.getForestSite()%>)
			},
		<%}%>
	
	];
	
	//마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	
	for (var i = 0; i < positions.length; i ++) {
	
	// 마커 이미지의 이미지 크기 입니다
	var imageSize = new kakao.maps.Size(24, 35); 
	
	// 마커 이미지를 생성합니다    
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    map: map, // 마커를 표시할 지도
	    position: positions[i].latlng, // 마커를 표시할 위치
	    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	    image : markerImage // 마커 이미지 
	});
	}

</script>

</body>
</html>