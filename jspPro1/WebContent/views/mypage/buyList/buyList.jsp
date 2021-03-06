<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.kh.orderDetail.model.vo.OrderDetail"%>
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

<style>
    .prodImg{
	width: 50px;
	height: 50px;
}
    
    .mainSection{
    	padding-top: 90px;
    	padding-bottom: 90px;
    	padding-left: 20px;
    	padding-right: 20px;
    	
    }
        .treeBtn{
    	height: 40px;
    	width: 100px;
 		background: rgb(158, 164, 107);
 		color: white;
 		font-weight: bolder; 
 		border: none;
 		border-radius: 5px;
		padding: 5px;
		margin-top: 10px;
    }
   
 	.treeBtn:hover{
    	background: rgb(239, 240, 227);
 		color: rgb(158, 164, 107);
 		border: none;
    }
    
    .treeBtn:focus{
    	outline: none;
    }

table a:link {
	color: #666;
	font-weight: bold;
	text-decoration:none;
}
table a:visited {
	color: #999999;
	font-weight:bold;
	text-decoration:none;
}
table a:active,
table a:hover {
	color: #bd5a35;
	text-decoration:underline;
}
table {
	width:600px;
	font-family:Arial, Helvetica, sans-serif;
	color:#666;
	font-size:12px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	margin:20px;
	border:#ccc 1px solid;

	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;

	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
table th {
	padding:21px 25px 22px 25px;
	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;
	text-align: center;
	
	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
	background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}

table tr:first-child th:first-child {

	-moz-border-radius-topleft:3px;
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;
}
table tr:first-child th:last-child {
	-moz-border-radius-topright:3px;
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
}
table tr {
	text-align: center;
	padding-left:20px;
}
table td:first-child {
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding-left:20px;
	border-left: 0;
}
table td {

	padding:10px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;

	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
	background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table td.second {
  text-align:right;
	padding:18px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;

	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
	background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table tr.even td {
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
	background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
}
table tr:last-child td {
	border-bottom:0;
}
table tr:last-child td:first-child {
	-moz-border-radius-bottomleft:3px;
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
}
table tr:last-child td:last-child {
	-moz-border-radius-bottomright:3px;
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
}
table tr:hover td {
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
	background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);	
}
}
</style>

</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>
<%@ include file="/views/common/mypageAside.jsp" %>
<c:url var="review_write" value="/review_write"></c:url>


	<div class="container">

		<div class="jumbotron">
			<h2>???????????? ??????</h2>
		</div>
			

		<table style="width: 85%" class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>?????????</th>
					<th>?????????</th>
					<th>????????????</th>
					<th>??????</th>
					<th>?????? ??????</th>

				</tr>
			</thead>
	
			<tbody>
			 <% if(od_list.isEmpty()){ %>
                        <tr>
                        	<td colspan="6" align="center">?????? ????????? ???????????? ????????????.</td>
                        </tr>
                        <%
                        	}else{ 
                        		for(int i=0; i<od_list.size(); i++){
                        %>
                        
                          <tr>
                            <td><input id="orderDetailNo" type="hidden" value="<%=od_list.get(i).getOrderDetailNo() %>"><img src="<%=request.getContextPath()%>/resources/images/<%=od_list.get(i).getChangeName()%>" class="prodImg"></td>
                            <td><%=od_list.get(i).getProdName() %></td>
                            <td><%=od_list.get(i).getUserId() %></td>
                            <td><%=od_list.get(i).getOrdersDate() %></td>
                            <td><%=od_list.get(i).getOrdersAmount() %></td>
                           <td align="center" >

					<input type="hidden" name="state" >
					<% if(od_list.get(i).getOrdersStatus() == 1){
						
						%>
						<span>?????????</span>
					<%} else if(od_list.get(i).getOrdersStatus() == 2){
					%>
					<td>????????????</td>
					<%} else{ %>
					<td>????????????</td>
					<%} %>
                          </tr>
                          <tr>
				<td colspan="3" align="center">
					??? ?????? ?????? : <%=od_list.get(i).getOrdersPrice() * od_list.get(i).getOrdersAmount() %>
				</td>				
				<td colspan="2">
				<button type="button" class="treeBtn" data-toggle="modal" data-target="#myModal">?????? ??????</button>
				</td>
				<td>
				<button type="button" class="treeBtn"
				onclick="location.href='<%=contextPath%>/delete.buy?orderDetailNo=<%=od_list.get(i).getOrderDetailNo()%>'">??????</button>
				</td>
			</tr>	
		



		


	</tbody>
		</table>
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
							<label class="control-label col-sm-2">?????????(ID):</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="user_id"
									name="user_id" placeholder="ID" value="<%=od_list.get(i).getUserId() %>" >
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">??????:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="review_title"
									name="review_title" placeholder="Title">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">????????????:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="prod_no"
									name="prod_no" placeholder="????????????" value="<%=od_list.get(i).getProdNo() %>">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">??????:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="5"	placeholder="review_content" name="review_content" id="review_content"></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label><input type="checkbox" value="1"
										id="review_buy_opt" name="review_buy_opt" checked="checked">??????
										??????</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="radio">
								
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="1" checked="checked">???????????????</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="2">???????????????</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="3">???????????????</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="4">???????????????</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="5">???????????????</label>
									
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-success">??? ???</button>
								<button type="reset" class="btn btn-danger">?????????</button>
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


  
			
                          	<%} %>
                          <%} %>
                          </div>
</body>
</html>