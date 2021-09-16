<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath() %>/resources/css/notice.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Notice</title>
<script type="text/javascript">	
	function setCookie(key, value, expiredays) {
	    var todayDate = new Date();
	    
	    todayDate.setDate(todayDate.getDate() + expiredays);
	    document.cookie = key + "=" + escape(value) + "; path=/; expires=" + todayDate.toUTCString() + ";";
	}
	
	function closePopForaDay() {	    
	    setCookie("notice", "showView", 1);
	    document.all['noticePopup'].style.visibility = "hidden";
	}

	function closePop() {
	    document.all['noticePopup'].style.visibility = "hidden";
	}
</script>
</head>
<body>
	<%-- 공지사항 팝업 --%>
	<div id="noticePopup">
		<div id="noticeContent">
			<button class="btn" id="xBtn" onclick="closePop();"><i class="fa fa-times" aria-hidden="true"></i></button>   
			<div id="noticePanel"></div>
		</div>
		<div class="noticeFooter">
			<label for="popChk" onclick="closePopForaDay();">오늘 하루 그만 보기 <input type="checkbox" name="chkbox" value="checkbox" id="popChk" class="flat">&nbsp;&nbsp;</label>
		</div>
	</div>
	<%-- 메인화면 최초 로딩 시 공지창이 나타남 --%>
	<script>
		$(window).on('load', function(){
			if (cookieData.indexOf("notice=showView") < 0) {
				$('#noticePopup').show();
			};
		});
	</script>
	<%-- 쿠키 유무(오늘 하루 그만 보기)에 따라 팝업창 가시 여부 --%>
	<script>
		cookieData = document.cookie;
		if (cookieData.indexOf("notice=showView") < 0) {
			document.all['noticePopup'].style.visibility = "visible";
		} else {
			document.all['noticePopup'].style.visibility = "hidden";
		}
	</script>
</body>
</html>