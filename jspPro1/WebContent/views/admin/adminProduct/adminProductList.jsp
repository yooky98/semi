<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.util.ArrayList, com.kh.admin.adminProduct.model.vo.adminProduct"%>

<%
	ArrayList<adminProduct> list = (ArrayList<adminProduct>) request.getAttribute("list");
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
<title>ADMIN PRODUCT LIST</title>
<style>
#adminWorkArea {
	height: 800px;
}

#adminPageTitle {
	text-align: center;
}

aside {
	padding-top: 100px;
	background-color: yellowgreen;
}

section {
	padding-top: 100px;
	background-color: skyblue;
}

#adminWorkArea>aside>div>div>ul>li {
	background-color: yellowgreen;
	text-align: left;
	padding-left: 50px;
	border: 0;
	outline: 0;
}

#productListTable {
	text-align: center;
	padding: 20px;
}

#productList {
	width: 100%;
}

.modifyBtns {
	width: 70px;
	margin-right: 10px;
}

.deleteBtns {
	width: 70px;
	margin-left: 10px;
}
</style>
</head>
<body>

	<%@ include file="/views/common/menubar.jsp"%>

	<div class="container-fluid">
		<div class="row" id="adminWorkArea">
			<%-- 고정 리스트 --%>
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

			<%-- 작업 영역 --%>
			<section class="col-lg-9 col-md-9 col-sm-9 col-9 col-xl-9">
				<div id="productListTable">
					<br><br>
					<h3>제품 관리</h3>
					<h6 style="text-align: right; padding-right: 20px;">
						<button onclick="location.href='<%=request.getContextPath()%>/enrollProductForm.ad'"
						 style="background-color: yellowgreen;">등록하기</button>
					</h6>
					
					<table border="1" id="productList">
						<thead>
							<tr>
								<th width="20%">상품 번호</th>
								<th width="10%">카테고리</th>
								<th width="29%">상품명</th>
								<th width="15%">가격</th>
								<th width="10%">재고 수량</th>
								<th width="16%">작업</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (list.isEmpty()) {
							%>
							<tr>
								<td colspan="6">상품이 존재하지 않습니다.</td>
							</tr>
							<%
								} else {
									
							%>
								<%
									for (int i = 0; i < list.size(); i++) {
									
									
								%>
								<tr>
									<td id="prodNo<%=i+1%>"><%=list.get(i).getProdNo()%></td>
									<td><%=list.get(i).getProdCategory()%></td>
									<td><%=list.get(i).getProdName()%></td>
									<td><%=list.get(i).getProdPrice()%></td>
									<td><%=list.get(i).getProdAmount()%></td>
									<td>										
										<button class="modifyBtns" id="modiProdBtn<%=i+1 %>" onclick="updateProd<%=i+1%>();">수 정</button>
										<button class="deleteBtns" id="delProdBtn<%=i+1 %>" type="button" data-toggle="modal" data-target="#delProdModal<%=i+1 %>">삭 제</button>										
										<form action="" id="postForm<%=i+1 %>" method="post">
											<input id="prodNoInput<%=i+1 %>" type="hidden" name="prodNo">
										</form>										
										
										<div class="modal" id="delProdModal<%=i+1 %>">
									        <div class="modal-dialog">
									            <div class="modal-content">
									                <div class="modal-header">
									                    <h4 class="modal-title">정말로 삭제하시겠습니까?</h4>
									                    <button type="button" class="close" data-dismiss="modal">&times;</button>
									                </div>
									
									                <div class="modal-body"><h6 style="text-align:left">No.<%=list.get(i).getProdNo()%>&nbsp;&nbsp;&nbsp;<%=list.get(i).getProdName()%></h6></div>
									
									                <div class="modal-footer">
									                    <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
									                    <button class="btn btn-outline-danger" onclick="deleteProd<%=i+1 %>();">삭제</button>
									                </div>
									
									            </div>
									        </div>
									
									    </div>
										
										
										
										<script>
											var prodNo = Number($("#prodNo<%=i+1%>").html());
											$("#prodNoInput<%=i+1 %>").val(prodNo);
				                            
											<%-- 
				                            console.log($("#prodNo<%=i+1%>").html())
				                            console.log(prodNo)
				                            
				                            console.log($("#prodNoInput<%=i+1 %>").val())
											--%>
											
											function updateProd<%=i+1%>(){
				                            	
												$("#postForm<%=i+1 %>").attr("action", "<%=request.getContextPath()%>/updateProdForm.ad");
												$("#postForm<%=i+1 %>").submit();
											}
											
											function deleteProd<%=i+1 %>(){
												$("#postForm<%=i+1 %>").attr("action", "<%=request.getContextPath()%>/deleteProd.ad");
												$("#postForm<%=i+1 %>").submit();
											}
										</script>
												
									</td>
									
								</tr>
								<%
									
									}
								%>
								
							<%
							
								}
							%>
							
						</tbody>
					</table>
				</div>

			</section>
		</div>
	</div>
	
	<%@ include file="/views/common/footer.jsp"%>


</body>
</html>