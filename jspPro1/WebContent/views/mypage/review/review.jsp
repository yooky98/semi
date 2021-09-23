
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kh.common.JDBCTemplate.*"%>
<%@ page import="com.kh.review.*"%>


<% 
	//파라미터 한글처리
	request.setCharacterEncoding("UTF-8"); 


		 
	 int tot = 0;
	 // Null값일때 형변환 하면 에러가나니.. 체크
	 if(request.getAttribute("tot") != null){
				 
		 tot = (Integer)request.getAttribute("tot");
		 
	 }

%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<%-- jQuery CDN --%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


<%-- BootStrap CDN --%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

<%-- JavaScript review_read 이벤트 처리 --%>
<script type="text/javascript">

	//글 번호를 가지고 있을 전역변수
	var G_review_num;

	function review_read(num) {
		
		<%-- review_read 서블릿 호출 --%>
		
			G_review_num = num;
		
			//파라미터
			var param = {
					
					review_num : num
			}
			
			
			//요청
			$.ajax({
				
				url : "review_read.credu",
				dataType : "text",
				data : param,
				type : "post",
				success : function(data) {
															
					$("#content").text(data);
										
				}
						
			});
			
			
	}
	
	
	function review_delete() {
		
		<%-- review_delete 서블릿 호출 --%>
		
			//파라미터
			var param = {
					
					review_num : G_review_num
			}
			
			
			//요청
			$.ajax({
				
				url : "review_delete.credu",
				dataType : "text",
				data : param,
				type : "post",
				success : function(data) {
									
					alert("삭제 되었습니다.");
					G_review_num = 0; //전역변수 초기화
					location.href = "review.credu";
						
				}
						
			});
			
	}

</script>

</head>
<body>
	<%-- review 리스트 서블릿 호출 --%>
	<c:url var="review_list" value="review_list.credu"></c:url>
	<%-- review 작성 서블릿 호출 --%>
	<c:url var="review_write" value="/review_write"></c:url>
	
	<%-- review 삭제 서블릿 호출 --%>
	<c:url var="review_delete" value="review_delete.credu"></c:url>
	<%@ include file="/views/common/menubar.jsp" %>
	<%@ include file="/views/common/mypageAside.jsp" %>
	
	
	
	  


	<div class="container">
		<div class="jumbotron">
			<h2>상품 Review</h2>
			<p>* 별점 및 리뷰 작성 후 작성하기 버튼을 클릭해 주세요.</p>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>ID</th>
					<th>TITLE</th>
					<th>상품번호</th>
					<th>구매여부</th>
					<th>별점</th>
					<th>작성일</th>
				</tr>
			</thead>

			<tbody>
				
				<c:forEach var="Review" items="${requestScope.list}">
				
				<tr class="info">
					<td>${Review.review_num}</td>
					<td>${Review.user_id}</td>
					<td><a data-toggle="modal" data-target="#myModal2" onclick="review_read(${Review.review_num})">${Review.review_title}</a></td>
					<td>${Review.prod_no}</td>
					
					<%-- 구매여부 1 : 구매O  0 : 구매X --%>
					<c:choose>
						
						<%-- if(a == 1){ --%>
						<c:when test="${Review.review_buy_opt == 1}">
							<td>O</td>
						</c:when>
						<%-- } else if(a == 0){ --%>
						<c:when test="${Review.review_buy_opt == 0}">
							<td>X</td>
						</c:when>
						
					</c:choose>
					
					<%-- 별점 --%>
					<c:choose>
						
						<%-- if(a == 1){ --%>
						<c:when test="${Review.review_star == 1}">
							<td>★☆☆☆☆</td>
						</c:when>
						<%-- if(a == 2){ --%>
						<c:when test="${Review.review_star == 2}">
							<td>★★☆☆☆</td>
						</c:when>
						<%-- if(a == 3){ --%>
						<c:when test="${Review.review_star == 3}">
							<td>★★★☆☆</td>
						</c:when>
						<%-- if(a == 4){ --%>
						<c:when test="${Review.review_star == 4}">
							<td>★★★★☆</td>
						</c:when>
						<%-- if(a == 5){ --%>
						<c:when test="${Review.review_star == 5}">
							<td>★★★★★</td>
						</c:when>
						
						
					</c:choose>
					
					<td>${Review.review_regdate}</td>
				</tr>
				
				</c:forEach>
			
			</tbody>
		</table>

		<div class="row">
			<div class="col-sm-6">
			
				<div style="text-align:left">
					<ul class="pagination" id="page_num">
						<li>
									
						
						 <% for(int i = 1 ; i<=tot ; i++){ %>
   						 
   						 <a href="review.credu?Page_num=<%=i%>"><%=i%></a>
  						 
  						 <% } %>
										
						</li>
					</ul>
				</div>
			
			
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-4 text-success" style="text-align: right;"> 
			<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Write</button>
			</div>
		</div>
		 
		
		 <!-- Modal -->
  	<div class="modal fade" id="myModal" role="dialog">
    	<div class="modal-dialog modal-lg">
    
      	<!-- Modal content-->
      	<div class="modal-content">
	        <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
        
        <div class="modal-body">
          
			<div class="panel-group">
			<div class="panel panel-success" style="margin-top: 10px;">
				<div class="panel-heading">Goods Review</div>
				<div class="panel-body">

					<%-- form --%>
					
					<form class="form-horizontal" role="form" action="${review_write}" method="post">

						<div class="form-group">
							<label class="control-label col-sm-2">작성자(ID):</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="user_id"
									name="user_id" placeholder="ID" >
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">제목:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="review_title"
									name="review_title" placeholder="Title">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">상품번호:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="prod_no"
									name="prod_no" placeholder="상품번호" >
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">내용:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="5"	placeholder="review_content" name="review_content" id="review_content"></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label><input type="checkbox" value="1"
										id="review_buy_opt" name="review_buy_opt" checked="checked">구매
										여부</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="radio">
								
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="1" checked="checked">★☆☆☆☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="2">★★☆☆☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="3">★★★☆☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="4">★★★★☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="5">★★★★★</label>
									
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-success">작 성</button>
								<button type="reset" class="btn btn-danger">초기화</button>
							</div>
						</div>
					</form>


				</div>

			</div>
		</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
  <!-- Modal2 _ read review -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Review Detail</h4>
        </div>
        <div class="modal-body">
                   	
          <textarea rows="10" class="form-control" readonly="readonly" id="content"></textarea>	
                    
        </div>
        <div class="modal-footer">
        						
          <button type="button" class="btn btn-danger" onclick="review_delete()">Delete</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        	
        </div>
      </div>
      
    </div>
  </div>
		
	</div>

<%@ include file="/views/common/footer.jsp"%>	

</body>
</html>