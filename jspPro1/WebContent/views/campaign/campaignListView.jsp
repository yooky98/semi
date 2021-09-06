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
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    
    .mainSection{
    	padding-top: 90px;
    	padding-bottom: 90px;
    	padding-left: 20px;
    	padding-right: 20px;
    	margin: auto;
    
    }
    
</style>
</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>


	<div class="container-fluid">

		<div class="mainSection col-sm-10">
			<h3>Campaign</h3>
			<hr>

			<%for(Campaign camp : campList) {%>
			<input type="hidden" value="<%=camp.getCampNO()%>">
			<h6><%= camp.getCampName() %></h6>
			<hr>
			<%} %>
		</div>

	</div>

<script>

<%if(!campList.isEmpty()){%>
	$(function(){
		$(".mainSection>h6").click(function(){
			var campNo = $(".mainSection>input").val();
			location.href= "<%=request.getContextPath()%>/detail.cam?campNo="+campNo;
		})		
	})
<%}%>

</script>

</body>
</html>