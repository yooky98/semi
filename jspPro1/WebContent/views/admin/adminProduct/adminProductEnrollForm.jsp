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
							<%--
								<tr>
								<th><label for="prodNo"></label>상품 코드 :</th>
								<td><input id="prodNo" type="text" name="prodNo"
									placeholder="ex) A12345"></td>
								<th>이미지 등록</th>
							</tr>
							 --%>
							
							<tr>
								<th><label for="prodCategory"></label>카테고리 :</th>
								<td><select name="prodCategory" id="prodCategory">

										<option value="대형">대형</option>
										<option value="중형">중형</option>
										<option value="소형">소형</option>
								</select></td>
								<th>이미지 등록</th>
								<%-- 코드가 없어졌기 때문에 테이블에서 한 칸씩 내려감
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
								 --%>
								
							</tr>
							<tr>
								<th><label for="prodName">상품명 : </label></th>
								<td><input id="prodName" type="text" name="prodName"
									placeholder="ex) 천연 가습기, 아디안텀" required></td>
								<td id="prodPictureArea" rowspan="4">
									<div id="prodPicture">
										<img id="titleImg" width="400px" height="400px"
											style="background-color: gray;">

									</div>
									<div id="fileArea">
										<input type="file" name="titleImgFile" id="titleImgFile"
											accept="image/*" onchange="loadImg(this);" required>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="prodPrice">상품 가격 : </label></th>
								<td><input id="prodPrice" type="text" name="prodPrice"
									placeholder="ex) 120,000" required numberOnly></td>
							</tr>
							<tr>
								<th><label for="prodAmount">재고 수량 : </label></th>
								<td><input id="prodAmount" type="text" name="prodAmount"
									placeholder="ex) 30" required numberOnly></td>
							</tr>
							<tr>
								<th><label for="prodDetail">상세 정보 : </label></th>
								<td><textarea name="prodDetail" id="prodDetail" cols="50"
										rows="10" style="resize: none;" placeholder="상세정보를 입력하세요." required></textarea>
								</td>
							</tr>
						</table>

						<br>
						<div class="btns" align="center">
							<button type="button" onclick="goList();" style="margin-right: 100px; width: 150px;">취 소</button>
							<button type="submit" onclick="checkFile();" style="margin-left: 100px; width: 150px;">확
								인</button>
						</div>
					</form>
				</div>

			</section>
		</div>
	</div>
	
	<script>
		//취소 버튼 클릭 시 다시 제품 관리 페이지로 이동
		function goList(){
			location.href="<%=request.getContextPath()%>/prodList.ad";
		}
		//input 버튼 안보이게 설정
		$(function() {
			$("#fileArea").hide();
		});
		//img를 클릭 시 input이 작동되게 설정
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
</body>
</html>