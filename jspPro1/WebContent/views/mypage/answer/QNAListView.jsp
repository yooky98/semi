<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.question.model.vo.QNA" %>
<% ArrayList<QNA> list = (ArrayList<QNA>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
aside {
	padding-top: 100px;
	writing-mode: horizontal-tb;
	background-color: yellowgreen;
}

section {
	padding-top: 100px;
	background-color: skyblue;
}

#adminWorkArea {
	height: 800px;
}

#adminWorkArea>aside>div>div>ul>li {
	background-color: yellowgreen;
	text-align: left;
	padding-left: 50px;
	border: 0;
	outline: 0;
}

#adminPageTitle {
	text-align: center;
}

#QNAListDiv {
	padding: 20px;
}

#QNAListTable {
	width: 100%;
	height: 600px;
	overflow: auto;
}
</style>
</head>
<body>

	<%@ include file="/views/common/menubar.jsp"%>

	<div class="container-fluid">
		<div class="row" id="adminWorkArea">

			<aside class="col-lg-3 col-md-3 col-sm-3 col-3 col-xl-3">
				<div>
					<br>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title" id="adminPageTitle">관리자페이지</h3>
						</div>
						<br> <br>
						<ul class="list-group">
							<li class="list-group-item"><a href="<%=request.getContextPath()%>/prodList.ad">제품 관리</a></li>
							<li class="list-group-item"><a href="<%=request.getContextPath()%>/answerList.ad">1:1 문의 답변</a></li>
							<li class="list-group-item"><a href="#">주문내역 관리</a></li>
						</ul>
					</div>
				</div>
			</aside>


			<section class="col-lg-9 col-md-9 col-sm-9 col-9 col-xl-9">

				<div id="QNAListDiv">

					<h3>1:1문의답변</h3>
					<div id="QNAListTable">
						<table border="1" style="width: 100%;">
							<thead>
								<tr>
									<th style="width: 15%;">문의유형</th>
									<th style="width: 50%;">제목</th>
									<th style="width: 15%;">회원 아이디</th>
									<th style="width: 15%;">문의 날짜</th>
									<th style="width: 5%;">상태</th>
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

</body>
</html>