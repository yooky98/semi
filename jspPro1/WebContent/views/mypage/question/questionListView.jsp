<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.question.model.vo.QNA"%>
<%
	ArrayList<QNA> qnaList = (ArrayList<QNA>)request.getAttribute("qnaList");
	String message = (String)request.getAttribute("message");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA</title>

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

 	.qnaContent{
 		margin: auto;
 		margin-bottom: 20px;
 		padding: 120px 40px 30px 20px;
 		overflow-y: auto;
 		height: 100vh;
 		
 	}
 	
 	.qnaContent div{
 		margin-top: 5px;
 		font-size: 14px;
 	}
 	
	.qnaContent::-webkit-scrollbar { 
		display: none; 
	}
	
 	#quesTitle{
		font-size: 15px;
	}
 	
 	.qnaList #title{
 		font-family: 'Gowun Batang', serif;
 	}
 	
 	#qnaBtn{
 		width: 100px;
 		background: rgb(158, 164, 107);
 		color: white;
 		font-weight: bolder; 
 		border: none;
 		border-radius: 5px;
 		float: right;
		padding: 5px;
 	}
 	
 	#qnaBtn:hover{
 		background: rgb(239, 240, 227);
 		color: rgb(158, 164, 107);
 	}
 	
 	#qnaUpdate, #qnaDelete{
 		color: #b6b3b3;
 		font-size: 14px;
 		font-weight: bolder;
 	}

 	
 	#qnaUpdate:hover, #qnaDelete:hover{
 		color: black;
 	}

	#answer{
		color:rgb(255, 136, 0);
	}

</style>


</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

	<section class="qnaList">

		<div class="row flex-nowrap container-fluid">	
		
		<%@ include file="/views/common/mypageAside.jsp" %>

			<div class="qnaContent col-sm-9" role="main">
				
				<div id="title">
					<h3><b>1:1문의</b></h3>
				    Customer Center : 080-1234-5687<br>
				        평일 10:00 ~ 17:00
				</div>
				<hr>
					<%if(qnaList.isEmpty()) {%>
						
						<div><%=message%></div>
						
					<%}else{%>
						<% for(QNA qna : qnaList){ %>
						
						<input id="quesNo" type="hidden" value="<%=qna.getQuesNo()%>">
						<div>
							<%=qna.getUserId() %> &nbsp;
							<%=qna.getQuesDate() %> &nbsp;
							
							<% if(qna.getAnsContent() == null) {%>
								<a id="qnaUpdate" href="<%=contextPath%>/updateForm.que?qno=<%=qna.getQuesNo()%>">수정 </a>| 
							<%}%>
								<a id="qnaDelete" href="<%=contextPath%>/delete.que?qno=<%=qna.getQuesNo()%>">삭제</a>
						</div>
						
						<div id="quesTitle">
							<b><%=qna.getQuesCategory()%></b>&nbsp;
							<%=qna.getQuesTitle()%>
						</div>
						
						<div><%=qna.getQuesContent()%></div>
						
						<%if(qna.getAnsContent()!=null){ %>
							<br>
							<div><b id="answer">답변</b> &nbsp; <%=qna.getAnsDate() %></div>
							<div><%=qna.getAnsContent() %></div>
						<%} %>
						<hr>
						
						<%} %>
					<%} %>
				<button id="qnaBtn">문의 작성</button>
			</div>
			
		</div>
		
	</section>
	
<%@ include file="/views/common/footer.jsp"%>	
<script>

$(function(){
	$("#qnaBtn").click(function(){
		location.href="<%=request.getContextPath()%>/enrollForm.que";
	})

})

</script>


</body>
</html>