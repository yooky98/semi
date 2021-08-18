<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String msg = (String)request.getAttribute("msg");
	String sTag = (String)request.getAttribute("sTag");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	var msg = "<%= msg %>";
	var sTag = "<%= sTag %>";
	
	$(function(){
		if(msg != "null"){
			alert(msg);
		}
		
		if(sTag == "Y"){
			window.close();
		}
		
	})
</script>
</head>
<body>
<b>비밀번호 변경</b>
	<br>
	
	<form id="updatePwdForm" action="<%= request.getContextPath() %>/updatePwd.me" method="post">
		<table>
			<tr>
				<td><label>현재 비밀번호</label>
				<td><input type="password" name="userPwd" id="userPwd"></td>
			</tr>
			<tr>
				<td><label>변경할 비밀번호</label></td>
				<td><input type="password" name="newPwd"></td>
			</tr>
			<tr>
				<td><label>변경할 비밀번호 확인</label></td>
				<td><input type="password" name="checkPwd"></td>
			</tr>
		</table>
		
		<br>
		<br>
		
		<div class="btns" align="center">
			<button  type="button" onclick="fnCheckPwd()">변경하기</button>
		</div>
	</form>
	<script type="text/javascript">
		function fnCheckPwd(){
			var userPwd = $("#userPwd");
			var newPwd = $("input[name='newPwd']");
			var checkPwd = $("input[name='checkPwd']");
			if(userPwd.val().trim() == "" || newPwd.val().trim() == "" || checkPwd.val().trim() == ""){
				alert("비밀번호를 입력하세요");
				return false;
			}
			
			if(newPwd.val() != checkPwd.val()){
				alert("비밀번호가 다릅니다");
				checkPwd.val('');
				checkPwd.focus();
				return false;
			}
			
			$("#updatePwdForm").submit();
		}
	
	</script>
</body>
</html>