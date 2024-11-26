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
    margin: 100px auto;
    height: 100%;
    min-height: 500px;
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

.mypass-info {
    margin-bottom: 20px;
    text-align: center;/**/
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

button {
    display: inline-block;
    padding: 8px 16px;
    background-color: #d2322d;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    text-align: center;
    font-size: 14px;
    margin-top: 10px;
}


</style>
<script type="text/javascript">
function goMusePass(){
	window.location.href="musePassTermForm.do";
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
            <h2>MY MUSEPASS</h2>
            <div class="mypass-info">
            	<c:if test="${u_mpass eq 0}">
            		<p><button onclick="goMusePass()">뮤즈패스 가입하기</button></p>
            	</c:if>
            	<c:if test="${u_mpass eq 1}">
                	<p>카테고리: Original | 남은 잔여 일수: ${mpRemainDays}일 | 유효기간: ${myMPass.mp_enddate}</p>
            	</c:if>
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
								설정된 기간에 맞는 예매내역이 존재하지 않습니다
							</td>
						</tr>
					</c:if>
                	<c:forEach var="blist" items="${bookingList}">
	                	<tr>
	                        <td>${blist.b_date}</td>
	                        <td><a href="myPageBookingDetail.do?b_code=${blist.b_code}">${blist.b_code}</a></td>
	                        <td>${blist.m_title}</td>
	                        <td>${blist.mo_date} ${blist.mo_time}</td>
	                        <td>${blist.b_count}매</td>
	                        <td>${blist.mr_date} ${blist.mo_time}</td>
	                        <td>
	                        <c:choose>
	                        <c:when test="${blist.b_state eq 0}">취소</c:when>
                        	<c:when test="${blist.b_state eq 1}">
	                        	예매                        	
                        	</c:when>
	                        </c:choose>	
	                        </td>
	                        
	                    </tr>
                	</c:forEach>
                    <!-- 반복행 -->
                </tbody>
            </table>
            </div>
        </div>
   </div> 
    <%@include file="../footer.jsp" %>
</body>

</html>