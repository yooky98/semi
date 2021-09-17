<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.question.model.vo.QnaCategory"%>
<%

	ArrayList<QnaCategory> cateoryList = (ArrayList<QnaCategory>)request.getAttribute("cateoryList");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA</title>

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

    
    .quesEnroll{
    	margin: auto;
 		margin-bottom: 20px;
 		padding: 120px 40px 30px 20px;
 		overflow-y: auto;
 		height: 100vh;
    	
    }
    
    .quesEnroll::-webkit-scrollbar { 
		display: none; 
	}
    
    #qnaTitle,  #qnaContent{
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
    
    #submitBtn:hover{
 		background: rgb(239, 240, 227);
 		color: rgb(158, 164, 107);
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
    
     #resetBtn:hover{
 		background: #b6b3b3;
 		color: white;
 	}
    
    #title{
 		font-family: 'Gowun Batang', serif;
 	}
    
</style>

</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

	<section class="enrollSection">

		<div class="row container-fluid">
		
		<%@ include file="/views/common/mypageAside.jsp" %>

			<div class="quesEnroll col-sm-9">

				<form method="post" action="<%=request.getContextPath()%>/enroll.que" onsubmit="return categoryValidate()">
	               
	                <h3 id="title"><b>1:1문의</b></h3>
					<hr>
					
	                <select id="qnaCategory" name="qnaCategory">
	                    <option value=''>문의유형</option>
	                    <%for(QnaCategory category : cateoryList) {%>
	                    	<option value="<%=category.getCategoryNo()%>"><%=category.getCategoryName()%></option>
	                    <%} %>
	                </select>
	                
	                <div id="inputTitle">
	               		<input id="qnaTitle" name="qnaTitle" type="text" placeholder="제목" required>
					</div>
					
	                <div>
	                    <textarea id="qnaContent" name="qnaContent" placeholder="내용을 입력해 주세요" rows="15" style="resize:none;" required></textarea>
	                </div>
	                
	                <button id="submitBtn" type="submit">작성</button>
	                <button id="resetBtn" type="button" onclick="location.href='<%=contextPath%>/list.que'">취소</button>
	               
            	</form>

			</div>
			
		</div>
	</section>
	
<%@ include file="/views/common/footer.jsp"%>
<script>

function categoryValidate(){
	var categoryVal = $("#qnaCategory").val();
	
	if(categoryVal == ""){
		alert("문의 유형을 선택해 주세요");
		$("#qnaCategory").focus();
		return false;
	}
}

</script>

</body>
</html>