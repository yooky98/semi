<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.faq.model.vo.FAQ"%>
<%
	ArrayList<FAQ> list = (ArrayList<FAQ>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>FAQ</title>
<style>
/* faq 내용 들어가는 부분 */
#faqBody {
	width: 90%;
	margin: 0 auto;
}
/* 헤더 부분 */
.faqHeader {
	margin-bottom: 20px;
	text-align: center;
	font-weight: bolder;
}
/* 질문에 해당하는 영역 */
.card-header {
	cursor: pointer;
	background-color: white;
}
/* 질문 영역의 h5태그 테두리 제거 */
#faqTitle{
	border: none;
    outline: none;
}
/* 답변에 해당하는 영역 */
.card-body {
	margin: 15px;
}
/* category, faqQues : 질문 영역에 들어가는 부분 */
.faqCategory {
	display: inline-block;
	width: 200px;
	font-size: medium;
	font-weight: bolder;
}

.faqQues {
	display: inline-block;
	font-size: medium;
	font-weight: bolder;
	color: green;
}
</style>
</head>
<body>
	
	<%-- <%@ include file="../common/menubar.jsp" %> --%>	

	<section>
		<div class="container-fluid" id="faqContainer">

		<div class="faqHeader">
			<h4>FAQ(자주 묻는 질문들)</h4>
		</div>

		<%
			for (int i = 0; i < list.size(); i++) {
		%>
		<div id="faqBody">
		<div class="accordion" id="faqList<%=i%>">
			<div class="card ">
				<div class="card-header" id="heading<%=i%>">
					<h5 class="card-header" id="faqTitle" data-toggle="collapse" data-target="#collapse<%=i%>"
							aria-expanded="true" aria-controls="collapse<%=i%>">
						
							<div class="faqCategory">
								<span style="color: red;"><%=list.get(i).getFAQType()%></span>
							</div>
							<div class="faqQues">
								<span><%=list.get(i).getFAQQues()%></span>
							</div>
						
					</h5>
				</div>
				<div class="collapse" id="collapse<%=i%>"
					aria-labelledby="heading<%=i%>" data-parent="#faqList<%=i%>">
					<div class="card-body">
						<div class="faqContents">
							<p><%=list.get(i).getFAQAns()%></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<%
			}
		%>

	</div>
	</section>	

	<%-- <%@ include file="../common/footer.jsp" %> --%>	

</body>
</html>