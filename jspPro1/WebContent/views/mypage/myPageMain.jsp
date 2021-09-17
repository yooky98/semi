<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.myGiftree.model.vo.Forest"%>
<%
	int count = (Integer)request.getAttribute("count");
	ArrayList<Forest> fList = (ArrayList<Forest>)request.getAttribute("forestList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
<!-- 카카오 지도 -->      
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06eb71c1421813889ecc4fbc8655acb0"></script>
       
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<style>
    
    .myGiftree .mainSection{
    	margin: auto;
 		margin-bottom: 20px;
 		padding: 120px 40px 30px 20px;
 		overflow-y: auto;
 		height: 100vh;
 		text-align: center;
    }
    
    .myGiftree .title{
    	margin: auto;
    	margin-bottom: 30px;
    }
    
    .myGiftree h3{
    	font-family: 'Gowun Batang', serif;
  		font-weight: 700;
    }
    
    .card{
		width: 20rem;
		height: 10rem;
    }
    
    .card-title, #forestListModalTitle{
    	font-family: 'Gowun Batang', serif;
    	font-weight: bolder;
    }
    
    .treeBtn{
    	height: 40px;
    	width: 200px;
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

</style>

</head>
<body>

<%@ include file="../common/menubar.jsp" %>

	<section class="myGiftree container-fluid">
		
		<div class="row flex-nowrap">	
		<%@ include file="../common/mypageAside.jsp" %>
			
			
			<div class="mainSection col-sm-7 ">
				
				<div class="title col-sm-12"><h3>My Giftree</h3></div>
				
				<div class="row cardSection">
					<div class="card col-sm-6 maypageCard ">
						<div class="card-body">
							<h5 class="card-title">후원한 나무</h5>
							<div class="treeNum card-text"><%=count%> 그루</div>
							<button type="button" class="treeBtn" data-toggle="modal" data-target="#forestListModal">후원한 숲 리스트</button>
						</div>
					</div>
					
					<div class="card col-sm-6 maypageCard ">
						<div class="card-body">
							<h5 class="card-title">보유포인트</h5>
							<div class="point"><%=loginUser.getPoint() %>p</div>
						</div> 
					</div>
				</div>
			</div>
		</div>
	</section>
	
<!-- Modal -->
<div class="modal fade" id="forestListModal" tabindex="-1" role="dialog" aria-labelledby="forestListModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="forestListModalTitle">후원한 숲 리스트</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<table class="table">
      		<thead class="thead-light">
	      		<tr>
	      			<th>숲 이름</th><th>위치</th><th>나무 수</th>
	      		</tr>
      		</thead>
      		
      		<%for(Forest forest : fList) {%>
      			<tr>
      				<td><%=forest.getForestName() %></td>
      				<td><a href="https://map.kakao.com/link/map/<%=forest.getForestSite()%>"><%=forest.getForestLocation() %></a></td>
      				<td><%=forest.getTreeQuantity() %></td>
      			</tr>
      		<%} %>
      	</table>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<%@ include file="/views/common/footer.jsp"%>

</body>
</html>