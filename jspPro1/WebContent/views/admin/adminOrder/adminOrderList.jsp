<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.admin.adminOrder.model.vo.*" %>
<% 
ArrayList<adminOrderList> list = (ArrayList<adminOrderList>)request.getAttribute("list");
ArrayList<adminOrder> orderList = (ArrayList<adminOrder>)request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html id="htmlAt">
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<title>주문내역 관리</title>
<style>
/* section 전체 영역 div */
#orderListArea{
	text-align: center;
	/*min-height: 100%; */
	padding: 0 0 50px 0;
}
/* 검색창을 포함하고 있는 div */
#orderListArea > #searchArea{
	float: right;
	width: 25em;
}
/* 검색 카테고리 선택하는 select 태그 */
#searchArea > #searchOption{
	width:2.500em;
}
/* 검색 내용 입력하는 input[text] 태그 */
#searchArea > #searchTitle{
	width:3.750em;
}
/* 주문 내역이 들어가는 테이블 바깥 div */
.orderOuter{
 	clear : both;
    display: flex;
    justify-content: center;
}
/* 주문 내역이 들어가는 table */
#orderListTable{
	width: 100%;
	/*overflow-y: auto;*/
	margin-top: 30px; /*검색 창이랑 거리 조절*/
}
/* 수정 버튼 */
#orderListTable td>button{
	width: 70px;
	margin: 0 10px 0 10px;
	background-color: rgb(197, 228, 221);
    border: 2px outset;
    font-weight: bolder;
}
/* 모달 창의 취소, 삭제 버튼 */
#orderListTable .modal .modal-footer>button{
	width:80px;
}

/* 주문 상세정보 modal 관련 스타일 */
#orderModal{
	height: 700px;
}                
#orderDetailInfo{
	width: 100%;
	height: 42%;
	padding: 0;
	border: 2px solid gray;
	margin-bottom: 10px;
	text-align: center;
	display: table;
}
#orderTotalInfo{
	width: 100%;
	height: 58%;
	padding: 0;
	border: 2px solid gray;
	border-radius: 20px;
	margin-top: 10px;
	display: table;
}
.orderInfo{
	display: table-cell;
	width: 33%;
	height: 100%;
	padding: 12px;
	
	text-align: left;
}
.orderInfo>h6{
	padding-bottom: 10px;
	border-bottom: 1px solid gray;
}
#orderInfo1, #orderInfo2{
	padding-left: 14px;
	border-left: 2px solid gray;
}
.callOrderInfo{
	text-decoration: none;
	font-weight: bold;
	color: black;
}
.callOrderInfo:hover{
	text-decoration: none;
	font-weight: bolder;
	color:red;
}
#orderModal span{
	font-weight: bold;
}
</style>
</head>
<body id="bodyAt">
<div class="wrapper">
	<%@ include file="/views/common/menubar.jsp"%>
	<div class="container-fluid" id="middleSection">
		<div class="row">
			<%-- 관리자 페이지 메뉴바 --%>
			<%@ include file="/views/admin/adminCommon/adminAside.jsp" %>

			<%-- 관리자 페이지 작업 영역 --%>
			<section class="col-xl-10 col-lg-10" id="adminSection">
				<div id="orderListArea">
					<h1>주문 관리</h1>
					
					<%-- 검색창 --%>
					<div class="input-group" id="searchArea" >
					  <select class="form-select form-select" id="searchOption">
						  <option selected>선택</option>
						  <option value="10">주문상세번호</option>
						  <option value="20">회원아이디</option>
					  </select>
					  <input type="text" class="form-control" id="searchTitle">
					  <button class="btn btn-primary" onclick="searchFunction();" type="button">검색</button>
					</div>

					<script type="text/javascript">
						function checkTitle(searchTitle){
				            var checkNum = /[0-9]/;
				            var result = true;
				            for(var i=0; i<searchTitle.length; i++){ 
				                if(searchTitle.charAt(i).search(checkNum) == -1){
				                  result = false;
				                  break;
				                }
				              }	
				              return result;
				        }
					
						function searchFunction(){
							var searchOption = Number($("#searchOption").val());
							var searchTitle = $("#searchTitle").val();							
							var result = checkTitle(searchTitle);
							
				            $("tbody tr").hide();
				            
							switch(searchOption){
								case 10 :
									if(result == true){
						                searchNo(searchTitle);					               
						                break;
						            }else{
						                alert("숫자만 입력해주세요")
						                $("#searchTitle").val("");
						                $("tbody tr").show();
						                break;
						            }				              
								case 20 :
								if(searchTitle != ""){
									searchId(searchTitle);					            
						            break;
								}else{
									$("tbody tr").show();
									break;
								}								
								default :
								if(searchTitle == ""){								
									$("tbody tr").show();
									break;
								}else{
									alert("카테고리를 선택해주세요.");
									$("#searchTitle").val("");
									$("tbody tr").show();
									break;
								}
							}
						}
						
						function searchNo(searchTitle){							
							<%for(int i=0; i<list.size(); i++){%>							
								var orderDetailNo = String(<%=list.get(i).getOrderDetailNo()%>);				            
					            
								if(orderDetailNo.indexOf(searchTitle) > -1){
					              $("#orderDetailNo<%=i+1%>").parent().show();
					            }
				            <%}%>
						}

						function searchId(searchTitle){							
							<%for(int i=0; i<list.size(); i++){%>
					            var userId = "<%=list.get(i).getUserId()%>";
					            
								if(userId.indexOf(searchTitle) > -1){
					              $("#userId<%=i+1%>").parent().show();
					            }
							<%}%>
						}						
					</script>

                <div class="orderOuter">
                  <div id="orderListTable">
                      <table class="table">
                        <thead class="thead-dark">
                          <tr>
                            <th scope="col" style="width: 15%;">주문상세번호</th>
                            <th scope="col" style="width: 25%;">상품명</th>
                            <th scope="col" style="width: 13%;">회원 아이디</th>
                            <th scope="col" style="width: 15%;">주문일자</th>
                            <th scope="col" style="width: 9%;">수량</th>
                            <th scope="col" style="width: 12%;">주문상태</th>
                            <th scope="col" style="width: 11%;">비고</th>
                          </tr>
                        </thead>
                        <tbody>
                        	<%if(list.isEmpty()){ %>
	                        <tr>
	                        	<td colspan="7">주문 내역이 존재하지 않습니다.</td>
	                        </tr>
                        	<%}else{
                        		ArrayList<adminOrder> newList = new ArrayList<adminOrder>();
                        		String[] selected = new String[3];
                        		
                        		for(int i=0; i<list.size(); i++){
                        			int orderStatus = list.get(i).getOrdersStatus();
                        			String orderStatusName = "";
                        			
                        			switch(orderStatus){
                        			case 1 :
                        				selected[0]="selected";
                        				selected[1]="";
                        				selected[2]="";
                        				orderStatusName="결제완료";
                        				break;
                        			case 2 :
                        				selected[0]="";
                        				selected[1]="selected";
                        				selected[2]="";
                        				orderStatusName="배송중";
                        				break;
                        			case 3 :
                        				selected[0]="";
                        				selected[1]="";
                        				selected[2]="selected";
                        				orderStatusName="배송완료";
                        				break;
                        			}
                        			
                        			int orderNo = list.get(i).getOrderNo();                        			
                        			
                        			for(int j=0; j<orderList.size(); j++){
                        				if(orderNo == orderList.get(j).getOrderNo()){
                        					newList.add(orderList.get(j));
                        					break;
                        				}
                        			}
                        			
                        	%>                        
	                          <tr>
	                            <td id="orderDetailNo<%=i+1%>">
	                            	<a class="callOrderInfo" type="button" data-toggle="modal" data-target="#orderInfoModal<%=i%>"><%=list.get(i).getOrderDetailNo()%></a>
	                            	<%-- 주문 상세번호 클릭 시 주문 정보(상세정보+전체정보)를 담은 modal을 불러온다. --%>
	                            	<div class="modal fade" id="orderInfoModal<%=i%>" tabindex="-1" aria-hidden="true">
					                    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
					                      <div class="modal-content">
					                        <div class="modal-header">
					                          <h5 class="modal-title">주문 정보</h5>
					                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                            <span aria-hidden="true">&times;</span>
					                          </button>
					                        </div>
					                        <div id="orderModal" class="modal-body">
					                            <%-- 주문 상세정보 --%>
					                            <h5><b>주문 상세정보</b></h5>
					                            <div id="orderDetailInfo">
					                                <div class="orderInfo">
					                                <h6>주문 상세번호 : <span><%=list.get(i).getOrderDetailNo() %></span></h6><br>
					                                <h6>주문 번호 : <span><%=list.get(i).getOrderNo() %></span></h6><br>
					                                <h6>상품 번호(상품명) : <span><%=list.get(i).getProdNo() %>(<%=list.get(i).getProdName() %>)</span></h6><br>
					                                <h6>회원 아이디 : <span><%=list.get(i).getUserId() %></span></h6><br>
					                                </div>
					                                <div class="orderInfo" id="orderInfo1">
					                                <h6>주문 수량 : <span><%=list.get(i).getOrderAmount() %></span></h6><br>
					                                <h6>주문 금액 : <span><%=list.get(i).getOrdersPrice() %></span> 원</h6><br>
					                                <h6>주문 상태 : <span><%=orderStatusName %></span></h6><br>
					                                <h6>숲 이름 : <span><%=list.get(i).getForestName() %></span></h6><br>
					                                </div>
					                            </div>
					                            <br><hr><br>
					                            <%-- 주문 전체 정보 --%>
					                            <h5><b>주문 전체정보</b></h5>
					                            <div id="orderTotalInfo">
					                                <div class="orderInfo">
					                                    <h6>주문번호 : <span><%=newList.get(i).getOrderNo() %></span></h6><br>
					                                    <h6>회원 아이디 : <span><%=newList.get(i).getUserId() %></span></h6><br>
					                                    <h6>회원명 : <span><%=newList.get(i).getOrderName() %></span></h6><br>
					                                    <h6>전화번호 : <span><%=newList.get(i).getOrderPhone() %></span></h6><br>
					                                    <h6>주문날짜 : <span><%=newList.get(i).getOrderDate() %></span></h6><br>                                    
					                                </div>
					                                <div class="orderInfo" id="orderInfo2">
					                                    <h6>배송주소 : <span><%=newList.get(i).getOrderAddress() %></span></h6><br>
					                                    <h6>배송메시지 : <span><%=newList.get(i).getOrderMessage() %></span></h6><br>					                                    
					                                    <h6>총 결제금액 : <span><%=newList.get(i).getOrderTotalPrice() %></span> 원</h6><br>
					                                </div>
					                            </div>
					                        </div>
					                        <div class="modal-footer">
					                          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫 기</button>
					                        </div>
					                      </div>
					                    </div>
					                  </div>
	                            </td>
	                            <td><%=list.get(i).getProdName() %></td>
	                            <td id="userId<%=i+1%>"><%=list.get(i).getUserId() %></td>
	                            <td><%=list.get(i).getOrderDate() %></td>
	                            <td><%=list.get(i).getOrderAmount() %></td>
	                            <td>
		                            <select class="custom-select" name="delivery" id="delivery<%=i+1%>">
			                            <option value="1" <%=selected[0] %>>결제완료</option>
			                            <option value="2" <%=selected[1] %>>배송중</option>
			                            <option value="3" <%=selected[2] %>>배송완료</option>
		                            </select>
	                            </td>
	                            <td>
		                            <button class="btn btn-outline-primary" type="button" onclick="currentStatus<%=i+1%>();" data-toggle="modal" data-target="#modiOrderStatus<%=i+1%>">수 정</button>
		                            <div class="modal fade" id="modiOrderStatus<%=i+1%>" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">주문상태를 <b>수정</b>하시겠습니까?</h4>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												</div>
												<div class="modal-body">
													<h6 style="text-align:left"><b>- 주문상세번호 : <%=list.get(i).getOrderDetailNo() %><br><br>- 변경 전 : <%=orderStatusName%><br><br>- 변경 후 : <span class="currentStatus"></span></b></h6>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-outline-secondary" data-dismiss="modal" onclick="cancelModify<%=i+1%>();">취 소</button>
													<button type="button" class="btn btn-outline-danger" onclick="modifyOrder<%=i+1%>();">수 정</button>
												</div>
											</div>
										</div>
									</div>
	
		                            <script>
		                            function cancelModify<%=i+1%>(){
		                            	var cancelNum = <%=list.get(i).getOrdersStatus()%>;
		                            	
		                            	window.location.reload();
		                            }
		                            
		                            function currentStatus<%=i+1%>(){
		                              	var currentStatus = $("#delivery<%=i+1%>").val();
		                              	var finalStatus = "";
		                              	
		                              	switch(currentStatus){
		                              	case "1" :
		                              		finalStatus="결제완료";
		                              	break;
		                              	case "2" :
		                              		finalStatus="배송중";
		                                break;
		                              	case "3" :
		                              		finalStatus="배송완료";
		                                break;
		                              	}
		                              	
		                              	$(".currentStatus").html(finalStatus);
		                            }
		                            
		                            function modifyOrder<%=i+1%>(){
		                            	var orderDetailNo = <%=list.get(i).getOrderDetailNo()%>;
				                        var selectResult = $("#delivery<%=i+1%>").val();
	
				                        location.href = "<%=request.getContextPath() %>/orderUpdate.ad?orderDetailNo=" + orderDetailNo + "&selectResult=" + selectResult;
		                            }
		                			</script>
	                			</td>
	                          </tr>
                          	<%
                          		}
                        	}
                        	%>
                        </tbody>
                      </table>
                  </div>
                </div>
			</div>
			</section>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</div>
</body>
</html>