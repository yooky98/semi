<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.kh.question.model.vo.QNA" %>
<% QNA qna = (QNA)request.getAttribute("qna"); %>
<% System.out.println("jsp qna:"+qna); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA Answer Form</title>
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
							<li class="list-group-item"><a
								href="<%=request.getContextPath()%>/prodList.ad">제품 관리</a></li>
							<li class="list-group-item"><a
								href="<%=request.getContextPath()%>/answerList.ad">1:1 문의 답변</a></li>
							<li class="list-group-item"><a href="#">주문내역 관리</a></li>
						</ul>
					</div>
				</div>
			</aside>


			<section class="col-lg-9 col-md-9 col-sm-9 col-9 col-xl-9">

				<form action="" method="POST">
					<div id="QNAOuter">

						<div id="QNAAnswerForm">
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

							<textarea name="answer" id="answer" cols="30" rows="10"></textarea>

						</div>

					</div>
					<div class="btns" align="center">
						<button type="button" onclick="" style="margin-right: 100px;">취	소</button>
						<button type="submit" onclick="" style="margin-left: 100px;">확 인</button>
					</div>
				</form>

			</section>

		</div>
	</div>

	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>