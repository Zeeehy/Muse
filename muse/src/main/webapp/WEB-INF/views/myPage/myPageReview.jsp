<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이 페이지</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif; /* 원하는 폰트로 변경 가능 */
    color: #333;
    background-color: #f8f8f8;
}

/* 레이아웃 스타일 */
.container {
    display: flex;
    max-width: 1200px;
    margin: 20px auto;
}

/* 사이드바 스타일 */
.sidebar {
    width: 200px;
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 20px;
    margin-right: 20px;
}

.sidebar h2 {
    font-size: 18px;
    color: #d2322d; /* 빨간색 텍스트 */
    margin-bottom: 10px;
}

.sidebar ul {
    list-style: none;
}

.sidebar ul li {
    margin-bottom: 10px;
    font-size: 14px;
    color: #333;
}

.sidebar ul li a {
    color: #333;
    text-decoration: none;
}

/* 메인 콘텐츠 스타일 */
.main-content {
    flex: 1;
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 20px;
}

/* 제목 스타일 */
.main-content h2 {
    font-size: 16px;
    color: #d2322d; /* 빨간색 텍스트 */
    border-bottom: 2px solid #d2322d;
    padding-bottom: 5px;
    margin-bottom: 20px;
}

.myreview-info {
    margin-bottom: 20px;
}

.review-history table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

.review-history th, .review-history td {
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
	<div class="container">
    <!-- 사이드바 -->
    <div class="sidebar">
        <h2>마이페이지</h2>
        <ul>
        	<li><a href="myPageInfoUpdate.do">회원정보수정</a></li>
            <li><a href="myPageBooking.do">예약/취소내역</a></li>
            <li><a href="myPageMuseCast.do">나의 뮤즈캐스트</a></li>
            <li><a href="myPageMusePass.do">나의 MUSEPASS</a></li>
            <li><a href="#">나의 후기</a></li>
            <li><a href="myPageMuseCalendar.do">뮤즈캘린더</a></li>
        </ul>
    </div>

        <div class="main-content">
            <h2>나의 후기</h2>
            <div class="myreview-info">
                <button>공연 리뷰</button>
                <button>좌석 리뷰</button>
            </div>

            <div class="review-history">
                <h2>공연 리뷰</h2>
                <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>별점</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- 
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
                    -->
                </tbody>
            </table>
            </div>
        </div>
   </div> 
    <%@include file="../footer.jsp" %>
</body>

</html>