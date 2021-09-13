<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.campaign.model.vo.Campaign"%>
<%

	ArrayList<Campaign> campList = (ArrayList<Campaign>)request.getAttribute("campList");
	ArrayList<Campaign> endedList = (ArrayList<Campaign>)request.getAttribute("endedList");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<style>

	.campMain{
		background: rgb(239, 240, 227);
	}
    
    .mainSection{
    	padding-top: 30px;
    	padding-bottom: 90px;
    	padding-left: 20px;
    	padding-right: 20px;
    	margin: auto;
    	text-align: center;
    
    }
    
    .mainSection h4{
    	font-weight: bolder;
    	font-family: 'Gowun Batang', serif;
    }
    
    .mainSection a{
    	color: #888888;
    }
    
    .mainSection a:hover{
    	color: black;
    }
    
    .banner{
    	background: url("resources/images/campaignBanner.jpg");
  		background-size: cover;
  		color: white;
    	width: 100%;
    	height:300px;
    	text-align: center;
    	padding-top: 150px;
    }
    
    .banner > h3{
    	font-family: 'Gowun Batang', serif;
    	font-size: 35px;
  		font-weight: 700;
    }

	#campDate{
		color: #888888;
		font-size: 12px;
	}
    
</style>
</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

	<section class="banner"><h3>Campaign</h3></section>
	<section class="container-fluid campMain">

		<div class="mainSection col-sm-9">
			<h4></h4>
			<button id="ingBtn">진행중인 캠페인</button> <button id="endedBtn">지난 캠페인</button>
			<hr>

			<div id="ingCamp">
			<%for(Campaign camp : campList) {%>
				<div id="campDate"><%=camp.getCampDate() %></div> &nbsp;
				<a href="<%=request.getContextPath()%>/detail.cam?campNo=<%=camp.getCampNO()%>"><%= camp.getCampName() %></a>
				<hr>
			<%} %>
			</div>
			
			
			<div id="endedCamp">
			<%for(Campaign eCamp : endedList) {%>
				<div id="campDate"><%=eCamp.getCampDate() %></div> &nbsp;
				<a href="<%=request.getContextPath()%>/detail.cam?campNo=<%=eCamp.getCampNO()%>"><%= eCamp.getCampName() %></a>
				<hr>
			<%} %>
			</div>
			
		</div>

	</section>
	
<%@ include file="/views/common/footer.jsp"%>

<script>

$(function(){
	$("#endedCamp").hide();

	$("#ingBtn").click(function(){
		$("#endedCamp").hide();
		$("#ingCamp").show();
	})
	
	$("#endedBtn").click(function(){
		$("#ingCamp").hide();
		$("#endedCamp").show();
	})
	
})

</script>
</body>
</html>