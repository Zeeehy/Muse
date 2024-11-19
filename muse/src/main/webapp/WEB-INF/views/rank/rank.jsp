<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ranking</title>
<link href="/muse/resources/css/Yel.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // 모든 링크를 변수에 저장
    const rankingLinks = document.querySelectorAll('.rank-category-link');

    // 링크 클릭 시 'active' 클래스 토글
    rankingLinks.forEach(link => {
        link.addEventListener('click', function() {
            // 모든 링크에서 'active' 클래스 제거
            rankingLinks.forEach(l => l.classList.remove('active'));

            // 클릭된 링크에 'active' 클래스 추가
            link.classList.add('active');
        });
    });

    // 기본적으로 첫 번째 링크에 'active' 클래스 추가
    document.getElementById("daily").classList.add('active');
});

function formatDate(dateString) {
    const date = new Date(dateString); // 서버에서 받은 날짜 문자열을 Date 객체로 변환
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return year + '-' + month + '-' + day;
}

//DOM이 준비되면 실행
$(document).ready(function() {
	 // 일간 버튼 클릭 시 페이지 초기화 (일간 데이터를 다시 불러옴)
	 $("#daily").click(function(event) {
	     event.preventDefault();  // 기본 링크 이동을 방지
	     
	  // 서버로 일간 랭킹 데이터를 요청
	     $.ajax({
	         url: "rankDaily.do",  // 일간 데이터를 처리하는 서버 URL
	         type: "GET",
	         dataType: "json",  // 서버에서 JSON 형식으로 데이터를 받음
	         success: function(response) {
	        	 console.log(response);
	             // 서버에서 받은 JSON 데이터 (일간 랭킹 리스트)
	             var dailys = response.daily;  // 이미 JSON 배열 형태일 가능성 있음

	          	 // 기존의 랭킹 내용을 비우고 새 데이터를 추가
	             $(".rank-top3").empty(); // .rank-top3 안에 내용 삭제
	             $(".rank-others-div").empty(); // .rank-others-div 안에 내용 삭제
	            
	          	 // rank-top3와 rank-others를 각각 담을 변수
	             var top3HTML = '';
	             var othersHTML = '';
	             
	             // 각 랭킹 데이터를 동적으로 HTML로 생성
	             dailys.forEach(function(daily) {
	            	 
	            	 var formattedStartDate = formatDate(daily.m_startdate);  // 시작 날짜 포맷
	                 var formattedEndDate = formatDate(daily.m_enddate);  // 종료 날짜 포맷

	                 // 1위일 경우
	                 if (daily.rank === 1) {
	                	 top3HTML += `	                        
	                             <div class="top3">
	                                 <div class="rank-number">
	                                     <div class="rank-number-label">\${daily.rank}</div>
	                                     <img src="resources/img/rank/rank1.png" alt="랭킹 1" width="60px" height="60px">
	                                 </div>
	                                 <div class="rank-info">
	                                     <div class="rank-poster"><img src="resources/img/musical/\${daily.m_poster}" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
	                                     <div class="rank-subtitle"><a href="musicalDetail.do?m_code=\${daily.m_code}">뮤지컬 &lt;&nbsp;\${daily.m_title}&nbsp;&gt;</a></div>
	                                     <div class="rank-place">\${daily.mh_name}</div>
	                                     <div class="rank-date">\${formattedStartDate} ~ \${formattedEndDate}</div>
	                                     <div class="rank-salePercentage">예매율 <span>\${daily.booking_rate} %</span></div>
	                                 </div>
	                             </div>
	                     `;
	                 }
	                 // 2위, 3위일 경우
	                 else if (daily.rank === 2 || daily.rank === 3) {
	                	 top3HTML += `
	                             <div class="top3">
	                                 <div class="rank-number">
	                                     <div class="rank-number-label2">\${daily.rank}</div>
	                                     <img src="resources/img/rank/rank23.png" alt="랭킹 \${daily.rank}" width="60px" height="60px">
	                                 </div>
	                                 <div class="rank-info">
	                                     <div class="rank-poster"><img src="resources/img/musical/\${daily.m_poster}" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
	                                     <div class="rank-subtitle"><a href="musicalDetail.do?m_code=\${daily.m_code}">뮤지컬 &lt;&nbsp;\${daily.m_title}&nbsp;&gt;</a></div>
	                                     <div class="rank-place">\${daily.mh_name}</div>
	                                     <div class="rank-date">\${formattedStartDate} ~ \${formattedEndDate}</div>
	                                     <div class="rank-salePercentage">예매율 <span>\${daily.booking_rate} %</span></div>
	                                 </div>
	                             </div>
	                     `;
	                 }
	                 // 4위 이상일 경우
	                 else if (daily.rank > 3) {
	                	 othersHTML += `
	                         <div class="rank-others">
	                             <div class="rank-number-others">
	                                 <div class="rank-number-label-others">\${daily.rank}</div>
	                             </div>
	                             <div class="rank-poster-others">
	                                 <img src="resources/img/musical/\${daily.m_poster}" alt="공연 포스터" width="150px" height="200px" style="border-radius: 10px;">
	                             </div>
	                             <div class="rank-info-others">
	                                 <div class="rank-info-others-title"><a href="musicalDetail.do?m_code=\${daily.m_code}">뮤지컬 &lt;&nbsp;\${daily.m_title}&nbsp;&gt;</a></div>
	                                 <div class="rank-info-others-place">\${daily.mh_name}</div>
	                                 <div class="rank-info-others-date">\${formattedStartDate} ~ \${formattedEndDate}</div>
	                                 <div class="rank-info-others-percentage">\${daily.booking_rate} %</div>
	                             </div>
	                         </div>
	                     `;
	                 }
	             });
	             
	          	 // rank-top3 먼저 추가
	             $(".rank-top3").append(top3HTML);
	             // rank-others 다음에 추가
	             $(".rank-others-div").append(othersHTML);
	         },
	         error: function() {
	             alert('일간 랭킹 데이터를 불러오는 데 실패했습니다.');
	         }
	     });
	 });
	
	 // 주간 랭킹을 클릭했을 때
	 $("#weekly").click(function(event) {
    event.preventDefault();  // 기본 링크 이동을 방지
    
    // 서버로 주간 랭킹 데이터를 요청
    $.ajax({
    	 url: "rankWeekly.do",  // 일간 데이터를 처리하는 서버 URL
         type: "GET",
         dataType: "json",  // 서버에서 JSON 형식으로 데이터를 받음
        success: function(response) {
        	console.log(response);
            // 서버에서 받은 JSON 데이터 (주간 랭킹 리스트)
            var weeklys = response.weekly;  // 이미 JSON 배열 형태일 가능성 있음

            // 기존의 랭킹 내용을 비우고 새 데이터를 추가
            $(".rank-top3").empty(); // .rank-top3 안에 내용 삭제
            $(".rank-others-div").empty(); // .rank-others-div 안에 내용 삭제 
             
            // rank-top3와 rank-others를 각각 담을 변수
            var top3HTML = '';
            var othersHTML = '';

            // 각 랭킹 데이터를 동적으로 HTML로 생성
            weeklys.forEach(function(weekly) {
    
                var formattedStartDate = formatDate(weekly.m_startdate);  // 시작 날짜 포맷
                var formattedEndDate = formatDate(weekly.m_enddate);  // 종료 날짜 포맷
                 
                // 1위일 경우
                if (weekly.rank === 1) {
                    top3HTML += `
                        <div class="top3">
                            <div class="rank-number">
                                <div class="rank-number-label">\${weekly.rank}</div>
                                <img src="resources/img/rank/rank1.png" alt="랭킹 1" width="60px" height="60px">
                            </div>
                            <div class="rank-info">
                                <div class="rank-poster"><img src="resources/img/musical/\${weekly.m_poster}" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
                                <div class="rank-subtitle"><a href="musicalDetail.do?m_code=\${weekly.m_code}">뮤지컬 &lt;&nbsp;\${weekly.m_title}&nbsp;&gt;</a></div>
                                <div class="rank-place">\${weekly.mh_name}</div>
                                <div class="rank-date">\${formattedStartDate} ~ \${formattedEndDate}</div>
                                <div class="rank-salePercentage">예매율 <span>\${weekly.booking_rate} %</span></div>
                            </div>
                        </div>
                    `;
                }
                // 2위, 3위일 경우
                else if (weekly.rank === 2 || weekly.rank === 3) {
                    top3HTML += `
                        <div class="top3">
                            <div class="rank-number">
                                <div class="rank-number-label2">\${weekly.rank}</div>
                                <img src="resources/img/rank/rank23.png" alt="랭킹 ${weekly.rank}" width="60px" height="60px">
                            </div>
                            <div class="rank-info">
                                <div class="rank-poster"><img src="resources/img/musical/\${weekly.m_poster}" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
                                <div class="rank-subtitle"><a href="musicalDetail.do?m_code=\${weekly.m_code}">뮤지컬 &lt;&nbsp;\${weekly.m_title}&nbsp;&gt;</a></div>
                                <div class="rank-place">\${weekly.mh_name}</div>
                                <div class="rank-date">\${formattedStartDate} ~ \${formattedEndDate}</div>
                                <div class="rank-salePercentage">예매율 <span>\${weekly.booking_rate} %</span></div>
                            </div>
                        </div>
                    `;
                }
                // 4위 이상일 경우
                else if (weekly.rank > 3) {
                    othersHTML += `
                        <div class="rank-others">
                            <div class="rank-number-others">
                                <div class="rank-number-label-others">\${weekly.rank}</div>
                            </div>
                            <div class="rank-poster-others">
                                <img src="resources/img/musical/\${weekly.m_poster}" alt="공연 포스터" width="150px" height="200px" style="border-radius: 10px;">
                            </div>
                            <div class="rank-info-others">
                                <div class="rank-info-others-title"><a href="musicalDetail.do?m_code=\${weekly.m_code}">뮤지컬 &lt;&nbsp;\${weekly.m_title}&nbsp;&gt;</a></div>
                                <div class="rank-info-others-place">\${weekly.mh_name}</div>
                                <div class="rank-info-others-date">\${formattedStartDate} ~ \${formattedEndDate}</div>
                                <div class="rank-info-others-percentage">\${weekly.booking_rate} %</div>
                            </div>
                        </div>
                    `;
                }
            });

            // rank-top3 먼저 추가
            $(".rank-top3").append(top3HTML);
            // rank-others 다음에 추가
            $(".rank-others-div").append(othersHTML);
        },
        error: function() {
            alert('일간 랭킹 데이터를 불러오는 데 실패했습니다.');
        }
    });
});
	 
	
	 // 월간 버튼 클릭 시 페이지 초기화 (월간 데이터를 다시 불러옴)
	 $("#monthly").click(function(event) {
	     event.preventDefault();  // 기본 링크 이동을 방지
	     
	     // 서버로 월간 랭킹 데이터를 요청
	     $.ajax({
	         url: "rankMonthly.do",  // 월간 데이터를 처리하는 서버 URL
	         type: "GET",
	         dataType: "json",  // 서버에서 JSON 형식으로 데이터를 받음
	         success: function(response) {
	        	 
	        	 console.log(response);
	             // 서버에서 받은 JSON 데이터 (월간 랭킹 리스트)
	             var monthlys = response.monthly;  // JSON 배열로 이미 반환된다고 가정

	             // 기존의 랭킹 내용을 비우고 새 데이터를 추가
	             $(".rank-top3").empty(); // .rank-top3 안에 내용 삭제
	             $(".rank-others-div").empty(); // .rank-others-div 안에 내용 삭제            

	             // rank-top3와 rank-others를 각각 담을 변수
	             var top3HTML = '';
	             var othersHTML = '';

	             // 각 랭킹 데이터를 동적으로 HTML로 생성
	             monthlys.forEach(function(monthly) {
	                 var formattedStartDate = formatDate(monthly.m_startdate);  // 시작 날짜 포맷
	                 var formattedEndDate = formatDate(monthly.m_enddate);  // 종료 날짜 포맷

	                 // 랭킹 항목 HTML 생성
	                 if (monthly.rank === 1) {
	                     top3HTML += `
	                         <div class="top3">
	                             <div class="rank-number">
	                                 <div class="rank-number-label">\${monthly.rank}</div>
	                                 <img src="resources/img/rank/rank1.png" alt="랭킹 1" width="60px" height="60px">
	                             </div>
	                             <div class="rank-info">
	                                 <div class="rank-poster"><img src="resources/img/musical/\${monthly.m_poster}" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
	                                 <div class="rank-subtitle"><a href="musicalDetail.do?m_code=\${monthly.m_code}">뮤지컬 &lt;&nbsp;\${monthly.m_title}&nbsp;&gt;</a></div>
	                                 <div class="rank-place">\${monthly.mh_name}</div>
	                                 <div class="rank-date">\${formattedStartDate} ~ \${formattedEndDate}</div>
	                                 <div class="rank-salePercentage">예매율 <span>\${monthly.booking_rate} %</span></div>
	                             </div>
	                         </div>
	                     `;
	                 }
	                 // 2위, 3위일 경우
	                 else if (monthly.rank === 2 || monthly.rank === 3) {
	                     top3HTML += `
	                         <div class="top3">
	                             <div class="rank-number">
	                                 <div class="rank-number-label2">\${monthly.rank}</div>
	                                 <img src="resources/img/rank/rank23.png" alt="랭킹 \${monthly.rank}" width="60px" height="60px">
	                             </div>
	                             <div class="rank-info">
	                                 <div class="rank-poster"><img src="resources/img/musical/\${monthly.m_poster}" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
	                                 <div class="rank-subtitle"><a href="musicalDetail.do?m_code=\${monthly.m_code}">뮤지컬 &lt;&nbsp;\${monthly.m_title}&nbsp;&gt;</a></div>
	                                 <div class="rank-place">\${monthly.mh_name}</div>
	                                 <div class="rank-date">\${formattedStartDate} ~ \${formattedEndDate}</div>
	                                 <div class="rank-salePercentage">예매율 <span>\${monthly.booking_rate} %</span></div>
	                             </div>
	                         </div>
	                     `;
	                 }
	                 // 4위 이상일 경우
	                 else if (monthly.rank > 3) {
	                     othersHTML += `
	                         <div class="rank-others">
	                             <div class="rank-number-others">
	                                 <div class="rank-number-label-others">\${monthly.rank}</div>
	                             </div>
	                             <div class="rank-poster-others">
	                                 <img src="resources/img/musical/\${monthly.m_poster}" alt="공연 포스터" width="150px" height="200px" style="border-radius: 10px;">
	                             </div>
	                             <div class="rank-info-others">
	                                 <div class="rank-info-others-title"><a href="musicalDetail.do?m_code=\${monthly.m_code}">뮤지컬 &lt;&nbsp;\${monthly.m_title}&nbsp;&gt;</a></div>
	                                 <div class="rank-info-others-place">\${monthly.mh_name}</div>
	                                 <div class="rank-info-others-date">\${formattedStartDate} ~ \${formattedEndDate}</div>
	                                 <div class="rank-info-others-percentage">\${monthly.booking_rate} %</div>
	                             </div>
	                         </div>
	                     `;
	                 }
	             });

	             // rank-top3 먼저 추가
	             $(".rank-top3").append(top3HTML);
	             // rank-others 다음에 추가
	             $(".rank-others-div").append(othersHTML);
	         },
	         error: function() {
	             alert('월간 랭킹 데이터를 불러오는 데 실패했습니다.');
	         }
	     });
	 });


});
</script>

</head>
<body>
<%@ include file="../header.jsp" %>
<div class="rank-content">
    <div class="rank-title">
        <h2>Ranking</h2>
    </div>
    <div class="rank-category">
        <span>&nbsp;&nbsp;<a href="daily.do" id="daily" class="rank-category-link">일간</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="weekly.do" id="weekly" class="rank-category-link">주간</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="monthly.do" id="monthly" class="rank-category-link">월간</a>&nbsp;&nbsp;</span>
    </div>

    <!-- 랭킹 1위~3위 시작 -->
    <div class="rank-top3">
        <c:forEach var="daily" items="${d_rank}">
            <c:choose>
                <c:when test="${daily.rank == 1}">
                    <!-- 1위일 때 -->
                    <div class="top3">
                        <div class="rank-number">
                            <div class="rank-number-label">${daily.rank}</div>
                            <img src="resources/img/rank/rank1.png" alt="랭킹 1" width="60px" height="60px">
                        </div>
                        <div class="rank-info">
                            <div class="rank-poster"><img src="resources/img/musical/${daily.m_poster}" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
                            <div class="rank-subtitle"><a href="musicalDetail.do?m_code=${daily.m_code}">뮤지컬 &lt;&nbsp;${daily.m_title}&nbsp;&gt;</a></div>
                            <div class="rank-place">${daily.mh_name}</div>
                            <div class="rank-date">${daily.m_startdate} ~ ${daily.m_enddate}</div>
                            <div class="rank-salePercentage">예매율 <span>${daily.booking_rate} %</span></div>
                        </div>
                    </div>
                </c:when>
                <c:when test="${daily.rank == 2 || daily.rank == 3}">
                    <!-- 2위, 3위일 때 -->
                    <div class="top3">
                        <div class="rank-number">
                            <div class="rank-number-label2">${daily.rank}</div>
                            <img src="resources/img/rank/rank23.png" alt="랭킹 ${daily.rank}" width="60px" height="60px">
                        </div>
                        <div class="rank-info">
                            <div class="rank-poster"><img src="resources/img/musical/${daily.m_poster}" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
                            <div class="rank-subtitle"><a href="musicalDetail.do?m_code=${daily.m_code}">뮤지컬 &lt;&nbsp;${daily.m_title}&nbsp;&gt;</a></div>
                            <div class="rank-place">${daily.mh_name}</div>
                            <div class="rank-date">${daily.m_startdate} ~ ${daily.m_enddate}</div>
                            <div class="rank-salePercentage">예매율 <span>${daily.booking_rate} %</span></div>
                        </div>
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>
    </div>
    <!-- 랭킹 1위~3위 끝 -->

    <!-- 랭킹 4위~10위 시작 -->
    <div class="rank-others-div">
        <c:forEach var="daily" items="${d_rank}">
            <c:choose>
                <c:when test="${daily.rank > 3}">
                    <!-- 4위 이상일 때 -->
                    <div class="rank-others">
                        <div class="rank-number-others"><div class="rank-number-label-others">${daily.rank}</div></div>
                        <div class="rank-poster-others"><img src="resources/img/musical/${daily.m_poster}" alt="공연 포스터" width="150px" height="200px" style="border-radius: 10px;"></div>
                        <div class="rank-info-others">
                            <div class="rank-info-others-title"><a href="musicalDetail.do?m_code=${daily.m_code}">뮤지컬 &lt;&nbsp;${daily.m_title}&nbsp;&gt;</a></div>
                            <div class="rank-info-others-place">${daily.mh_name}</div>
                            <div class="rank-info-others-date">${daily.m_startdate} ~ ${daily.m_enddate}</div>
                            <div class="rank-info-others-percentage">${daily.booking_rate} %</div>
                        </div>
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>
    </div>
    <!-- 랭킹 4위~10위 끝 -->
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>
