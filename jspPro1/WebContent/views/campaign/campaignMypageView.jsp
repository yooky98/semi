<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h3>참여 캠패인</h3>

			<hr>

			<h6>강원 산불 피해 복구 숲 조성 캠패인</h6>
			장소 : <span>강원도 강릉시 옥계면 산불피해지</span> 일시 : <span>2021-08-19</span>
			<button>신청 취소</button>
			<hr>

			<h6>미세먼지 방지 실내 숲 조성 캠패인</h6>
			<hr>
			
		</div>

	</div>

<script>

<%--!list.isEmpty()--%>
<%if(true){%>
	$(function(){
		$(".mainSection>h6").click(function(){
			var campNo = $(this).val();
			<%--location.href= "<%=request.getContextPath()%>/?campNo="+campNo;--%>
			location.href="<%=request.getContextPath()%>/views/campaign/campaignDetailView.jsp";
		})		
	})
<%}%>

</script>

</body>
</html>