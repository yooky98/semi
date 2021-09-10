<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.util.ArrayList, com.kh.admin.adminProduct.model.vo.adminProduct"%>
<%
	ArrayList<adminProduct> list = (ArrayList<adminProduct>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html id="htmlAt">
<head>
<meta charset="UTF-8">
<title>ADMIN PRODUCT LIST</title>
<style>
/* section 전체 영역 div*/
#productList {
	text-align: center;
	padding: 0 0 50px 0;
}
/* 등록하기 버튼 위치 조정 */
#productList h6{
	text-align: right;
	padding-right: 20px;
}
/* 등록하기 버튼 */
#productList #enrollBtn{
	/*border: 5px double;*/
	border-radius: 20px;
	width: 130px;	
}
/* section에 들어가는 테이블 */
#productListTable {
	width: 100%;
}
/* 수정 버튼 */
#productListTable .modifyBtns{
	width: 70px;
	margin: 0 10px 0 10px;
	background-color: rgb(197, 228, 221);
    border: 2px outset;
    font-weight: bolder;
}
/* 삭제 버튼 */
#productListTable .deleteBtns{
	width: 70px;
	margin: 0 10px 0 10px;
	background-color: rgb(245, 223, 209);
    border: 2px outset;
    font-weight: bolder;
}
/* 테이블에 나타나는 상품명 */
#productListTable .prodName{
	text-decoration: none;
	cursor: pointer;	
	font-weight: bold;
	color: rgb(62, 165, 62);
}
/* 상품명에 마우스 올렸을 때 */
#productListTable .prodName:hover{
	cursor: pointer;
	font-weight: bolder;
	color: red;	
}


</style>
</head>
<body id="bodyAt">
	<div class="wrapper">
		<%@ include file="/views/common/menubar.jsp"%>
	
		<div class="container-fluid" id="middleSection">
			<div class="row">
				<%-- 고정 리스트 --%>
				<%@ include file="/views/admin/adminCommon/adminAside.jsp" %>
	
				<%-- 작업 영역 --%>
				<section class="col-lg-9 col-md-9 col-sm-9 col-9 col-xl-9" id="adminSection">
					<div id="productList">					
						<h1>제품 관리</h1>
						<h6>
							<button class="btn btn-primary" id="enrollBtn" onclick="location.href='<%=request.getContextPath()%>/enrollProductForm.ad'">등록하기</button>
						</h6>
						
						<table class="table" id="productListTable">
							<thead class="thead-dark">
								<tr>
									<th scope="col" width="20%">상품 번호</th>
									<th scope="col" width="10%">카테고리</th>
									<th scope="col" width="29%">상품명</th>
									<th scope="col" width="15%">가격</th>
									<th scope="col" width="10%">재고 수량</th>
									<th scope="col" width="16%">작업</th>
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
										<td><a class="prodName"><%=list.get(i).getProdName()%>
											<input type="hidden" value="<%=list.get(i).getProdNo()%>">
										</a></td>
										<td><%=list.get(i).getProdPrice()%></td>
										<td><%=list.get(i).getProdAmount()%></td>
										<td>										
											<button class="modifyBtns btn btn-outline-info" id="modiProdBtn<%=i+1 %>" onclick="updateProd<%=i+1%>();">수 정</button>
											<button class="deleteBtns btn btn-outline-danger" id="delProdBtn<%=i+1 %>" type="button" data-toggle="modal" data-target="#delProdModal<%=i+1 %>">삭 제</button>										
											<form action="" id="postForm<%=i+1 %>" method="post">
												<input id="prodNoInput<%=i+1 %>" type="hidden" name="prodNo">
											</form>										
											
											<div class="modal fade" id="delProdModal<%=i+1 %>" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h4 class="modal-title">정말로 <b>삭제</b>하시겠습니까?</h4>
											        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
											          <span aria-hidden="true">&times;</span>
											        </button>
											      </div>
											      <div class="modal-body">
											        <h6 style="text-align:left">No.<%=list.get(i).getProdNo()%>&nbsp;&nbsp;&nbsp;<%=list.get(i).getProdName()%></h6>
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
											        <button type="button" class="btn btn-outline-danger" onclick="deleteProd<%=i+1 %>();">삭제</button>
											      </div>
											    </div>
											  </div>
											</div>										
											
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
												$(function(){
													$(".prodName").click(function(){
														var pNo = $(this).children().val();
														console.log(pNo)
														<%-- java.sql.SQLSyntaxErrorException: ORA-00904: "PROD_NO": invalid identifier --%>
														location.href = "<%=request.getContextPath() %>/detail.pr?pNo=" + pNo;
													});
												});
												
												
												
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
	
	</div>
</body>
</html>