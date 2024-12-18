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

/* 메인 컨텐츠 */
.main-content {
    float: right;
    width: 75%;
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 20px;
    box-sizing: border-box;
}

.main-content h1 {
    font-size: 24px;
    color: #0066cc;
    margin-bottom: 20px;
    border-bottom: 2px solid #0066cc;  
    padding-bottom: 5px;
}

.main-content .point-box {
    background-color: #f5f5f5;
    border: 1px solid #ddd;
    padding: 20px;
    text-align: center;
    font-size: 36px;
    font-weight: bold;
    color: #007bff;
    margin-bottom: 20px;
}

.main-content .history-title {
    font-size: 18px;
    color: #333;
    margin-bottom: 10px;
}

/* 검색 필터 */
.search-filter {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    border: 1px solid #ddd;
    gap: 10px;
    padding: 30px;
}

.search-filter select,
.search-filter input[type="date"] {
    padding: 5px;
    font-size: 14px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-right: 10px;
}

.search-filter button {
    padding: 5px 15px;
    font-size: 14px;
    color: #fff;
    background-color: #007bff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.search-filter button:hover {
    background-color: #0056b3;
}

/* 테이블 */
.table-container {
    overflow-x: auto;
}

.point_table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

.point_table th,
.point_table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
    font-size: 14px;
}

.point_table th {
    background-color: #f5f5f5;
    font-weight: bold;
}

.point_table td {
    color: #666;
}


.main-content h2 {
    font-size: 16px;
    color: #0066cc;
    margin-bottom: 20px;
    border-bottom: 2px solid #0066cc;  
    padding-bottom: 5px;
}


</style>
<script>
function getPointDay(param){
	
	var xhr = new XMLHttpRequest();
    xhr.open('GET', 'myPagePointDayList.do?point_day=' + param, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            document.getElementById('point_table').innerHTML = JSON.parse(xhr.responseText);
        }
    };
    xhr.send();
}

function getPointMonth(param){
	
	var xhr = new XMLHttpRequest();
    xhr.open('GET', 'myPagePointMonthList.do?point_month=' + param, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            document.getElementById('point_table').innerHTML = JSON.parse(xhr.responseText);
        }
    };
    xhr.send();

   

}

function getPointDate(){
	var point_startDate = document.getElementById('point_startDate').value;
    var point_endDate = document.getElementById('point_endDate').value;
    var point_type = document.getElementById('point_type').value;
	if(point_startDate=='' || point_endDate=='' || !point_startDate || !point_endDate){
		alert('날짜를 모두 선택해주세요');
		return;
	}
	var xhr = new XMLHttpRequest();
    if(point_type==0){    	 
    	xhr.open('GET', 'myPagePointAddList.do?point_startDate='+point_startDate+'&point_endDate='+point_endDate, true);   	       	    
    } else {
	    xhr.open('GET', 'myPagePointUseList.do?point_startDate='+point_startDate+'&point_endDate='+point_endDate, true);
    }
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            document.getElementById('point_table').innerHTML = JSON.parse(xhr.responseText);
        }
    };
    xhr.send();

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
             <h1>M-point</h1>
        <div class="point-box">${pointSum} P</div>
        <h2>M포인트 내역</h2>
		<div class="search-filter">	
            <button onclick="getPointDay(7)">7일</button>
            <button onclick="getPointDay(15)">15일</button>
            <button onclick="getPointMonth(1)">1개월</button>
            <button onclick="getPointMonth(2)">2개월</button>
            <button onclick="getPointMonth(3)">3개월</button>
			|
            <select id="point_type">
                <option value="0">적립</option>
                <option value="1">사용</option>
            </select>
            
            <input id="point_startDate" type="date" />
            <input id="point_endDate" type="date" />
            
            <button onclick="getPointDate()">검색</button>
        </div>

        <!-- 테이블 -->
        <div class="table-container">
            <table class="point_table" id="point_table">
                <thead>
                    <tr>              
                        <th>구분</th>
                        <th>적립여부</th>
                        <th>내역</th>
                        <th>변동포인트</th>
                        <th>발생일자</th>
                    </tr>
                </thead>
                <tbody>
                   <c:if test="${empty pointList }">
						<tr>
							<td colspan="5" align="center">
								포인트내역이 존재하지 않습니다
							</td>
						</tr>
					</c:if>
                	<c:forEach var="ptlist" items="${pointList}">
	                	<tr>
	                        <td>
	                        	<c:if test="${ptlist.pt_category eq 0}">뮤즈패스 가입</c:if>
	                        	<c:if test="${ptlist.pt_category eq 1}">예매구매</c:if>
	                        	<c:if test="${ptlist.pt_category eq 2}">좌석리뷰</c:if>
	                        	<c:if test="${ptlist.pt_category eq 3}">공연리뷰</c:if>
	                        	<c:if test="${ptlist.pt_category eq 4}">예매환불</c:if>
	                        </td>
	                        <td>
								<c:if test="${ptlist.pt_point > 0}">적립</c:if>
	                        	<c:if test="${ptlist.pt_point < 0}">사용</c:if>
							</td>
	                        <td>${ptlist.point_detail}</td>
	                        <td>${ptlist.pt_point}P</td>
	                        <td>${ptlist.pt_date}</td>
	                    </tr>
                	</c:forEach>
                </tbody>
            </table>
        </div>
            
        </div>
   </div> 
    <%@include file="../footer.jsp" %>
</body>

</html>