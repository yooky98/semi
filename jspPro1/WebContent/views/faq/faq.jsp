<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.faq.model.vo.FAQ"%>
<%
	ArrayList<FAQ> list = (ArrayList<FAQ>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html id="htmlAt">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/adminAside.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>FAQ</title>
<style>
/* FAQ에서는 padding 다시 설정(좌,우) */
#middleSection{
	padding-left:0;
	padding-right:0;
}
/*FAQ에서는 aside와 같은 색상으로 따로 지정*/
#adminSection{
	background-color: rgb(239, 240, 227);
}
/* 타이틀 부분인 h1 태그 들어가는 div */
.faqHeader {
	margin-bottom: 20px;
	text-align: center;
	font-weight: bolder;
}
/* FAQ 목록이 들어가는 전체 영역 div*/
#faqBody {
	width: 80%;
	padding-bottom: 120px;
	margin: 0 auto;/*중앙 정렬*/
}
/* 질문 각각을 나타내는 영역 div*/
#faqBody>.accordion>.card>.card-header{
	padding: 8px 11px 8px 11px;
 	background: linear-gradient(to bottom, white, #eaeaea);
 	/*background: white;*/
}
/* 질문 영역의 h5태그 테두리 제거 */
#faqBody h5{
	width: 100%;
	height:100%;
	border: none;
    outline: none;
    display:table;
    font-size: 1rem;
    background: none;
    padding-right:0;
    cursor: pointer;
}
/* FAQ 각 항목 영역 */
#faqBody .card{
	/*border: 2px solid #dbdbdb;*/
	border-radius:0;
}
/* FAQ 카테고리 부분 */
.faqCategory {
	display: table-cell;
	width: 22%;
	color: rgb(8, 132, 235);
	font-weight: bolder;	
}
/* FAQ 질문 부분 */
.faqQues {
	display: table-cell;
	width:78%;
	padding-right:20px;
	font-weight: bolder;
}
/* FAQ 아이콘 부분 */
.faqIcon{
	display: inline-block;	
}
/* 답변에 해당하는 영역 */
#faqBody .card-body {
	margin: 15px;
}
/* FAQ 소개 문구 폰트 변경 */
.faqTop{
	font-family: 'Jua', sans-serif;
}
/* 화면 크기에 따라 FAQ 타이틀, 각 항목들의 폰트 크기 변경 */
@media screen and (max-width:992px){
	.faqHeader h1{
		font-size: 1.8rem;
	}
	.faqHeader h3{
		font-size: 1.2rem;
	}
	.faqCategory, .faqQues{
		font-size: 0.9rem;
	}
}
@media screen and (max-width:768px){
	.faqHeader h1{
		font-size: 2rem;
	}
	.faqHeader h3{
		font-size: 1.3rem;
	}
	.faqCategory, .faqQues{
		font-size: 1rem;
	}
}
</style>
</head>
<body id="bodyAt">
	<div class="wrapper">
		<%@ include file="../common/menubar.jsp" %>		
			<div class="container-fluid" id="middleSection">
				<section id="adminSection">
					<div class="faqHeader">
						<h1 class="faqTop">FAQ</h1>
						<br>
						<h3 class="faqTop">궁금한 점은 이 곳에서 해결하세요.</h3>
						<br>
					</div>
					<div id="faqBody">
					<%
					if(list.isEmpty()){
					%>
						<div>
						<h3>리스트가 존재하지 않습니다.</h3>
						</div>
					<%
					}else{		
					
						for (int i = 0; i < list.size(); i++) {
					%>
			
						<div class="accordion" id="faqList<%=i%>">
							<div class="card ">
								<div class="card-header" id="heading<%=i%>">
									<h5 class="card-header" id="faqTitle<%=i%>" data-toggle="collapse" data-target="#collapse<%=i%>" aria-expanded="false" aria-controls="collapse<%=i%>">						
										<span class="faqCategory"><%=list.get(i).getFAQType()%></span>
										<span class="faqQues"><%=list.get(i).getFAQQues()%></span>
										<span class="faqIcon"><i id="icon<%=i%>" class="fa fa-caret-down" aria-hidden="true"></i></span>
									</h5>
								</div>
								<div class="collapse" id="collapse<%=i%>" aria-labelledby="heading<%=i%>" data-parent="#faqList<%=i%>">
									<div class="card-body">
										<div class="faqContents">
											<p><%=list.get(i).getFAQAns()%></p>
										</div>
									</div>
								</div>								
							</div>
						</div>
						<script>
							$("#faqTitle<%=i%>").click(function(){
		                        var iconClick = $(this).attr("aria-expanded");
		                        
		                        if(iconClick=="false"){                            
		                        	$("#icon<%=i%>").removeClass("fa-caret-down").addClass("fa-caret-up");
		                        }else{
		                        	$("#icon<%=i%>").removeClass("fa-caret-up").addClass("fa-caret-down");		                            
		                        }
		                    });
						</script>
					<%
						}
					}
					%>
				</div>
			</section>
		</div>		
	
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>