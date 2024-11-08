<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

main {
    display: flex;
    padding: 20px;
}

.sidebar {
    width: 200px;
    border-right: 1px solid #ddd;
    padding: 10px;
}

.sidebar ul {
    list-style: none;
    padding: 0;
}

.sidebar ul li {
    padding: 8px 0;
}

.content {
    flex: 1;
    padding: 0 20px;
}

.content h1 {
    font-size: 1.5em;
    margin-bottom: 10px;
}

footer {
	position: absolute;
	bottom: 0;
	width: 100%;
}





form ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

form ul li {
    margin-bottom: 15px;
}

form ul li label {
    display: block;
    text-align: left;
    margin-bottom: 5px;
    color: #333;
    font-weight: bold;
}

form ul li input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 1em;
}

form .buttons {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

input[type="submit"], input[type="reset"] {
    width: 48%;
    padding: 10px;
    font-size: 1em;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"] {
    background-color: #d9534f;
    color: white;
}

input[type="reset"] {
    background-color: #ddd;
    color: #333;
}

input[type="submit"]:hover, input[type="reset"]:hover {
    opacity: 0.9;
}
</style>
<script>
function pwdCheck(){
	var u_pwd = document.getElementById('u_pwd').value;
	var u_pwd2 = document.getElementById('u_pwd2').value;
	
	if (!u_pwd || !u_pwd2) { 
        alert("입력좀");
        return false;
    } else if (u_pwd !== u_pwd2) { 
        alert("비밀번호 틀림");
        return false;
    } else {
        alert("굳");
        return true;
    }
}
</script>
</head>
<body>
    <%@include file="../header.jsp" %>

    <main>
        <aside class="sidebar">
            <ul>
                <li>예매/취소내역</li>
                <li>내가 등록한 작품</li>
                <li>나의 MUSEPASS</li>
                <li>설정</li>
                <li>1:1 문의</li>
            </ul>
        </aside>

        <section class="content">
            <h1>비밀번호 변경</h1>
        <p>주기적인 <span style="color: #d9534f; font-weight: bold;">비밀번호 변경</span>을 통해 개인정보를 안전하게 보호하세요.</p>
        <form name="myPagePwdUpdate" action="myPagePwdUpdate.do" method="post" onsubmit="return pwdCheck()">
            <input type="hidden" name="u_id" value="test"> <!-- 세션에서 받아올 예정 -->
            <ul>
                <li><label>비밀번호</label><input type="password" name="u_pwd" id="u_pwd"></li>
                <li><label>비밀번호 확인</label><input type="password" name="u_pwd2" id="u_pwd2"></li>
            </ul>
            <div class="buttons">
                <input type="submit" value="변경">
                <input type="reset" value="취소">
            </div>
        </form>
        </section>
    </main>
    
    <%@include file="../footer.jsp" %>
</body>
</html>