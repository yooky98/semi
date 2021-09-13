<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.kh.question.model.vo.QNA" %>
<% 
	QNA qna = (QNA)request.getAttribute("qna");
	String qnaContent = (qna.getQuesContent()).replaceAll("<br>", "\n");
%>
<!DOCTYPE html>
<html id="htmlAt">
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>QNA Answer Form</title>
<style>
/* section 전체 영역 div */
#QNAOuter {	
	padding: 0 0 50px 0;
	
}
/* 1:1문의 답변 전체 영역 */
#QNAAnswerForm {	
	width: 80%;
	margin: 0 auto;/*중앙 정렬*/	
	
}
#QNAAnswerForm input, #QNAAnswerForm textArea{
	font-weight: bold;
	background-color: white;
	border:0;
}

/* 답변을 입력하는 영역 textarea */
#answer {	
	resize: none;
	overflow-y: auto;
}

/* 마지막에 취소, 확인 버튼 */
#bottomBtns button{
	width:150px;
	margin: 0 100px 0 100px;
	font-size: large;
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
				<div id="QNAOuter">
					<form action="updateAns.ad" method="POST">						
	
						<div class="form-group" id="QNAAnswerForm">
							<input class="form-control" type="hidden" name="qnaNo" value="<%=qna.getQuesNo()%>">
							<h1 style="text-align:center;">1:1 문의 답변</h1>
							<br><br>
							<h5>
								<span><b>문의유형/</b></span><span><%=qna.getQuesCategory() %></span>
							</h5>
							<h5>
								<span><b>문의날짜/</b></span><span><%=qna.getQuesDate() %></span>
							</h5>
							<h5>
								<span><b>회원 아이디/</b></span><span><%=qna.getUserId() %></span>
							</h5>
							<br>
							<h5><b>제목</b></h5>
							<input class="form-control" type="text"
								value="<%=qna.getQuesTitle() %>" readonly> <br>
							<br>
							<h5><b>상세 내용</b></h5>							
							<textarea class="form-control" style="resize: none;" cols="30" rows="6" readonly><%=qnaContent %>
	                       	</textarea>
							<br>
							<br>
							<h5 style="color: red;"><b>답변</b></h5>
							<% if(qna.getAnsContent() == null){ %>
								<textarea class="form-control" name="answer" id="answer" cols="30" rows="10" required></textarea>
							<%} else{ %>
								<textarea class="form-control" name="answer" id="answer" cols="30" rows="10"><%=qna.getAnsContent() %></textarea>
							<%} %>
	
						</div>	
						<br>
						<div class="btns" id="bottomBtns" align="center">
							<button class="btn btn-outline-danger" type="button" onclick="goList();" >취&nbsp; 소</button>
							<button class="btn btn-outline-success" type="submit" >확&nbsp; 인</button> <%-- submit은 form에 action을 넣어서 거기 통해서 됨 --%>
						</div>
					</form>
				</div>
			</section>

		</div>
	</div>
	
	<script>
		function goList(){
			location.href="<%=request.getContextPath()%>/answerList.ad";
		}
		
	</script>

	<%@ include file="/views/common/footer.jsp"%>
</div>
</body>
</html>