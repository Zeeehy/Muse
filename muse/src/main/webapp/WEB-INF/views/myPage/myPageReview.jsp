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
button {
 	display: inline-block;
    padding: 8px 16px;
    background-color: #d2322d;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    text-align: center;
    font-size: 14px;
}

/* 채운 별과 빈 별을 나란히 배치 */
.ystarHalf, .gstarHalf {
    width: 12px;
    height: 24px;
    display: inline-block;
    background-repeat: no-repeat;
    background-size: 24px 24px;
}

/* 채워진 별 */
.ystarHalf {
    background-image: url("/muse/resources/img/ystar.svg");
    background-position: left;
}

/* 빈 별 */
.gstarHalf {
    background-image: url("/muse/resources/img/gstar.svg");
    background-position: right;
}

/* 별 이미지 */
.review-stars img {
    width: 24px;
    height: 24px;
    margin-right: 4px;
}

.ystarHalf, .gstarHalf {
    width: 12px; /* 원본 사이즈/2 */
    height: 24px;
    display: inline-block; /* 나란히 배치 */
    background-repeat: no-repeat;
    background-size: 24px 24px; /* 이미지 크기를 24px로 설정 */
}

.ystarHalf {
    background-image: url("/muse/resources/img/ystar.svg");
    background-position: left; /* 왼쪽 반만 채워지게 */
    
}

.gstarHalf {
    background-image: url("/muse/resources/img/gstar.svg");
    background-position: right; /* 오른쪽 반만 빈 별로 */
            margin-left: -4px;
    
}
</style>
<script>
function openReviewList(seat_state) {
	location.href='myPageReview.do?seat_state='+seat_state;
}
</script>
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
            <h2>나의 후기</h2>
            <div class="myreview-info">
                <button onclick="openReviewList(0)">공연 리뷰</button>
                <button onclick="openReviewList(1)">좌석 리뷰</button>
            </div>

            <div class="review-history">
                <table>                
                <c:if test="${seat_state eq 0}">
	                <thead>
	                    <tr>
	                        <th>번호</th>	                        
	                        <th>공연이름</th>
	                        <th>제목</th>                       
	                        <th>별점</th>
	                        <th>작성일</th>
	                    </tr>   
	                </thead>
	                <tbody>
	                <c:if test="${empty musicalReviewList }">
							<tr>
								<td colspan="5" align="center">
									작성한 공연 후기가 존재하지 않습니다
								</td>
							</tr>
						</c:if>
	                	<c:forEach var="mrlist" items="${musicalReviewList}" varStatus="vs">
		                	<tr>
		                        <td>${vs.count}</td>                        
		                        <td>${mrlist.m_title}</td>
		                        <td>${mrlist.mr_title}</td>
		                        <td>
									<c:forEach begin="1" end="5" var="i">
								        <c:choose>
								            <%-- 완전한 별 --%>
								            <c:when test="${i <= Math.floor(mrlist.mr_score)}">
								                <img src="/muse/resources/img/ystar.svg" >
								            </c:when>
								            
								            <%-- 반 별 --%>
								            <c:when test="${i == Math.ceil(mrlist.mr_score) && mrlist.mr_score % 1 >= 0.5}">
								                <span class="ystarHalf"></span>
								                <span class="gstarHalf"></span>
								            </c:when>
								            
								            <%-- 빈 별 --%>
								            <c:otherwise>
								                <img src="/muse/resources/img/gstar.svg" >
								            </c:otherwise>
								        </c:choose> 
								    </c:forEach>
								</td>
		                        <td>${mrlist.mr_date}</td>
		                    </tr>
	                	</c:forEach>
	                </tbody>     
                </c:if>
                <c:if test="${seat_state eq 1}">
                	<thead>
	                    <tr>
	                        <th>번호</th>	                        
	                        <th>좌석위치</th>
	                        <th>후기내용</th>	                        
	                        <th>별점</th>
	                        <th>작성일</th>
	                    </tr>   
	                </thead>
	                <tbody>
	                <c:if test="${empty seatReviewList }">
							<tr>
								<td colspan="5" align="center">
									작성한 좌석 후기가 존재하지 않습니다
								</td>
							</tr>
						</c:if>
	                	<c:forEach var="srlist" items="${seatReviewList}" varStatus="vs">
		                	<tr>
		                        <td>${vs.count}</td>                        
		                        <td>${srlist.s_floor}층 ${srlist.s_section}구역 ${srlist.s_row}열 ${srlist.s_position}번</td>
		                        <td>${srlist.sr_content}</td>
		                        <td>
								    <c:forEach begin="1" end="5" var="i">
								        <c:choose>
								            <%-- 완전한 별 --%>
								            <c:when test="${i <= Math.floor(srlist.sr_score)}">
								                <img src="/muse/resources/img/ystar.svg" >
								            </c:when>
								            
								            <%-- 반 별 --%>
								            <c:when test="${i == Math.ceil(srlist.sr_score) && srlist.sr_score % 1 >= 0.5}">
								                <span class="ystarHalf"></span>
								                <span class="gstarHalf"></span>
								            </c:when>
								            
								            <%-- 빈 별 --%>
								            <c:otherwise>
								                <img src="/muse/resources/img/gstar.svg" >
								            </c:otherwise>
								        </c:choose>
								        
								    </c:forEach>
								</td>
		                        <td>${srlist.sr_date}</td>
		                    </tr>
	                	</c:forEach>
	                </tbody>     
                </c:if>             
            </table>
            </div>
        </div>
   </div> 
    <%@include file="../footer.jsp" %>
</body>

</html>