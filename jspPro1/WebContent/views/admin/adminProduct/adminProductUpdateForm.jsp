<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.admin.adminProduct.model.vo.adminProduct, com.kh.product.model.vo.Attachment" %>
<%
	adminProduct ap = (adminProduct)request.getAttribute("ap");
	Attachment at = (Attachment)request.getAttribute("at");
	
	String category = ap.getProdCategory();
	String[] selected = new String[3];
	
	switch(category){
	case "대형" :
		selected[0]="selected";
		break;
	case "중형" :
		selected[1]="selected";
		break;
	case "소형" :
		selected[2]="selected";
		break;
	}
	
	String fileRoute = request.getContextPath() + "/resources/images/" + at.getChangeName();	
%>
<!DOCTYPE html>
<html id="htmlAt">
<head>
<meta charset="UTF-8">
<title>PRODUCT UPDATE PAGE</title>
<style>
/* section 전체 영역 */
.productUpdateArea {
	padding: 0 0 50px 0;	
}
/* section 전체 영역과 같음, 등록하기 위한 form 태그 */
#productUpdateForm {
	width: 100%;	
}
/* 테이블의 속하는 th(카테고리, 상품명, 가격 등) */
#productUpdateForm>table th {
	text-align: center;
	width: 15%;
	height: 50px;
}
/* 테이블에서 등록하기 위해 입력하는 input과 textarea */
#productUpdateForm>table input, #productUpdateForm>table textarea {
	width: 100%;
}
/* 테이블에서 등록하기 위해 입력하는 input과 textarea의 hover 속성 */
#productUpdateForm>table input[type="text"]:hover, #productUpdateForm>table textarea:hover
	{
	background: rgb(221, 218, 218);
}
/* 상품 이미지를 감싸고 있는 div 설정 */
#productUpdateForm>table #prodPicture{	
	width: 400px;
	height: 300px;
	border: 0;
}
/* 상품 이미지가 나타나는 img 태그 */
#titleImg{
	float:left;
	position: absolute;
	width: 400px;
	height: 300px;
	background-color: rgb(175, 175, 175);	
	
}
/* 상품 이미지의 button 태그 */
#imgBtn{
	position: absolute;
	padding: 0;
	border: 0;
	font-size: large;
	
	
	width: 400px;
	height: 300px;
	opacity: 0;
	
}
/* 상품 이미지의 button 태그 마우스 올렸을 때 투명도 조절 */
#imgBtn:hover{	
	opacity: 0.4;	
}
/* 상품 카테고리 select 태그*/
#prodCategory {
	clear: both;
	width: 100px;
}
/* 마지막에 취소, 확인 버튼 */
#bottomBtns button{
	width:150px;
	margin: 0 100px 0 100px;
	font-size: large;
}

#prodTable input, #prodTable textarea{
	border: none;
	background-color: rgb(251, 252, 248); 
}
#prodTable input:focus, #prodTable textarea:focus{
	
	background-color: white; 
}

</style>
</head>
<body id="bodyAt">
	<div class="wrapper">
		<%@ include file="/views/common/menubar.jsp"%>
	
		<div class="container-fluid" id="middleSection">
			<div class="row">
				<%-- 고정 리스트 --%>
				<%@ include file="/views/admin/adminCommon/adminAside.jsp" %>
	
				<%-- 작업 영역 --%>
				<section class="col-lg-9 col-md-9 col-sm-9 col-9 col-xl-9" id="adminSection">
	
					<div class="productUpdateArea">
						<h1 style="text-align: center;">제품 수정</h1>
						<br>
						<form id="productUpdateForm" action="updateProd.ad" method="post" onsubmit="" enctype="multipart/form-data"> <%-- onsubmit에 빈칸 관련 함수 작성할 것 --%>
							
							<input type="hidden" name="prodNo" value="<%=ap.getProdNo()%>">
							<input type="hidden" name="fileNo" value="<%=at.getFileNo()%>">
							<table class="table table-hover" id="prodTable">
								<tr>
									<th>기존 이미지<br>(클릭하여 새로 등록하세요.)</th>
									<td id="prodPictureArea">
										<div id="prodPicture">							
											
											<img id="titleImg" src="<%=fileRoute %>">
											<button class="btn btn-outline-dark" type="button" id="imgBtn" data-toggle="tooltip" data-placement="right" title="클릭하세요!">이미지 등록</button>
										
										</div>
										<div id="fileArea">
										
											<input type="file" name="titleImgFile" id="titleImgFile" 
												accept="image/*" onchange="loadImg(this);" required>
										
										</div>
									</td>
								</tr>
								
								<tr>
									<th scope="row"><label for="prodCategory"></label>카테고리 :</th>
									<td><select class="custom-select" name="prodCategory" id="prodCategory">
	
											<option value="대형" <%=selected[0] %>>대형</option>
											<option value="중형" <%=selected[1] %>>중형</option>
											<option value="소형" <%=selected[2] %>>소형</option>
									</select></td>
																	
									
								</tr>
								<tr>
									<th scope="row"><label for="prodName">상품명 : </label></th>
									<td><input class="form-control" id="prodName" type="text" name="prodName" value="<%=ap.getProdName() %>" onfocus="this.select()"
										placeholder="ex) 천연 가습기, 아디안텀" required></td>
									
								</tr>
								<tr>
									<th scope="row"><label for="prodPrice">상품 가격 : </label></th>
									<td><input class="form-control" id="prodPrice" type="text" name="prodPrice" value="<%=ap.getProdPrice() %>"
										placeholder="ex) 120000" onfocus="this.select()" required numberOnly></td>
								</tr>
								<tr>
									<th scope="row"><label for="prodAmount">재고 수량 : </label></th>
									<td><input class="form-control" id="prodAmount" type="text" name="prodAmount" value="<%=ap.getProdAmount() %>"
										placeholder="ex) 30" onfocus="this.select()" required numberOnly></td>
								</tr>
								<tr>
									<th scope="row" style="vertical-align: top;"><label for="prodDetail">상세 정보 : </label></th>
									<td><textarea class="form-control" name="prodDetail" id="prodDetail" onfocus="this.select()"
											cols="50" rows="10" style="resize: none;" placeholder="상세정보를 입력하세요." required><%=ap.getProdDetail() %></textarea>
									</td>
								</tr>
							</table>
	
							<br>
							<div class="btns" id="bottomBtns" align="center">
								<button class="btn btn-outline-danger" type="button" onclick="goList();">취&nbsp; 소</button>
								<button class="btn btn-outline-success" type="submit" onclick="checkFile();">수&nbsp; 정</button>
							</div>
						</form>
					</div>
	
				</section>
			</div>
		</div>
		
		<script>
			//툴팁 정의 함수
			$(function(){
				$('[data-toggle="tooltip"]').tooltip();
			})
			//취소 버튼 클릭 시 다시 제품 관리 페이지로 이동
			function goList(){
				location.href="<%=request.getContextPath()%>/prodList.ad";
			}
			//input 버튼 안보이게 설정
			$(function() {
				$("#fileArea").hide();
			});
			//img를 클릭 시 input이 작동되게 설정
			$("#prodPicture").click(function() {
				$("#titleImgFile").click();
			});
	
			function loadImg(titleImgFile) {
	
				if (titleImgFile.files.length == 1) {
					var reader = new FileReader();
	
					reader.readAsDataURL(titleImgFile.files[0]);
	
					reader.onload = function(e) {
						console.log(e);
						$("#titleImg").attr("src", e.target.result);
					}
				}			
	
			}
			
			//상품 가격, 재고 수량은 정규식으로 숫자만 입력할 수 있게함
			$("input:text[numberOnly]").on("keyup", function(){
	            $(this).val($(this).val().replace(/[^0-9]/g,""));
	        });
			//이미지 파일 미등록 시 등록하라는 알림 나오게 설정
			function checkFile(){
				var file = $("#titleImgFile").val();
	            //console.log(file)
	            if(file == ""){
	                alert("이미지를 등록하세요.")
	                return false;
	            }
			}
			
			
		</script>
		
	
		<%@ include file="/views/common/footer.jsp"%>
	</div>
</body>
</html>