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
    aside{
        background: rgb(239, 240, 227);
    }
    
    .mainSection{
    	padding-top: 90px;
    	padding-bottom: 90px;
    	padding-left: 20px;
    	padding-right: 20px;
    	
    }
    
</style>


</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

	<div class="container-fluid">

		<div class="row mainSection">
			<aside class="col-sm-2">
				<ul>
					<li><a href="<%=request.getContextPath()%>/views/mypage/myPageMain.jsp">내 정보</a></li>
					<li><a href="#">주문내역 조회</a></li>
					<li><a href="#">위시 리스트</a></li>
					<li><a href="#">리뷰 관리</a></li>
					<li><a href="<%=request.getContextPath()%>/list.qe">1:1 문의</a></li>
					<li><a href="#">참여 캠페인</a></li>
				</ul>
			</aside>

			<section class="col-sm-10">
				<h4>1:1문의</h4>
				<hr>
					<%if(qnaList.isEmpty()) {%>
						
						<div><%=message%></div>
						
					<%}else{%>
						<% for(QNA qna : qnaList){ %>
						
						<table class="qnaTable">	
						<tr>
							<td><%=qna.getUserId() %></td>
							<td><%=qna.getQuesDate() %></td>
							
							<% if(qna.getAnsDate() == null) {%>
								<td><a href="<%=contextPath%>/updateForm.que?qno=<%=qna.getQuesNo()%>">수정</a>/<a class="delete" href="<%=contextPath%>/delete.que?qno=<%=qna.getQuesNo()%>">삭제</a></td>
							<%}else{ %>
								<td><a class="delete" href="<%=contextPath%>/delete.que?qno=<%=qna.getQuesNo()%>">삭제</a></td>
							<%} %>
						
						</tr>
	
						<tr>
							<td><%=qna.getQuesCategory()%></td>
							<td colspan="2"><%=qna.getQuesTitle()%></td>
						</tr>
	
						<tr>
							<td colspan="3"><%=qna.getQuesContent()%></td>
						</tr>
						
						<tr>
							<td colspan="3" height=10px></td>
						</tr>
	
						<%if(qna.getAnsDate()!=null){ %>
							<tr>
								<td><b>답변</b></td>
								<td colspan="2"><%=qna.getAnsDate() %></td>
							</tr>
		
							<tr>
								<td colspan="3"><%=qna.getAnsContent() %></td>
							</tr>
						<%} %>
						</table>
						<hr>
					<%} %>
				<%} %>
				<button onclick="location.href='<%=request.getContextPath()%>/views/mypage/question/questionEnrollForm.jsp'">문의 작성</button>
			</section>
			
		</div>
	</div>
	
<%-- 
<script>
	$(function(){
		$("#delete").click(function(){
			var val = confirm("정말 삭제하시겠습니까?");
			
			if(val){
				locaton.href="<%=contextPath%>/delete.que?qno=<%=qna.getQuesNo()%>";
			}
		})
	})

</script> --%>

</body>
</html>