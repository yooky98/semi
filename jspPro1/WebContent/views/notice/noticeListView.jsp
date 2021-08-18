<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.notice.model.vo.Notice"%>
    
<% 
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>
	.outer{
		width:800px;
		height:500px;
		background:black;
		color:white;
		margin:auto;
		margin-top:50px;
	}
	.listArea{
		border:1px solid white;
		text-align:center;
	}
	.searchArea{
		margin-top:50px;
	}
	
	.listArea>tbody>tr:hover{
		background:darkgrey;
		cursor:pointer
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	
	<div class="outer">
		<br>
		<h2 align="center">공지사항</h2>
		<br>
		        
		<table class="listArea" align="center">
			<thead>
				<tr>
					<th>글번호</th>
					<th width="300">글제목</th>
					<th width="100">작성자</th>
					<th>조회수</th>
					<th width="100">작성일</th>
				</tr>
			</thead>
			<tbody>
				<!-- 
				<tr>
					<td>3</td>
					<td>마지막 공지사항제목</td>
					<td>admin</td>
					<td>10</td>
					<td>2020-02-10</td>
				</tr>
				<tr>
					<td>2</td>
					<td>두번째 공지사항제목</td>
					<td>admin</td>
					<td>100</td>
					<td>2020-02-01</td>
				</tr>
				<tr>
					<td>1</td>
					<td>첫번째 공지사항 제목</td>
					<td>admin</td>
					<td>45</td>
					<td>2019-12-25</td>
				</tr>
				 -->
				 <% if(list.isEmpty()){ %>
				 	<tr>
						<td colspan="5">존재하는 공지사항이 없습니다.</td>
					</tr>
				 <% }else{  %>
				 	<% for(Notice n : list){ %>
				 		<tr>
				 			<td><%= n.getNoticeNo() %></td>
							<td><%= n.getNoticeTitle() %></td>
							<td><%= n.getNoticeWriter() %></td>
							<td><%= n.getCount() %></td>
							<td><%= n.getCreateDate() %></td>
				 		</tr>
				 	<% } %>
				 <% } %>
			</tbody>
			
		</table>
	
		<form class="searchArea" align="center">
			<select id="condition" name="condition">
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" name="search">
			<button type="submit">검색하기</button>
		</form>
		<br><br>
		<div align="center">
			<% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
			
			<button onclick="location.href='<%=contextPath%>/enrollForm.no'">작성하기</button> 
		<% } %>
		</div>
		
	</div>
	<script>
		<%if(!list.isEmpty()){%>
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				var nno = $(this).children().eq(0).text();
				
				location.href="<%=contextPath%>/detail.no?nno="+nno;
			})
		})
		
		<% } %>
		
	</script>
</body>
</html>