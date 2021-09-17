<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.kh.order.model.vo.OrderDetail"%>
<%@page import="com.kh.product.model.vo.*"%>
<%@page import="java.util.ArrayList"%>

<%

	ArrayList<OrderDetail> od_list = (ArrayList<OrderDetail>) request.getAttribute("od_list");
	OrderDetail od = (OrderDetail) request.getAttribute("od");

%>

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
       <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
       
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
				<%@ include file="/views/common/mypageAside.jsp" %>


			<form method="post" name="detailFrm">

		<table style="width: 80%">

			 <% if(od_list.isEmpty()){ %>
                        <tr>
                        	<td colspan="7">주문 내역이 존재하지 않습니다.</td>
                        </tr>
                        <%
                        	}else{ 
                        		for(int i=0; i<od_list.size(); i++){
                        %>
                        
                          <tr>
                            <td><%=od_list.get(i).getOrderDetailNo() %></td>
                            <td><%=od_list.get(i).getProdName() %></td>
                            <td><%=od_list.get(i).getUserId() %></td>
                            <td><%=od_list.get(i).getOrdersDate() %></td>
                            <td><%=od_list.get(i).getOrderAmount() %></td>
                           
                          </tr>
                          	<%} %>
                          <%} %>

			<tr>

				<td colspan="4">

					총 결제 금액 : <%=(od.getOrdersAmount()) * od.getProdPrice() %>

				</td>

			</tr>	

			<tr>

				<td colspan="4">

					주문 상태 :

					<select name="state">

						<option value="1">배송중</option>

						<option value="2">배송완료</option>
						
						<option value="3">결제완료</option>

					</select>

					<script type="text/javascript">

						document.detailFrm.state.value = <%=od.getOrdersStatus() %>

					</script>

				</td>

			</tr>

			<tr>

		</table>

	</form>
		</div>
	</div>


</body>
</html>