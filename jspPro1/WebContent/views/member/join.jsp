<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/user.js"></script>
<script>
 function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
         
                document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>


<link href="<%=request.getContextPath() %>/resources/css/user.css" rel="stylesheet">

</head>
	
<body class = "tbody" >

<%@ include file="../common/menubar.jsp"%>
	<div class = "userbox">
	<span class="usertitle">회원가입</span>
	<table></table>
	<form method ="post" action = "<%=request.getContextPath() %>/user?command=join">
	<table class="usertable" style="border-spacing: 0 5px;">
	<tr><td><input id = "user_id" class="userform" type = "text" name = "user_id" maxlength="10" placeholder="아이디">
	<div id = "checkId" style = "font-weight: 700;" ></div></td></tr>
    <tr><td><input class="userform" type = "password" id = "user_pw" name = "user_pw" 	maxlength="20" placeholder="비밀번호 "> 
 	<tr><td><input class="userform" type = "password" id = "user_pwCheck" name = "user_pwCheck" maxlength="20" placeholder="비밀번호 확인">
 	<div id = "pwCheck" style = "font-weight: 700;"></div> </td></tr>	
	<tr><td><input class="userform" type = "text" name = "user_name" maxlength="20" placeholder="이름 "></td></tr>
	<tr><td><input class="userform" style="width:189px;" type = "text" name = "user_no" maxlength="6" placeholder="주민번호 앞자리"> - 
	<input class="userform" style="width:189px;" type = "password" name = "user_no1" maxlength="7" placeholder="주민번호 뒷자리"></td></tr>
	<tr><td><input class="genderradio" style="width:50px;" type='radio' name='gender' value='M' /><span class="gender">남자</span>
	<input class="genderradio" style="width:50px;" type='radio' name='gender' value='F' /><span class="gender">여자</span></td></tr>
	<tr><td><input class="userform" type="text" id="sample4_postcode" name="userPost" placeholder="우편번호" readonly></td></tr>
	<tr><td><input class="userform" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td></tr>
	<tr><td><input class="userform" type="text" id="sample4_roadAddress" name="userAddress"placeholder="도로명주소" size="60" readonly></td></tr>
	<tr><td><input class="userform" type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60"disabled></td></tr>
	<tr><td><span class="userform" id="guide" style="color:#999;display:none"></span></td></tr>
	<tr><td><input class="userform" type="text" id="sample4_detailAddress" name="userAddress1" placeholder="상세주소"  size="60" ></td></tr>
	<tr><td><input class="userform" type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60" ></td></tr>
	<tr><td><input class="userform" type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ></td></tr>
	<tr><td><input class="userform" type = "text" name = "phone" maxlength="13" placeholder="전화번호  ' - ' 포함"></td></tr>
	<tr><td><input class="userform" type = "text" name = "email" maxlength="20" placeholder="이메일"></td></tr>
	</table>
	<br>
	
<input type = "submit" value = "회원가입" class = "userbtn">
</form>
</div>


</body>
</html>