<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.admin.adminOrder.model.vo.*" %>
<% ArrayList<adminOrderList> list = (ArrayList<adminOrderList>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Order List</title>
<style>
section{
            padding-top: 100px;
            background-color: skyblue;
            margin-top: 50px;
        }
        .orderOuter{
          display: flex;
          justify-content: center;
        }
        #orderListArea{
          background-color: white;
          width: 80%;
          height: 500px;
          overflow-y: auto;
          margin-top: 50px;          
        }
        #orderListArea>table{
          width: 100%;
        }
        #findOrder{
          display: flex;
          justify-content: right;
          margin-right: 50px;
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
			<section class="col-lg-9 col-md-9 col-sm-9 col-9 col-xl-9">
				<h3 style="text-align: center;">주문 관리</h3>
              <div id="findOrder">
                <select name="" id="">
                  
                  <option value="">주문번호</option>
                  <option value="">아이디</option>
                </select>
                <input type="text"><button>검색</button>
              </div>
              
                <div class="orderOuter">                  
                  <div id="orderListArea">
                      <table border="1">
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
                        <tbody>
                        <% if(list.isEmpty()){ %>
                        <tr>
                        	<td colspan="7">주문 내역이 존재하지 않습니다.</td>
                        </tr>
                        <%
                        	}else{ 
                        		for(int i=0; i<list.size(); i++){
                        %>
                        
                          <tr>
                            <td><%=list.get(i).getOrderDetailNo() %></td>
                            <td><%=list.get(i).getProdName() %></td>
                            <td><%=list.get(i).getUserId() %></td>
                            <td><%=list.get(i).getOrderDate() %></td>
                            <td><%=list.get(i).getOrderAmount() %></td>
                            <td>
                              <select name="delivery" id="delivery">
                                <option value="1">배송중</option>
                                <option value="2">배송완료</option>
                                <option value="3">결제완료</option>
                              </select>
                            </td>
                            <td><button type="button" id="modiDlvStatus">수정</button></td>
                          </tr>
                          	<%} %>
                          <%} %>
                        </tbody>
                        
                      </table>
                  </div>

                </div>
                <script>
                    $(function(){
                      $("#modiDlvStatus").click(function(){
                        var orderDetailNo = 1;
                        var selectResult = $("#delivery").val();

                        console.log(selectResult)

                        
                      });
                    });
                </script>
				

			</section>
		</div>
	</div>
	
	<script>
		
		
		
	</script>
	

	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>