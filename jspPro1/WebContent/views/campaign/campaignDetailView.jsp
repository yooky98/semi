<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.campaign.model.vo.Campaign"%>
<% 
	Campaign camp = (Campaign)request.getAttribute("camp");
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
</head>
<style>

	.campDetail{
		background: rgb(239, 240, 227);
	}
	
 	.campDetail .mainSection{
    	padding: 30px 20px 20px 20px;
    	margin: auto;
    	text-align: center;
    }
    
    .campDetail .mainSection h4{
    	font-weight: bolder;
    	font-family: 'Gowun Batang', serif;
    }
    
    #joinBtn{
    	background: rgb(158, 164, 107);
 		color: white;
 		height: 50px;
 		width: 200px;
 		border: none;
 		border-radius: 5px;
		padding: 5px;
		margin-top: 30px;
		font-weight: bolder;
    }
    
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
    
</style>

<body>

<%@ include file="/views/common/menubar.jsp" %>

	<div class="campBanner"><h1>Campaign</h1></div>
	<section class="campDetail container-fluid">

		<div class="mainSection col-sm-9">

			<h4><%=camp.getCampName()%></h4>
			<hr>

			<div>
			<b>장소 :</b> <span><%=camp.getCampLocation() %></span> &nbsp;
			<b>날짜 :</b> <span><%=camp.getCampDate() %></span> &nbsp;
			<b>참여 가능 인원 :</b> <span id="capa"></span> / <%=camp.getCampCapa() %>
			
			</div>
			
			<hr>
			
			<div><%=camp.getCampContent() %></div>
			
			<div id="jBtn">
				<button id="joinBtn" onclick="joinCheck()">캠페인 참여하기</button>
			</div>
			<hr>
			
		</div>

	</section>
<%@ include file="/views/common/footer.jsp"%>
	
<script>
<%-- 회원만 참여가능, 참여가능 인원 : 참여가능인원 - 참여 인원count(campNo), 회원의 해당 캠페인 참여 여부 확인 
신청 인원이 다 찼을 경우 참여하기 버튼 비활성화 하기--%>	

$(function(){
	capacity();
	
	var today = new Date();
	var campDate = new Date('<%=camp.getCampDate()%>');
	
	if(today > campDate){
		$("#joinBtn").html("완료된 캠페인입니다.").attr('disabled', 'true').css("background", "rgb(206, 205, 205)");
	}
	
})

	function joinCheck(){
		
		<%if(loginUser == null){%>
			alert("로그인이 필요한 서비스입니다.")
			location.href="<%=contextPath%>/views/member/login.jsp";
		<%}else{%>
		
			var campNo =  <%=camp.getCampNO()%>;
			$.ajax({
				url:"join.cam",
				data: {campNo : campNo},
				type: "post",
				success: function(result){
					if(result == "fail"){
						alert("이미 참여한 캠페인입니다.")
					}else if(result == "success"){
						alert("참여가 완료되었습니다. 마이페이지 참여 캠페인에서 확인해 주세요.")
						capacity();
					}
				},
				error: function(e){
					console.log(e);
				}
			})
			
		<%}%>
		
	}

	function capacity(){
		$("#capa").empty();
		
		var campCapa = <%=camp.getCampCapa() %>;
		var campNo =  <%=camp.getCampNO()%>;
		
		$.ajax({
			url:"capa.cam",
			data:{ campNo : campNo, campCapa : campCapa},
			type:"post",
			success: function(capa){
				if(capa > 0){
					$("#capa").html(capa);
				}else{
					$("#capa").html("신청마감");
					$("#joinBtn").attr("disabled", "true").html("캠페인 참여마감").css("background", "rgb(206, 205, 205)");
				}
				
			},
			error: function(e){
				console.log(e);
			}
			
		})
		
	}

</script>

</body>
</html>