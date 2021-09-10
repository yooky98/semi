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
    	padding-bottom: 30px;
    	padding-left: 20px;
    	padding-right: 20px;
    	
    }
 	.qnaContent{
 		margin-left: 15%;
 		padding-left: 50px;
 	}
 	
 	#qnaBtn{
 		width: 100px;
 		background: rgb(158, 164, 107);
 		color: white;
 		border: none;
 		border-radius: 5px;
 		float: right;
		padding: 5px;
		font-weight: bolder; 	
 	}
 	
 	#qnaUpdate, #qnaDelete{
 		color: rgb(158, 164, 107);
 		font-weight: bolder;
 	}

    
</style>


</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

	<div class="container-fluid">

		<div class="row mainSection">
			<%@ include file="/views/common/mypageAside.jsp" %>

			<section class="qnaContent col-sm-10">
				<h4 id="title"><b>1:1문의</b></h4>
				<hr>
					<%if(qnaList.isEmpty()) {%>
						
						<div><%=message%></div>
						
					<%}else{%>
						<% for(QNA qna : qnaList){ %>
						
						<input id="quesNo" type="hidden" value="<%=qna.getQuesNo()%>">
						<div>
							<%=qna.getUserId() %> &nbsp;
							<%=qna.getQuesDate() %> &nbsp;
							
							<% if(qna.getAnsDate() == null) {%>
								<a id="qnaUpdate" href="<%=contextPath%>/updateForm.que?qno=<%=qna.getQuesNo()%>">수정 </a>/
							<%}%>
								<a id="qnaDelete" href="<%=contextPath%>/delete.que?qno=<%=qna.getQuesNo()%>">삭제</a>
						</div>
						
						<div>
							<b style="padding-right:10px"><%=qna.getQuesCategory()%></b>
							<%=qna.getQuesTitle()%>
						</div>
						
						<div>
							<%=qna.getQuesContent()%>
						</div>
						
						<%if(qna.getAnsDate()!=null){ %>
							<br>
							<div>
								<b style="color:orangered;">답변</b> &nbsp; <%=qna.getAnsDate() %>
							</div>
							
							<div>
								<%=qna.getAnsContent() %>
							</div>
						<%} %>
						<hr>
						
					<%} %>
				<%} %>
				<button id="qnaBtn">문의 작성</button>
			</section>
			
		</div>
	</div>
	
<script>

$(function(){
	$("#qnaBtn").click(function(){
		location.href="<%=request.getContextPath()%>/enrollForm.que";
	})

})

<%--
$("#qnaDelete").click(function(){
		
		var quesNo = $("#quesNo").val();
		var val = confirm("정말 삭제하시겠습니까?");
			
		if(val){
			locaton.href="<%=contextPath%>/delete.que?qno="+quesNo;
		}
	})
--%>

</script>


</body>
</html>