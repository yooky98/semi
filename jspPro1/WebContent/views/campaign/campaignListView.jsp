<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.campaign.model.vo.Campaign"%>
<%

	ArrayList<Campaign> campList = (ArrayList<Campaign>)request.getAttribute("campList");

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
    
    .mainSection{
    	padding-top: 30px;
    	padding-bottom: 90px;
    	padding-left: 20px;
    	padding-right: 20px;
    	margin: auto;
    
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
    
</style>
</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

	<div class="banner"><h3>Campaign</h3></div>
	<div class="container-fluid">

		<div class="mainSection col-sm-10">
			<h4>진행중인 캠페인</h4>
			<hr>

			<%for(Campaign camp : campList) {%>
				<a href="<%=request.getContextPath()%>/detail.cam?campNo=<%=camp.getCampNO()%>"><%= camp.getCampName() %></a>
				<hr>
			<%} %>
		</div>

	</div>

</body>
</html>