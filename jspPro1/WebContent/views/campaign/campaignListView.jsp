<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.campaign.model.vo.Campaign"%>
<%

	ArrayList<Campaign> campList = (ArrayList<Campaign>)request.getAttribute("campList");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Campaign</title>


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

 	.campBanner{
    	background: url("resources/images/campaignBanner.jpg");
  		background-size: cover;
  		color: white;
    	width: 100%;
    	height:300px;
    	text-align: center;
    	padding-top: 150px;
    }
    
    .campBanner > h1{
    	font-family: 'Gowun Batang', serif;
  		font-weight: 700;
    }
    
	.campMain{
		background: rgb(239, 240, 227);
	}
    
    .campMain .mainSection{
    	padding: 30px 20px 90px 20px;
    	margin: auto;
    	text-align: center;
    }
    
    .campMain .mainSection a{
    	color: #888888;
    }
    
    .campMain .mainSection a:hover{
    	color: black;
    }

	#campDate{
		color: #888888;
		font-size: 12px;
	}
	
	#ingBtn, #endedBtn{
		font-size: 18px;
		font-family: 'Gowun Batang', serif;
		font-weight: bolder;
		color: rgb(158, 164, 107);
		background: none;
		width: 200px;
		height: 50px;
		border-radius: 5px;
		border: 2px solid  rgb(158, 164, 107);
	}
	
	#ingBtn:focus, #endedBtn:focus{
		outline: none;
		color: white;
		background: rgb(158, 164, 107);
	}
    
</style>
</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

	<section class="campBanner"><h1>Campaign</h1></section>
	<section class="campMain container-fluid">

		<div class="mainSection col-sm-9">
		
			<button id="ingBtn">???????????? ?????????</button> <button id="endedBtn">?????? ?????????</button>
			<hr>

			<div id="ingCamp"></div>
			<div id="endedCamp"></div>
			
		</div>

	</section>
	
<%@ include file="/views/common/footer.jsp"%>

<script>

$(function(){
	
	var today = new Date();
	
	<%for(Campaign camp : campList) {%>
		
		var campDate = new Date('<%=camp.getCampDate()%>');
		
		var content = '<div id="campDate"><%=camp.getCampDate() %></div> &nbsp;' + 
		              '<a href="<%=request.getContextPath()%>/detail.cam?campNo=<%=camp.getCampNO()%>"><%= camp.getCampName() %></a>' + 
                      '<hr>';
		
		if(today > campDate){
			$('#endedCamp').append(content);
		}else{
			$('#ingCamp').append(content);
		}

	<%} %>
	
	$("#endedCamp").hide();
	$("#ingBtn").focus();

	//???????????? ?????????
	$("#ingBtn").click(function(){
		$("#endedCamp").hide();
		$("#ingCamp").show();
	})
	
	//?????? ?????????
	$("#endedBtn").click(function(){
		$("#ingCamp").hide();
		$("#endedCamp").show();
	})
	
})

</script>
</body>
</html>