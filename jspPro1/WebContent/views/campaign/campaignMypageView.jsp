<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.Date, com.kh.campaign.model.vo.Campaign" %>
<%

	ArrayList<Campaign> joinList = (ArrayList<Campaign>)request.getAttribute("joinList");
	String message = (String)request.getAttribute("message");
	
	Date today = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage Campaign</title>

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
    
    .mypageCamp{
   		margin: auto;
 		margin-bottom: 20px;
 		padding: 120px 40px 30px 20px;
 		overflow-y: auto;
 		height: 100vh;
    }
    
    .mypageCamp::-webkit-scrollbar { 
		display: none; 
	}
	
	.mypageCamp h3, h5{
    	font-family: 'Gowun Batang', serif;
    }
    
    .mypageCamp th{
    	width: 130px;
    }

    #campName{
    	color: black;
    	font-size: 20px;
    	font-family: 'Gowun Batang', serif;
    }
    
    #campName:hover{
    	font-weight: bolder;
    }
    
    .mypageCamp button{
    	font-weight: bolder;
 		color: white;
 		width: 100px;
 		border: none;
 		border-radius: 5px;
		padding: 5px;
		margin: 5px;
    }
    
    .cancelBtn{
    	background: rgb(158, 164, 107);
    }
    
    .cancelBtn:hover{
 		background: rgb(239, 240, 227);
 		color: rgb(158, 164, 107);
 	}
    
    .doneBtn{
    	background: rgb(206, 205, 205);
    }
    
</style>

</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

	<section class="campSection container-fluid">
	
		<div class="row  flex-nowrap">
			<%@ include file="/views/common/mypageAside.jsp" %>
		
			<div class="mypageCamp col-sm-9">
			
				<h3><b>참여 캠페인</b></h3>
				<hr>
	
				<%if(joinList.isEmpty()) {%>
					<div><%=message%></div>
					
				<%}else{%>
				
					<%for(Campaign camp : joinList){%>
						<table>
							<tr>
								<th rowspan="2">
									<%if(today.before(camp.getCampDate())) {%>
										<%-- 버튼 태그를 id가 아닌 class로 주자 동적으로 여러개 만들 떄, 그래야 함수가 적용 --%>
										<button class="cancelBtn" value="<%=camp.getCampNO()%>">신청 취소</button>
									<%}else{ %>
										<button class="doneBtn" disabled>참여 완료</button>
									<%} %>
								</th>
								<td><a id="campName" href="<%=request.getContextPath()%>/detail.cam?campNo=<%=camp.getCampNO()%>"><%=camp.getCampName() %></a></td>
							</tr>
						
							<tr>
								<td>
									<b>장소 : </b><span><%=camp.getCampLocation() %></span> &nbsp;
									<b>날짜 : </b><span><%=camp.getCampDate() %></span> &nbsp;
								</td>
							</tr>
						</table>
						<hr>
					<%} %>
					
				<%} %>
				
			</div>
		</div>
	</section>

<%@ include file="/views/common/footer.jsp"%>

<script>

<%if(!joinList.isEmpty()){%>
	$(function(){
		
		$(".cancelBtn").on('click', function(){
			var campNo = $(this).val();
			location.href="<%=request.getContextPath()%>/deleteJoin.cam?campNo="+campNo;
		})
		
	})
<%}%>

</script>

</body>
</html>