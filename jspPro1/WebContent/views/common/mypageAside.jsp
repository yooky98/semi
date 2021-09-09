<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
   .aside{
        background: rgb(239, 240, 227);
        height: 85vh;
        position: fixed;
        width: 15%;
        min-width: 150px;
       
        
    }
    
    .aside > ul{
    	margin: 10px;
  		padding: 0;
    	list-style: none;
    }
    
    .aside > ul > li{
    	
    	white-space: nowrap;
  		padding: 5px;
    	
    }
      
    .aside a{
    	
  		position: relative;
  		color: #888888;
  		font-size: 16px;
  		font-weight: 600;
    }
    
    .aside a:hover{
    	 color: #222222;
    }

</style>
<body>

	<aside class="aside col-sm-2">
		<ul>
			<li><a href="<%=request.getContextPath()%>/views/mypage/myPageMain.jsp">내 정보</a></li>
			<li><a href="<%=request.getContextPath()%>/views/mypagebuyList/buyList.jsp"">주문내역 조회</a></li>
			<li><a href="#">위시 리스트</a></li>
			<li><a href="<%=request.getContextPath()%>/views/mypage/review/review.jsp">리뷰 관리</a></li>
			<li><a href="<%=request.getContextPath()%>/list.que">1:1 문의</a></li>
			<li><a href="<%=request.getContextPath()%>/mypage.cam">참여 캠페인</a></li>
		</ul>
	</aside>


</body>
</html>