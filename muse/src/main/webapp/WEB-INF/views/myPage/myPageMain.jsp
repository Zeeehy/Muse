<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="UTF-8">
    <title>마이 페이지</title>
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

.mypass-info {
    margin-bottom: 20px;
}

.recent-history table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

.recent-history th, .recent-history td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
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
            <h1>MY MUSEPASS</h1>
            <div class="mypass-info">
                <p>카테고리: Original | 남은 관람 횟수: 3회 | 유효기간: 2025-07-25</p>
            </div>

            <div class="recent-history">
                <h2>최근 예매 내역</h2>
                <table>
                    <tr>
                        <th>예매일</th>
                        <th>작품명</th>
                        <th>공연일</th>
                        <th>관람일</th>
                        <th>좌석</th>
                        <th>취소가능여부</th>
                        <th>상태</th>
                    </tr>
                    <tr>
                        <td colspan="7">모든 리스트를 통합한 검색 결과가 없습니다.</td>
                    </tr>
                </table>
            </div>
        </section>
    </main>
    
    <%@include file="../footer.jsp" %>
</body>

</html>