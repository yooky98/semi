<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.kh.question.model.vo.QNA" %>
<% QNA qna = (QNA)request.getAttribute("qna"); %>
<% System.out.println("jsp qna:"+qna); %>
<!DOCTYPE html>
<html id="htmlAt">
<head>
<meta charset="UTF-8">
<title>QNA Answer Form</title>
<style>


#QNAOuter {
	display: flex;
	justify-content: center;
}

#QNAAnswerForm {
	padding: 20px;
	width: 80%;
	height: 600px;
	background-color: white;
	overflow-y: scroll;
}

.question {
	width: 100%;
	overflow-y: auto;
}

#answer {
	width: 100%;
	resize: none;
	overflow-y: auto;
}

.btns button {
	width: 150px;
	margin-top: 20px;
}

.btns button:hover {
	background-color: green;
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

				<form action="updateAns.ad" method="POST">
					<div id="QNAOuter">

						<div id="QNAAnswerForm">
							<input type="hidden" name="qnaNo" value="<%=qna.getQuesNo()%>">
							<h3>1:1문의 답변</h3>
							<h5>
								<span>문의유형/</span><span><%=qna.getQuesCategory() %></span>
							</h5>
							<h5>
								<span>문의날짜/</span><span><%=qna.getQuesDate() %></span>
							</h5>
							<h5>
								<span>회원 아이디/</span><span><%=qna.getUserId() %></span>
							</h5>
							<br>
							<h5>제목</h5>
							<input class="question" type="text"
								value="<%=qna.getQuesTitle() %>" readonly> <br>
							<br>
							<h5>상세 내용</h5>
							<textarea class="question" style="resize: none;" cols="30" rows="6" readonly><%=qna.getQuesContent() %>
                        	</textarea>
							<br>
							<br>
							<h5 style="color: red;">답변</h5>
							<% if(qna.getAnsContent() == null){ %>
								<textarea name="answer" id="answer" cols="30" rows="10"></textarea>
							<%} else{ %>
								<textarea name="answer" id="answer" cols="30" rows="10"><%=qna.getAnsContent() %></textarea>
							<%} %>

						</div>

					</div>
					<div class="btns" align="center">
						<button type="button" onclick="goList();" style="margin-right: 100px;">취 소</button>
						<button type="submit" onclick="" style="margin-left: 100px;">확 인</button>
					</div>
				</form>

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