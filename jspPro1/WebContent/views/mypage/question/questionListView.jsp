<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.question.model.vo.QNA"%>
<%
	ArrayList<QNA> qnaList = (ArrayList<QNA>)request.getAttribute("qnaList");

	

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
						
						<div><%=request.getAttribute("msg")%></div>
						
					<%}else{%>
						<% for(QNA qna : qnaList){ %>
						
					<table class="qnaTable">	
					<tr>
						<td><%= %></td>
						<td>2020-01-01</td>
						<td><a href="<%=request.getContextPath()%>/views/mypage/question/questionUpdateForm.jsp">수정</a>/<a href="#">삭제</a></td>
					</tr>

					<tr>
						<td><%=  %></td>
						<td colspan="2">배송문의 드립니다</td>
					</tr>

					<tr>
						<td colspan="3">언제쯤 배송되나요?</td>
					</tr>
					
					<tr>
						<td colspan="3" height=10px></td>
					</tr>

					<tr>
						<td>답변</td>
						<td colspan="2">2020-01-02</td>
					</tr>

					<tr>
						<td colspan="3">내용</td>
					</tr>
				</table>
				<hr>
				<%} %>

				<button onclick="location.href='<%=request.getContextPath()%>/views/mypage/question/questionEnrollForm.jsp'">문의 작성</button>
			</section>
			
		</div>
	</div>

</body>
</html>