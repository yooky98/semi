<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.faq.model.vo.FAQ"%>
<% 
	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.category{
        display: inline-block;
        width: 200px;
        font-size: medium;
        font-weight: bolder;
    }
    .faqques{
        display: inline-block;
        color: green;
    }
    .card-header{
        cursor: pointer;
    }
    .card-block{
        margin: 15px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="container">
            
        <div class="" id="faqList">
            <div class="faqHeader">FAQ(Frequently Asked Questions)</div>
            
            <% for(int i=0; i<list.size(); i++){ %>
            
            	<div class="card ">
	                <div class="card-header" data-toggle="collapse" data-parent="#faqList" href="#faq<%=i%>">
	                    
	                        <a class="faqList-toggle collapsed" >
	                            <div class="category"> <span style="color: red;">일반문의</span></div>
	                            <div class="faqques"> <%= list.get(i).getFAQQues() %></div>
	                        </a>
	                   
	                </div>
	                <div id="faq<%=i%>" class="panel-collapse collapse">
	                    <div class="card-block">
	                        <p><%= list.get(i).getFAQAns() %></p>
	                    </div>
	                </div>
	            </div>	            
            
            <% } %>
            
            
            
    
            
        </div>
    </div>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>