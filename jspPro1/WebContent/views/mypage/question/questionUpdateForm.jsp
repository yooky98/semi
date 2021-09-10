<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.question.model.vo.QNA, java.util.ArrayList, com.kh.question.model.vo.QnaCategory" %>
<% 

	QNA qna = (QNA)request.getAttribute("qna");
	ArrayList<QnaCategory> cateoryList = (ArrayList<QnaCategory>)request.getAttribute("cateoryList");

	String selected = qna.getQuesCategory();
	
	
%>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


 <!-- Latest compiled and minified CSS -->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
       <!-- jQuery library -->
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       <!-- Popper JS -->
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
       <!-- Latest compiled JavaScript -->
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
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
    
    #qnaEnroll{
    	width: 90%;
    	margin: auto;
    
    }
    
    #qnaTitle{
    	width: 100%;
    	

    }
    
    #qnaContent{
    	width: 100%;
    }
    
    #inputTitle{
    	margin-top: 5px;
    	margin-bottom: 5px;
    }
    
    #submitBtn{
    	background: rgb(158, 164, 107);
 		color: white;
 		width: 70px;
 		border: none;
 		border-radius: 5px;
 		float: right;
		padding: 5px;
		margin: 5px;
		font-weight: bolder;
    }
    
    #resetBtn{
    	color: rgb(158, 164, 107);
 		width: 70px;
 		border: none;
 		border-radius: 5px;
 		float: right;
		padding: 5px;
		margin: 5px;
		font-weight: bolder;
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
					<li><a href="<%=request.getContextPath()%>/views/mypage/question/questionListView.jsp">1:1 문의</a></li>
					<li><a href="#">참여 캠페인</a></li>
				</ul>
			</aside>

			<section class="col-sm-10">

				<form id="qnaEnroll" method="post" action="<%=request.getContextPath()%>/update.que" onsubmit="return categoryValidate()">
					<h4>1:1문의</h4>
					<hr>
					
					<input name="qno" type="hidden" value="<%=qna.getQuesNo()%>">
	                <select id="qnaCategory" name="qnaCategory">
	                    <option value="">문의유형</option>
	                    
	                    <%for(QnaCategory category : cateoryList) {%>
	                    	<%if(selected.equals(category.getCategoryName())) {%>
	                    		<option value="<%=category.getCategoryNo()%>" selected><%=category.getCategoryName()%></option>
	                    	<%}else{ %>
	                    		<option value="<%=category.getCategoryNo()%>"><%=category.getCategoryName()%></option>
	                    	<%} %>
	                    <%} %>
	                    
	                </select>
	                
	                <div id="inputTitle">
	                	<input id="qnaTitle" name="qnaTitle" type="text" value="<%= qna.getQuesTitle() %>" required>
	               </div>
	               
	                <div >
	                    <textarea id="qnaContent" name="qnaContent" rows="15" style="resize:none;" required><%= qna.getQuesContent() %></textarea>
	                </div>
	                
					<button id="submitBtn" type="submit">수정</button>
	                <button id="resetBtn" type="reset">취소</button>
	                
            	</form>

			</section>
			
		</div>
	</div>
<script>

function categoryValidate(){
	var categoryVal = $("#qnaCategory").val();
	
	if(categoryVal == ""){
		alert("문의 유형을 선택해 주세요");
		return false;
	}
}

</script>

</body>
</html>