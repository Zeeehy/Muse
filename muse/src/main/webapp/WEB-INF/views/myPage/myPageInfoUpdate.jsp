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
</style>
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
            <h1>회원정보수정</h1>
		<form name="myPageInfoUpdate" action="myPageInfoUpdate.do" method="post">
		<ul>
			<li>
				<label>아이디</label>
				<input type="text" name="u_id" value="${user.u_id}" readonly="readonly">
			</li>
			<li>
				<label>이름</label>${user.u_name}
			</li>
			<li>
				<label>e-mail</label>
				<input type="text" name="u_email" value="${user.u_email}">
			</li>
			<li>
				<label>전화번호</label>
				<input type="text" name="u_pnum" value="${user.u_pnum}">
			</li>
			<li>
				<label>가입일자</label>${user.u_date}
			</li>
		</ul>
		<div>
			<input type="submit" value="수정">
			<input type="reset" value="취소">
		</div>
	</form>
        </section>
    </main>
    
    <%@include file="../footer.jsp" %>
</body>
</html>