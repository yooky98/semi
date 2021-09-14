<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.question.model.vo.QNA" %>
<% ArrayList<QNA> list = (ArrayList<QNA>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html id="htmlAt">
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>QNA List</title>
<style>
/* section 전체 영역 div */
#QNAListDiv {
	text-align: center;
	padding: 0 0 50px 0;
}
/* 문의답변 리스트가 담긴 table */
#QNAListTable {
	width: 100%;
	
}
/* 문의 제목 css 설정 */
#QNAListTable .qnaTitle{
	text-decoration: none;
	cursor: pointer;	
	font-weight: bold;
	color: black;
}
/* 상품명에 마우스 올렸을 때 */
#QNAListTable .qnaTitle:hover{
	cursor: pointer;
	font-weight: bolder;
	color: red;	
}
/* 답변 상태가 잘 보이도록 bold로 바꿔줌 */
.ansStatus{
	font-weight: bold;
}
</style>
</head>
<body id="bodyAt">
	<div class="wrapper">
		<%@ include file="/views/common/menubar.jsp"%>
	
		<div class="container-fluid" id="middleSection">
			<div class="row">
	
				<%@ include file="/views/admin/adminCommon/adminAside.jsp" %>
	
				<section class="col-xl-10 col-lg-10" id="adminSection">
	
					<div id="QNAListDiv">
	
						<h1>1:1 문의 답변</h1>
						<br><br>						
						<div id="QNAListTable">
							<h6 style="text-align: right;"><span style="color: green;"><b>Y</b>:답변 완료</span>&nbsp; <span style="color: red;"><b>N</b>:답변 미완료</span></h6>
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th scope="col" style="width: 13%;">문의유형</th>
										<th scope="col" style="width: 50%;">제목</th>
										<th scope="col" style="width: 15%;">회원 아이디</th>
										<th scope="col" style="width: 12%;">문의 날짜</th>
										<th scope="col" style="width: 10%;">상태</th>
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
									<tr class="QNArow<%=i+1%>">
										<td><%= list.get(i).getQuesCategory() %></td>
										<td><a href="#" class="qnaTitle" id="qnaTitle<%=i+1%>"><%= list.get(i).getQuesTitle() %></a>
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
											/* Status가 Y면 초록색, N이면 빨간색으로 표시 */	
											$(function(){
												var ansStatus = $(".QNArow<%=i+1%>").children().eq(4).text();
												console.log(ansStatus);
												
												if(ansStatus === "Y"){
													$(".QNArow<%=i+1%>").children().eq(4).css("color","green");
												}else{
													$(".QNArow<%=i+1%>").children().eq(4).css("color","red");
												}
											})
										</script>
										</td>
										
										<td><%= list.get(i).getUserId() %></td>
										<td><%= list.get(i).getQuesDate() %></td>
										<td class="ansStatus"><%= answerStatus %></td>
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