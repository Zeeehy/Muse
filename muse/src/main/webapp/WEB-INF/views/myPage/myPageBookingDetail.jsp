<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 기본 초기화 */
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

/* 예약 내역 스타일 */
.ticket-info {
    margin-bottom: 20px;
    padding: 20px;
    background-color: #fefefe;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.ticket-info h3 {
    font-size: 18px;
    color: #d2322d;
    margin-bottom: 10px;
}

.ticket-info p {
    font-size: 14px;
    color: #555;
    margin-bottom: 8px;
}

.ticket-details, .payment-info {
    border-top: 1px solid #ddd;
    padding-top: 15px;
    margin-top: 15px;
}

.ticket-details table, .payment-info table {
    width: 100%;
    border-collapse: collapse;
}

.ticket-details th, .payment-info th {
    font-weight: bold;
    text-align: left;
    padding: 10px 0;
    color: #333;
    width: 325px;	/**/
}

.ticket-details td, .payment-info td {
    padding: 10px 0;
    color: #333;
}

/* 버튼 스타일 */
.button {
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

.button:hover {
    background-color: #a12821;
}

.cancel-button {
    color: #d2322d;
    background-color: #f9f9f9;
    border: 1px solid #d2322d;
}

.cancel-button:hover {
    background-color: #ffdede;
}

.ticket-poster {
	border-bottom: 1px solid #ddd;
    padding-bottom: 15px;
    margin-bottom: 15px;
    text-align: center;
}

.ticket-poster img{
	width: 250px;
	height: 350px;
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
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="container">
    <!-- 사이드바 -->
    <div class="sidebar">
        <h2>마이페이지</h2>
        <ul>
            <li><a href="#">예약/취소내역</a></li>
            <li><a href="#">나의 뮤즈캐스트</a></li>
            <li><a href="#">나의 MUSEPASS</a></li>
            <li><a href="#">나의 후기</a></li>
            <li><a href="#">뮤즈캘린더</a></li>
            <li><a href="#">1:1 문의</a></li>
        </ul>
    </div>

    <!-- 메인 콘텐츠 -->
    <div class="main-content">
        <h2>예매내역 확인 • 취소</h2>
        <div class="ticket-info">
        	<div class="ticket-poster">
        	<img src="/muse/resources/img/musical/${bookingDetailList[0].m_poster}" alt="musical_Poster">
            </div>
            <h3>${bookingDetailList[0].m_title}</h3>
            <p>예매자: ${bookingDetailList[0].u_name}</p>
            <p>이용일: ${bookingDetailList[0].mo_date}</p>
            <p>장소: ${bookingDetailList[0].mh_addr}</p>
            
            <div class="ticket-details">
                <table>
                    <tr>
                        <th>예매번호</th>
                        <td>${bookingDetailList[0].b_code}~${bookingDetailList[0].b_code}</td>
                    </tr>
                    <tr>
                        <th>좌석</th>
                        <td>${bookingDetailList[0].s_section}구역 ${bookingDetailList[0].s_position}행 ${bookingDetailList[0].s_row}열 ${bookingDetailList[0].s_floor}층</td>
                    </tr>
                    <tr>
                        <th>티켓수령 방법</th>
                        <td>현장 발급</td>
                    </tr>
                </table>
            </div>
            
            <div class="payment-info">
                <table>
                    <tr>
                        <th>결제일자</th>
                        <td>${bookingDetailList[0].b_date}</td>
                    </tr>
                    <tr>
                        <th>결제수단</th>
                        <td>${bookingDetailList[0].b_type}</td>
                    </tr>
                    <tr>
                        <th>결제상태</th>
                        <td>결제 완료일까?</td>
                    </tr>
                </table>
            </div>
            
            <a href="#" class="button">여기다간 뭐넣지</a>
            <a href="#" class="button cancel-button">예매 취소하지말아라</a>
        </div>

		<div class="ticket-info">
			<div class="recent-history">
                <h2>결제내역</h2>
                <table>
                <thead>
                    <tr>
                        <th>예매상세번호</th>
                        <th>좌석등급</th>
                        <th>좌석번호</th>
                        <th>좌석가격</th>
                        <th>취소여부(일단 관람일)</th>
                        <th>취소버튼</th>
                    </tr>
                </thead>
                <!--
                <tbody>
                <tr>
	                        <td>${bookingDetail.b_code}</td>
	                        <td>sg_code받아와야됨</td>
	                        <td>${bookingDetail.s_section}구역 ${bookingDetail.s_position}행 ${bookingDetail.s_row}열 ${bookingDetail.s_floor}층</td>
	                        <td></td>
	                        <td>b_state나 관람일 받아오기</td>
	                        <td>
	                        	취소하기<input type="checkbox" style="margin-left:2px;">
	                        </td>
	                    </tr>
                </tbody>
                -->
                <tbody>
                	<c:forEach var="bdlist" items="${bookingDetailList}">
	                	<tr>
	                        <td>${bdlist.bd_code}</td>
	                        <td>${bdlist.sg_name}</td>
	                        <td>${bdlist.s_section}구역 ${bdlist.s_position}행 ${bdlist.s_row}열 ${bdlist.s_floor}층</td>
	                        <td>${(bdlist.sp_price*(100-bdlist.d_num)/100).intValue()}원</td>
	                        <td>
	                        	<c:if test="${bdlist.b_state eq 0}">취소불가</c:if>
	                        	<c:if test="${bdlist.b_state eq 1}">취소가능</c:if>
	                        </td>                       
	                        <td>대충버튼자리</td>
	                    </tr>
                	</c:forEach>
                </tbody>
                <!--
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
                </tbody>
               	 -->
            </table>
            </div>
        </div>
		</div>
    </div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>