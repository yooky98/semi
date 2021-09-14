<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
   .myAside{
        background: rgb(239, 240, 227);
        width: 15%;
        min-width: 170px;
        height: 100vh - 40px;
        margin: 100px 0px 40px 20px;
        padding: 20px
        
    }
    
    .myAside > ul{
    	margin: 10px;
  		padding: 0;
    	list-style: none;
    }
    
    .myAside > ul > li{
    	white-space: nowrap;
  		padding: 5px;
    }
      
    .myAside a{
  		color: #888888;
  		font-size: 18px;
  		font-weight: 600;
  		font-family: 'Gowun Batang', serif;
    }
    
    .myAside a:hover{
    	font-size: 18px;
    	color: #222222;
    }
    

</style>
<body>

	<aside class="myAside col-sm-2" >
		<ul>
			<li><a href="<%=request.getContextPath()%>/views/mypage/myPageMain.jsp">마이 기프트리</a></li>
			<li><a href="<%=request.getContextPath()%>/views/mypage/buyList/buyList.jsp">주문내역 조회</a></li>
			<li><a href="<%=request.getContextPath()%>/views/mypage/wish/wishList.jsp">위시 리스트</a></li>
			<li><a href="<%=request.getContextPath()%>/review.credu">리뷰 관리</a></li>
			<li><a href="<%=request.getContextPath()%>/list.que">1:1 문의</a></li>
			<li><a href="<%=request.getContextPath()%>/mypage.cam">참여 캠페인</a></li>
		</ul>
	</aside>


</body>
</html>