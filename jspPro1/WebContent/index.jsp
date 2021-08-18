<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.topList {
		width: 1000px;
		height: 400px;
		background: black;
		color: white;
		margin: auto;
	}
	
	.thumb {
		display: inline-block;
		width: 250px;
		height: 250px;
		margin: 10px;
		border: 1px solid white;
	}
	
	.thumb:hover {
		cursor: pointer;
	}
</style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp"%>


	<div class="topList" align="center"></div>

	<%@ include file="views/common/footer.jsp"%>
</body>
</html>