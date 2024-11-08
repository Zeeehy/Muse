<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
                <p>카테고리: Original | 남은 잔여 일수: ${mpRemainDays}일 | 유효기간: ${myMPass.mp_enddate}</p>
            </div>

            <div class="recent-history">
                <h2>최근 예매 내역</h2>
                <table>
                <thead>
                    <tr>
                        <th>예약일</th>
                        <th>예약번호</th>
                        <th>공연명</th>
                        <th>관람일</th>
                        <th>매수</th>
                        <th>취소가능일</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
	           		<c:if test="${empty bookingList }">
						<tr>
							<td colspan="7" align="center">
								모든 리스트를 통합한 검색결과가 없습니다
							</td>
						</tr>
					</c:if>
                	<c:forEach var="blist" items="${bookingList}">
	                	<tr>
	                        <td>${blist.b_date}</td>
	                        <td>${blist.b_code}</td>
	                        <td>${blist.m_title}</td>
	                        <td>${blist.mo_date} | ${blist.mo_time}</td>
	                        <td>${blist.b_count}</td>
	                        <td>${blist.b_date}</td>
	                        <td>
	                        	<c:if test="${blist.b_state eq 0}">취소</c:if>
	                        	<c:if test="${blist.b_state eq 1}">예매</c:if>
	                        </td>
	                    </tr>
                	</c:forEach>
                    <!-- 반복행 -->
                </tbody>
            </table>
            </div>
        </section>
    </main>
    
    <%@include file="../footer.jsp" %>
</body>

</html>