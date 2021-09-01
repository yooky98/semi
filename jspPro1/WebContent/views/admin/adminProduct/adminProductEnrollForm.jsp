<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODUCT ENROLL PAGE</title>
<style>
aside {
	padding-top: 100px;
	background-color: yellowgreen;
}



#adminWorkArea {
	height: 800px;
}

#adminWorkArea>aside>div>div>ul>li {
	background-color: yellowgreen;
	text-align: left;
	padding-left: 50px;
	border: 0;
	outline: 0;
}

#adminPageTitle {
	text-align: center;
}

section {
	padding-top: 100px;
	background-color: skyblue;
}

.productEnrollArea {
	padding: 30px;
}

#productEnrollForm>table {
	width: 100%;
	background: white;
}

#productEnrollForm>table th {
	text-align: center;
	width: 15%;
	height: 50px;
}

#productEnrollForm>table input, #productEnrollForm>table textarea {
	width: 100%;
}

#productEnrollForm>table input[type="text"]:hover, #productEnrollForm>table textarea:hover
	{
	background: rgb(221, 218, 218);
}

#prodCategory {
	width: 80px;
}

#prodPicture {
	border: 1px solid red;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>

	<div class="container-fluid">
		<div class="row" id="adminWorkArea">
			<%-- 고정 리스트 --%>
			<aside class="col-lg-3 col-md-3 col-sm-3 col-3 col-xl-3">
				<div>
					<br>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title" id="adminPageTitle">관리자페이지</h3>
						</div>
						<br> <br>
						<ul class="list-group">
							<li class="list-group-item"><a href="<%=request.getContextPath()%>/prodList.ad">제품 관리</a></li>
							<li class="list-group-item"><a href="#">1:1 문의 답변</a></li>
							<li class="list-group-item"><a href="#">주문내역 관리</a></li>
						</ul>
					</div>
				</div>
			</aside>

			<%-- 작업 영역 --%>
			<section class="col-lg-9 col-md-9 col-sm-9 col-9 col-xl-9">

				<div class="productEnrollArea">
					<h3 style="text-align: center;">제품 등록</h3>
					<br>
					<form id="productEnrollForm" action="enrollProduct.ad" method="post" onsubmit="" enctype="multipart/form-data"> <%-- onsubmit에 빈칸 관련 함수 작성할 것 --%>
						<table border="1" style="border: 2px solid black">
							<tr>
								<th><label for="prodNo"></label>상품 코드 :</th>
								<td><input id="prodNo" type="text" name="prodNo"
									placeholder="ex) A12345"></td>
								<th>이미지 등록</th>
							</tr>
							<tr>
								<th><label for="prodCategory"></label>카테고리 :</th>
								<td><select name="prodCategory" id="prodCategory">

										<option value="대형">대형</option>
										<option value="중형">중형</option>
										<option value="소형">소형</option>
								</select></td>
								<td id="prodPictureArea" rowspan="5">
									<div id="prodPicture">
										<img id="titleImg" width="400px" height="400px"
											style="background-color: gray;">

									</div>
									<div id="fileArea">
										<input type="file" name="titleImgFile" id="titleImgFile"
											onchange="loadImg(this);">
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="prodName">상품명 : </label></th>
								<td><input id="prodName" type="text" name="prodName"
									placeholder="ex) 천연 가습기, 아디안텀"></td>
							</tr>
							<tr>
								<th><label for="prodPrice">상품 가격 : </label></th>
								<td><input id="prodPrice" type="text" name="prodPrice"
									placeholder="ex) 120,000"></td>
							</tr>
							<tr>
								<th><label for="prodAmount">재고 수량 : </label></th>
								<td><input id="prodAmount" type="text" name="prodAmount"
									placeholder="ex) 30"></td>
							</tr>
							<tr>
								<th><label for="prodDetail">상세 정보 : </label></th>
								<td><textarea name="prodDetail" id="prodDetail" cols="50"
										rows="10" style="resize: none;" placeholder="상세정보를 입력하세요."></textarea>
								</td>
							</tr>
						</table>

						<br>
						<div class="btns" align="center">
							<button type="button" onclick="goList();" style="margin-right: 100px; width: 150px;">취 소</button>
							<button type="submit" style="margin-left: 100px; width: 150px;">확
								인</button>
						</div>
					</form>
				</div>

			</section>
		</div>
	</div>

	<script>
		function goList(){
			location.href="<%=request.getContextPath()%>/prodList.ad";
		}
		
		$(function() {
			$("#fileArea").hide();
		});
		
		$("#titleImg").click(function() {
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
			;

		}
	</script>

	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>