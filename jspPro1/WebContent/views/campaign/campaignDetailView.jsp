<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.campaign.model.vo.Campaign"%>
<% 

	Campaign camp = (Campaign)request.getAttribute("camp");

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
</head>
<style>
 .mainSection{
    	padding-top: 30px;
    	padding-bottom: 90px;
    	padding-left: 20px;
    	padding-right: 20px;
    	margin: auto;
    
    }
    
    #joinBtn{
    	background: rgb(158, 164, 107);
 		color: white;
 		width: 200px;
 		border: none;
 		border-radius: 5px;
		padding: 5px;
		margin-top: 30px;
		font-weight: bolder;
    
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

<body>

<%@ include file="/views/common/menubar.jsp" %>

	<div class="banner"><h3>Campaign</h3></div>
	<div class="container-fluid">

		<div class="mainSection col-sm-10">

			<h4><%=camp.getCampName()%></h4>
			<hr>

			<div>
			<b>장소 :</b> <span><%=camp.getCampLocation() %></span> &nbsp;
			<b>일시 :</b> <span><%=camp.getCampDate() %></span> &nbsp;
			<b>참여 가능 인원 :</b> <span id="capa"></span> / <%=camp.getCampCapa() %>
			
			</div>
			
			<!-- 가능하면 신청가능한 인원, 정원 표기 해보기 -->
			<hr>
			
			<div><%=camp.getCampContent() %></div>
			
			<div id="jBtn">
			<button id="joinBtn" onclick="check()">캠페인 참여하기</button>
			</div>
			<!-- 회원만 참여하기 가능 로그인확인-->
			<hr>
			
		</div>

	</div>
	
<script>

$(function(){
	capacity();
})

	function check(){
		
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
					$("#joinBtn").attr("disabled", "true");
				}
				
			},
			error: function(e){
				console.log(e);
			}
			
		})
		
	}


<%-- 참여가능 인원 : 참여가능인원 - 참여 인원count(campNo), 회원의 해당 캠페인 참여 여부 확인 
신청 인원이 다 찼을 경우 참여하기 버튼 비활성화 하기--%>	

<%--
$(function(){
	$("#joinBtn").click(function(){
		
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
				if(result == "success"){
					alert("참여가 완료되었습니다.")
				}else{
					alert("이미 참여한 캠페인입니다.")
				}
			},
			error: function(e){
				console.log(e);
			}
		})
		
		location.href="<%=contextPath%>/join.cam?campNo="+<%=camp.getCampNO()%>;
		<%}%>
		
		
	})
})
--%>

</script>

</body>
</html>