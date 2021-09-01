<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

 <!-- Latest compiled and minified CSS -->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
       <!-- jQuery library -->
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       <!-- Popper JS -->
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
       <!-- Latest compiled JavaScript -->
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
				<h4>1:1문의</h4>
				<hr>
				
				<form class="qnaEnroll" method="post" action="">
	                <select name="qnaCategory">
	                    <option value="" >문의유형</option>
	                    <option value="10">상품문의</option>
	                    <option value="20">배송문의</option>
	                    <option value="30">주문관련</option>
	                    <option value="40">기타</option>
	                </select>
	                <input name="qnaTitle" type="text" placeholder="제목">
	
	                <div>
	                    <textarea name="qnaContent" placeholder="내용을 입력해 주세요" style="resize:none;"></textarea>
	                </div>
	
	                <button type="submit">작성</button>
	                <button type="reset">취소</button>
            	</form>

			</section>
			
		</div>
	</div>


</body>
</html>