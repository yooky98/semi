<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html id="htmlAt">
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<style>
/* section 전체 영역 */
.productEnrollArea {
	padding: 0 0 50px 0;
}
/* section 전체 영역과 같음, 등록하기 위한 form 태그 */
#productEnrollForm {
	width: 100%;
}
/* 테이블의 속하는 th(카테고리, 상품명, 가격 등) */
#productEnrollForm>table th {
	text-align: center;
	width: 15%;
	height: 50px;
}
/* 테이블에서 등록하기 위해 입력하는 input과 textarea */
#productEnrollForm>table input, #productEnrollForm>table textarea {
	width: 100%;
}
/* 테이블에서 등록하기 위해 입력하는 input과 textarea의 hover 속성 */
#productEnrollForm>table input[type="text"]:hover, #productEnrollForm>table textarea:hover
	{
	background: rgb(221, 218, 218);
}
/* 상품 이미지를 감싸고 있는 div 설정 */
#productEnrollForm>table #prodPicture{
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
</style>
</head>
<body id="bodyAt">
	<div class="wrapper">
		<%@ include file="/views/common/menubar.jsp"%>
	
		<div class="container-fluid" id="middleSection">
			<div class="row">
				<%-- 관리자 페이지 메뉴바 --%>
				<%@ include file="/views/admin/adminCommon/adminAside.jsp" %>

				<%-- 관리자 페이지 작업 영역 --%>
				<section class="col-xl-10 col-lg-10" id="adminSection">
					<%-- CONTENT --%>
					<div class="productEnrollArea">
						<h1 style="text-align: center;">제품 등록</h1>
						<br>
						<form id="productEnrollForm" action="enrollProduct.ad" method="post" enctype="multipart/form-data">
							<table class="table table-hover">								
								<tr>
									<th scope="row">상품 이미지</th>
									<td id="prodPictureArea">
										<div id="prodPicture">
											<img id="titleImg" >
												<button class="btn btn-outline-dark" type="button" id="imgBtn" data-toggle="tooltip" data-placement="right" title="클릭하세요!">이미지 등록</button>
										</div>
										<div id="fileArea">
											<input type="file" name="titleImgFile" id="titleImgFile" accept="image/*" onchange="loadImg(this);" required>
										</div>
									</td>									
								</tr>
								<tr>
									<th scope="row"><label for="prodCategory"></label>카테고리</th>
									<td>
										<select class="custom-select" name="prodCategory" id="prodCategory">	
											<option value="대형">대형</option>
											<option value="중형">중형</option>
											<option value="소형">소형</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="prodName">상품명</label></th>
									<td><input class="form-control" id="prodName" type="text" name="prodName" placeholder="ex) 천연 가습기, 아디안텀" required></td>									
								</tr>
								<tr>
									<th scope="row"><label for="prodPrice">상품 가격</label></th>
									<td><input class="form-control" id="prodPrice" type="text" name="prodPrice"	placeholder="ex) 120000" required numberOnly></td>
								</tr>
								<tr>
									<th scope="row"><label for="prodAmount">재고 수량</label></th>
									<td><input class="form-control" id="prodAmount" type="text" name="prodAmount" placeholder="ex) 30" required numberOnly></td>
								</tr>
								<tr>
									<th scope="row"><label for="prodDetail">상세 정보</label></th>
									<td>
										<textarea class="form-control" name="prodDetail" id="prodDetail" cols="50" rows="10" style="resize: none;" placeholder="상세정보를 입력하세요." required></textarea>
									</td>
								</tr>								
							</table>	
							<br>
							<div class="btns" id="bottomBtns" align="center">
								<button class="btn btn-outline-danger" type="button" onclick="goList();" >취&nbsp; 소</button>
								<button class="btn btn-outline-success" type="submit" onclick="checkFile();">확&nbsp; 인</button>
							</div>
						</form>
					</div>
						
				</section>
			</div>
		</div>
		
		<script>			
			$(function(){
				$('[data-toggle="tooltip"]').tooltip();
			});

			function goList(){
				location.href="<%=request.getContextPath()%>/prodList.ad";
			}
			
			$(function() {
				$("#fileArea").hide();
			});
			
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
			
			$("input:text[numberOnly]").on("keyup", function(){
	            $(this).val($(this).val().replace(/[^0-9]/g,""));
	        });

			function checkFile(){
				var file = $("#titleImgFile").val();
				
	            if(file == ""){
	            	$("#imgBtn").focus();
	                return false;
	            }
			}
			
		</script>		
	
		<%@ include file="/views/common/footer.jsp"%>
	</div>
</body>
</html>