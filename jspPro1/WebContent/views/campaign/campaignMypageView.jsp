<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.campaign.model.vo.Campaign" %>
<%

	ArrayList<Campaign> joinList = (ArrayList<Campaign>)request.getAttribute("joinList");
	String message = (String)request.getAttribute("message");

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
    	padding-top: 100px;
    	padding-bottom: 90px;
    	padding-left: 20px;
    	padding-right: 20px;
    	margin: auto;
    
    }
    
    #cancelBtn{
    	background: rgb(158, 164, 107);
 		color: white;
 		width: 100px;
 		border: none;
 		border-radius: 5px;
		padding: 5px;
		margin: 5px;
		font-weight: bolder;
    
    }
    
    #campName:hover{
    	font-weight: bolder;
    	
    }
    
</style>
</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>


	<div class="container-fluid">

		<div class="mainSection col-sm-10">
			<h3>참여 캠페인</h3>
			<hr>

			<%if(joinList.isEmpty()) {%>
				<div><%=message%></div>
				
			<%}else{%>
			
				<%for(Campaign camp : joinList){%>
					<input type="hidden" value="<%=camp.getCampNO()%>">
					
					
					<h5 id="campName"><%=camp.getCampName() %></h5>
					<b>장소 : </b><span><%=camp.getCampLocation() %></span> &nbsp;
					<b>일시 : </b><span><%=camp.getCampDate() %></span> &nbsp; 
					<button id="cancelBtn">신청 취소</button>
					
					<hr>
				<%} %>
				
			<%} %>
			
		</div>

	</div>

<script>


<%if(!joinList.isEmpty()){%>
	$(function(){
		
		$(".mainSection > #campName").click(function(){
			var campNo = $(".mainSection > input").val();
			
			location.href="<%=request.getContextPath()%>/detail.cam?campNo="+campNo;
		})
		
		$("#cancelBtn").click(function(){
			var campNo = $(".mainSection > input").val();
			
			location.href="<%=request.getContextPath()%>/deleteJoin.cam?campNo="+campNo;
		})
	})
<%}%> 

</script>

</body>
</html>