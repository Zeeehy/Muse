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

/* 검색 필터 박스 */
.filter-box {
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #ddd;
    align-items: center;	
}

.filter-box select,
.filter-box input[type="text"],
.filter-box button {
    padding: 8px;
    font-size: 14px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.filter-box button {
    background-color: #d2322d;
    color: #fff;
    border: none;
    cursor: pointer;
}

/* 테이블 스타일 */
.table-container {
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table th, table td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: center;
}

table th {
    background-color: #f1f1f1;
    font-weight: bold;
}

table td {
    color: #666;
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
        <h2>MUSEPASS 선호 공연</h2>
        <div class="filter-box">
        	<label>조회기간 선택</label>|
            <label>기간별</label>			
            <button>7일</button>
            <button>1개월</button>
            <button>3개월</button>
            <button>6개월</button>
            <label>주문일자별</label>
            <select id="dtype">
            	<option value="0">전체</option>
                <option value="1">예매일</option>
                <option value="2">공연일</option>
            </select>
            <select id="year">
            </select>
            <label>년</label>
            <select id="month">
            </select>
            <label>월</label>
            <button>검색</button>
        </div>
        
        <!-- 예약 내역 테이블 -->
        <div class="table-container">
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
								예매내역이 존재하지 않습니다
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
    </div>
</div>
<%@include file="../footer.jsp" %>
</body>
<script>
var yearSelect = document.getElementById("year");
var currentYear = new Date().getFullYear();

for (let year = currentYear; year >= currentYear - 10; year--) {
    var option = document.createElement("option");
    option.value = year;
    option.textContent = year ;
    yearSelect.appendChild(option);
}

var monthSelect = document.getElementById("month");
for (let month = 1; month <= 12; month++) {
    var option = document.createElement("option");
    option.value = month;
    option.textContent = month;
    monthSelect.appendChild(option);
}
</script>
</html>