<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function pwdCheck(){
	var pwd = document.getElementById('pwd').value;
	var pwd2 = document.getElementById('pwd2').value;
	
	if (!pwd || !pwd2) { 
        alert("입력좀");
    } else if (pwd !== pwd2) { 
        alert("비밀번호 틀림");
    } else {
        alert("굳");
    }
}
</script>
</head>
<body>
<form name="myPageUserUpdate">
		<h1>나의 정보수정</h1>
		<ul>
			<li>
			<label>아이디</label>진예림 바보
			</li>
			<li><label>이름</label>김아무개</li>
			<li><label>비밀번호</label><input type="text" name="pwd" id="pwd"></li>
			<li><label>비밀번호 확인</label><input type="text" name="pwd2" id="pwd2"></li>
			<li><label>e-mail</label><input type="text" name="email"></li>
			<li><label>전화번호</label><input type="text" name="tel"></li>
		</ul>
		<div>
			<input type="button" value="정보수정" onclick="pwdCheck()">
			<input type="reset" value="다시작성">
		</div>
</form>
</body>
</html>