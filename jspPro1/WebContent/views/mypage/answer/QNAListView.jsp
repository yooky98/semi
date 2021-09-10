<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.question.model.vo.QNA" %>
<% ArrayList<QNA> list = (ArrayList<QNA>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html id="htmlAt">
<head>
<meta charset="UTF-8">
<title>QNA List</title>
<style>
/* section 전체 영역 div */
#QNAListDiv {
	text-align: center;
	padding: 0 0 50px 0;
}

#QNAListTable {
	width: 100%;
	height: 600px;
	overflow: auto;
}
</style>
</head>
<body id="bodyAt">
	<div class="wrapper">
		<%@ include file="/views/common/menubar.jsp"%>
	
		<div class="container-fluid" id="middleSection">
			<div class="row">
	
				<%@ include file="/views/admin/adminCommon/adminAside.jsp" %>
	
				<section class="col-lg-9 col-md-9 col-sm-9 col-9 col-xl-9" id="adminSection">
	
					<div id="QNAListDiv">
	
						<h1>1:1문의답변</h1>
						<br>
						<div id="QNAListTable">
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th scope="col" style="width: 15%;">문의유형</th>
										<th scope="col" style="width: 50%;">제목</th>
										<th scope="col" style="width: 15%;">회원 아이디</th>
										<th scope="col" style="width: 15%;">문의 날짜</th>
										<th scope="col" style="width: 5%;">상태</th>
									</tr>
	
								</thead>
	
								<tbody>
									<% if(list.isEmpty()){ %>		
									<tr>
										<td colspan="5">문의가 존재하지 않습니다.</td>
									</tr>
									<% } else{
											
											for(int i=0; i<list.size(); i++){
												
												String answerStatus = "";
												if(list.get(i).getAnsContent() == null){
													answerStatus = "N";
												}else{
													answerStatus = "Y";
												}
												
									%>
									<tr>
										<td><%= list.get(i).getQuesCategory() %></td>
										<td><a href="#" id="qnaTitle<%=i+1%>"><%= list.get(i).getQuesTitle() %></a>
										<form action="" id="qnaNoForm" method="post">
											<input type="hidden" id="qnaNo" name="qnaNo">
										</form>
										
										<script>
											$(function(){
												$("#qnaTitle<%=i+1%>").click(function(){												
													var qnaNo = <%= list.get(i).getQuesNo() %>;
													$("#qnaNo").val(qnaNo);
													
													$("#qnaNoForm").attr("action", "<%=request.getContextPath()%>/answerForm.ad");
													$("#qnaNoForm").submit();
													
													console.log("qnaNo:"+qnaNo);
													
													
												})
											})
												
											
										</script>
										</td>
										
										<td><%= list.get(i).getUserId() %></td>
										<td><%= list.get(i).getQuesDate() %></td>
										<td><%= answerStatus %></td>
									</tr>
									
									<% 
											}
										} %>
								</tbody>
	
							</table>
						</div>
	
					</div>
	
				</section>
	
			</div>
		</div>
	
		<%@ include file="/views/common/footer.jsp"%>
	</div>
</body>
</html>