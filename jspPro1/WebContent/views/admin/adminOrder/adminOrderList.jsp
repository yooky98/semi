<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.admin.adminOrder.model.vo.*" %>
<% 
ArrayList<adminOrderList> list = (ArrayList<adminOrderList>)request.getAttribute("list");
String contextPath1 = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- bootstrap 5.1 버전 CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" ></script>
<title>Admin Order List</title>
<style>
		section{
            padding-top: 100px;
            background-color: skyblue;
            margin-top: 200px;
            
        }
        .orderOuter{
          clear : both;
          display: flex;
          justify-content: center;
        }
        #orderListArea{
          background-color: white;
          width: 80%;
          height: 500px;
          overflow-y: auto;
          margin-top: 30px;          
        }
        #orderListArea>table{
          width: 100%;
        }        
        #searchArea{
        	float:right;
        	width:390px;
        	margin-right : 10%; <%--orderListArea width가 80%이므로 좌우 margin이 각각 10%--%>
        }
        #searchTitle{
        	width:60px;
        }
        
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>

	<div class="container-fluid">
		<div class="row" id="adminWorkArea">
			<%-- 고정 리스트 --%>
			<%@ include file="/views/admin/adminCommon/adminAside.jsp" %>

			<%-- 작업 영역 --%>
			<section class="col-lg-9 col-md-9 col-sm-9 col-9 col-xl-9 mt-4">
				<h3 style="text-align: center;">주문 관리</h3>
				
				<div class="input-group" id="searchArea" >
				  <select class="form-select form-select pr-0" id="searchOption">
				  <option selected>선택</option>
				  <option value="10">주문상세번호</option>
				  <option value="20">회원아이디</option>
				 
				  </select>
				  <input type="text" class="form-control" id="searchTitle">
				  <button class="btn btn-primary" onclick="searchFunction();" type="button">검색</button>
				</div>						
				
				<script type="text/javascript">
					function checkTitle(searchTitle){
			            var checkNum = /[0-9]/ ;
			            var result = true;
			            for(var i=0; i<searchTitle.length; i++){
			                console.log(i+"번째 : " + searchTitle.charAt(i).search(checkNum));
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
			            console.log("결과값 : " + result)
						
						console.log(searchOption);
						console.log(searchTitle);
						
			            $("tbody tr").hide();           
			            
						switch(searchOption){
						case 10 :
							if(result == true){
				                searchNo(searchTitle);
				                console.log("10실행")
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
				            console.log("20실행")
				            break;
						}else{
							$("tbody tr").show();
							break;
						}						  
							
						default :
						if(searchTitle == ""){
							console.log("카테고리 : 선택")
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
			            console.log("orderDetailNo : " + orderDetailNo);			            
			            console.log("indexof : "+orderDetailNo.indexOf(searchTitle));
			            if(orderDetailNo.indexOf(searchTitle) > -1){
			              $("#orderDetailNo<%=i+1%>").parent().show();
			            }
			            <%}%>
					}
								
					function searchId(searchTitle){
						
						<%for(int i=0; i<list.size(); i++){%>
			            var userId = "<%=list.get(i).getUserId()%>";
			            
			            console.log("userId : " + userId);			            
			            console.log("indexof : "+userId.indexOf(searchTitle));
						if(userId.indexOf(searchTitle) > -1){
			              $("#userId<%=i+1%>").parent().show();
			            }
						<%}%>
					}
					
				</script>
              
                <div class="orderOuter">                  
                  <div id="orderListArea">
                      <table id="orderTable" border="1">
                        <thead>
                          <tr>
                            <th style="width: 18%;">주문상세번호</th>
                            <th style="width: 29%;">상품명</th>
                            <th style="width: 16%;">회원 아이디</th>
                            <th style="width: 15%;">주문일자</th>
                            <th style="width: 5%;">수량</th>
                            <th style="width: 12%;">주문상태</th>
                            <th style="width: 5%;">비고</th>
                          </tr>
                        </thead>
                        <tbody id="searchTable">
                        <% if(list.isEmpty()){ %>
                        <tr>
                        	<td colspan="7">주문 내역이 존재하지 않습니다.</td>
                        </tr>
                        <%
                        	}else{ 
                        		
                        		
                        		String[] selected = new String[3];
                        		
                        		for(int i=0; i<list.size(); i++){
                        			int dlvStatus = list.get(i).getOrdersStatus();
                        			
                        			switch(dlvStatus){
                        			case 1 :
                        				selected[0]="selected";
                        				selected[1]="";
                        				selected[2]="";
                        				break;
                        			case 2 :
                        				selected[0]="";
                        				selected[1]="selected";
                        				selected[2]="";
                        				break;
                        			case 3 :
                        				selected[0]="";
                        				selected[1]="";
                        				selected[2]="selected";
                        				break;
                        			}
                        %>
                        
                          <tr>
                            <td id="orderDetailNo<%=i+1%>"><%=list.get(i).getOrderDetailNo() %></td>
                            <td><%=list.get(i).getProdName() %></td>
                            <td id="userId<%=i+1%>"><%=list.get(i).getUserId() %></td>
                            <td><%=list.get(i).getOrderDate() %></td>
                            <td><%=list.get(i).getOrderAmount() %></td>
                            <td>
                              <select class="deliverOption" name="delivery" id="delivery<%=i+1%>">
                                <option value="1" <%=selected[0] %>>배송중</option>
                                <option value="2" <%=selected[1] %>>배송완료</option>
                                <option value="3" <%=selected[2] %>>결제완료</option>
                              </select>
                            </td>
                            <td><button type="button" id="modiDlvStatus<%=i+1%>">
                            		수정
                            		
                            		</button>
                            		
                            <script type="text/javascript">
		                    	$(function(){
		                    		$("#modiDlvStatus<%=i+1%>").click(function(){
		                    			var orderDetailNo = <%=list.get(i).getOrderDetailNo()%>;
				                        var selectResult = $("#delivery<%=i+1%>").val();                     
				                        				                      
				                        console.log(orderDetailNo) 
				                        console.log(selectResult)		                    							                        
				                        
		                    			location.href = "<%=request.getContextPath() %>/orderUpdate.ad?orderDetailNo=" + orderDetailNo + "&selectResult=" + selectResult;                  			
				             
		                    		})
		                    	})
                			</script></td>
                            
                          </tr>
                          
                          	<%} %>
                          <%} %>
                        </tbody>
                        
                        
                      </table>
                  </div>

                </div>
                
				

			</section>
		</div>
	</div>
	
	<script>
		
		
		
	</script>
	

	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>