<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    margin: 100px auto;
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


.pass-info {
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    padding: 20px;
    margin-bottom: 20px;
    text-align: center;
}

.pass-info h4 {
    font-size: 1.2em;
    color: #d9534f;
    margin-bottom: 10px;
}

.show-section h4 {
    font-size: 1.2em;
    margin-bottom: 10px;
    color: #333;
}

.show-list {
    display: flex;
    gap: 20px;
}

.show-item {
    border: 1px solid #ddd;
    background-color: #fff;
    padding: 10px;
    text-align: center;
    border-radius: 4px;
    display: flex;
    gap: 20px;
}

.show-item img {
    width: 100px;
    height: auto;
    border-radius: 4px;
}


.show-details p {
    margin: 5px 0;
    font-size: 0.85em;
    color: #333;
}
.show-details{
    display: flex;
    flex-direction: column;
    justify-content: center;
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
            <li><a href="myPagePwdUpdate.do">비밀번호수정</a></li>
            <li><a href="myPagePoint.do">나의 포인트</a></li>
            <li><a href="myPageBooking.do">예약/취소내역</a></li>
            <li><a href="myPageMuseCast.do">나의 뮤즈캐스트</a></li>
            <li><a href="myPageMusePass.do">나의 MUSEPASS</a></li>
            <li><a href="myPageReview.do">나의 후기</a></li>
            <li><a href="myPageMuseCalendar.do">뮤즈캘린더</a></li>
        </ul>
    </div>

    <div class="main-content">
        <h2>나의 MUSEPASS</h2>

        <div class="pass-info">
            <h4>MY MUSEPASS</h4>
            <p>${u_id}님 가입중</p>
            <p>남은 잔여일수: ${mpRemainDays}일</p>
            <p>${myMPass.mp_enddate}일까지</p>
        </div>

        <div class="show-section">
            <h4>뮤즈패스 선예매</h4>
            <div class="show-list">
            		<c:if test="${empty museMusical }">
							등록한 관심배우가 없습니다
					</c:if>
					<div style="display: flex; flex-wrap: wrap; gap: 10px;">
					    <c:forEach var="mlist" items="${museMusical}">
	                	<div class="show-item" style="flex: 0 1 calc(33.333% - 10px); box-sizing: border-box;">
		                    <img src="/muse/resources/img/musical/${mlist.m_poster}" alt="공연 포스터">
		                    <div class="show-details">
		                        <p>${mlist.m_title}</p>
		                        <p style="color: red">뮤즈패스 ${mlist.on_muse_open} OPEN</p>
		                        <p>일반 ${mlist.on_open} OPEN</p>
		                    </div>
		                </div>
	                	</c:forEach>
					</div>
                <!-- <div class="show-item">
                    <img src="/muse/resources/img/musical/aladinPoster.PNG" alt="공연 포스터">
                    <div class="show-details">
                        <p>뮤지컬 지킬앤하이드 - 20주년</p>
                        <p>2024.11.05 13:00 OPEN</p>
                        <p>일반 2024.11.05 14:00 OPEN</p>
                    </div>
                </div>
                <div class="show-item">
                    <img src="show2.jpg" alt="공연 포스터">
                    <div class="show-details">
                        <p>뮤지컬 지킬앤하이드 - 20주년</p>
                        <p>2024.11.05 13:00 OPEN</p>
                        <p>일반 2024.11.05 14:00 OPEN</p>
                    </div>
                </div> -->
            </div>
        </div>
    </div>
</div>

<%@include file="../footer.jsp" %>
</body>
</html>