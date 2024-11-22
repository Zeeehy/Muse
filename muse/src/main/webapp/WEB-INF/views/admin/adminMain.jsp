<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>관리자 메인</title>
		
<link rel="stylesheet" href="/muse/resources/css/Ljh.css" type="text/css">
<link rel="stylesheet" href="/muse/resources/css/Phj.css" type="text/css">

<style type="text/css">
#container {
    height: 400px;
}

.highcharts-figure,
.highcharts-data-table table {
    min-width: 310px;
    max-width: 800px;
    margin: 1em auto;
}

#sliders td input[type="range"] {
    display: inline;
}

#sliders td {
    padding-right: 1em;
    white-space: nowrap;
}

.cnt{
	color:#6363f7;
	margin:5px;
}

.main-content {
    display: block !important;
    flex-direction: column;
    margin-left: 250px;
    margin-top: 60px;
    padding: 20px;
    align-items: center;
}

		</style>
	</head>
<body>

<script src="/muse/resources/Highcharts-10.3.1/code/highcharts.js"></script>
<script src="/muse/resources/Highcharts-10.3.1/code/highcharts-3d.js"></script>
<script src="/muse/resources/Highcharts-10.3.1/code/modules/exporting.js"></script>
<script src="/muse/resources/Highcharts-10.3.1/code/modules/export-data.js"></script>
<script src="/muse/resources/Highcharts-10.3.1/code/modules/accessibility.js"></script>	
	
	
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<script>
var rankingStatsData = [];

//JSTL로 데이터를 반복하여 Highcharts 데이터 배열에 추가
<c:forEach var="rankingStats" items="${lists}">
rankingStatsData.push({
	 m_title: '${rankingStats.m_title}',  // 공연이름
     count: ${rankingStats.booking_rate} // 랭킹
 });
</c:forEach>

var mTitleData = rankingStatsData.map(function(item) {
	 return item.m_title;
	});

var countData = rankingStatsData.map(function(item) {
	 return item.count;
	});
</script>	
	

<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>


<div class="main-content">

	<div style="margin-top:30px; margin-left:30px;">
		<strong style="font-size:30pt;">관리자님 안녕하세요😊<strong>
	
		<div style="margin-top:30px; font-size:15pt;">
			<a href="addRequestList.do">공연등록 <b class="cnt">${insertCnt}</b></a> <a href="openRequestList.do">오픈공지 <b class="cnt">${openCnt}</b></a>
			<a href="addApplyList.do">공연반영 <b class="cnt">${insertApply}</b></a> <a href="openApplyList.do">오픈공지반영 <b class="cnt">${openApply}</b></a> 
		</div>

		<div style="margin-top:10px; font-size:15pt;">
			오늘하루 판매된 티켓은 <b class="cntUp" id="ticket-count">${cnt}</b>건, 티켓 판매 금액은 <b id="ticket-price" class="cntUp">${price}</b>원 입니다.
		</div>
		
	</div>



	<figure class="highcharts-figure">
	    <div id="container" style="margin-top: 100px;"></div>
	    <p class="highcharts-description">
	       
	    </p>
	</figure>


</div>





<script type="text/javascript">

//애니메이션 적용
setTimeout(function() {
    chart.update({
        chart: {
            options3d: {
                alpha: 6  // 3초 동안 alpha 값이 6으로 변함
            }
        }
    }, 3000);  // 3초 후에 애니메이션 시작
}, 500);  // 1초 후에 애니메이션 시작


const chart = new Highcharts.Chart({
    chart: {
        renderTo: 'container',
        type: 'column',
        options3d: {
            enabled: true,
            alpha: 45,
            beta: 15,
            depth: 50,
            viewDistance: 25
        }
    },
    xAxis: {
        categories:mTitleData
    },
    yAxis: {
        title: {
            enabled: false
        }
    },
    tooltip: {
        headerFormat: '<b>{point.key}</b><br>',
        pointFormat: '예매율: {point.y}%'
    },
    title: {
        text: '주간 공연 예매율 순위'
    },
    subtitle: {

    },
    legend: {
        enabled: false
    },
    plotOptions: {
        column: {
            depth: 25
        }
    },
    series: [{
        data: countData,
        colorByPoint: true
    }]
});

function showValues() {
    document.getElementById('alpha-value').innerHTML = chart.options.chart.options3d.alpha;
    document.getElementById('beta-value').innerHTML = chart.options.chart.options3d.beta;
    document.getElementById('depth-value').innerHTML = chart.options.chart.options3d.depth;
}

// Activate the sliders
document.querySelectorAll('#sliders input').forEach(input => input.addEventListener('input', e => {
    chart.options.chart.options3d[e.target.id] = parseFloat(e.target.value);
    showValues();
    chart.redraw(false);
}));

showValues();
</script>


  <script>
    /**
     * 숫자 애니메이션 함수
     * @param {string} elementId - 변경할 요소의 ID
     * @param {number} start - 시작 값
     * @param {number} end - 종료 값
     * @param {number} duration - 애니메이션 지속 시간 (ms)
     */
     function animateNumber(elementId, start, end, duration) {
         const element = document.getElementById(elementId);
         const stepCount = Math.min(30, end - start); // 최대 100단계로 제한
         const stepTime = Math.max(10, Math.floor(duration / stepCount)); // 최소 10ms 간격
         const increment = Math.ceil((end - start) / stepCount); // 증가 폭 계산
         let current = start;

         const timer = setInterval(() => {
           current = Math.min(current + increment, end); // 증가 폭만큼 더하기
           element.textContent = current.toLocaleString(); // 숫자 포맷
           if (current >= end) {
             clearInterval(timer); // 종료 값에 도달하면 애니메이션 정지
           }
         }, stepTime);
       }

    document.addEventListener('DOMContentLoaded', () => {
      const finalTicketCount = ${cnt}; // 최종 티켓 수
      const finalPrice = ${ticketPrice}; // 최종 금액

      // 애니메이션 실행
      animateNumber('ticket-count', 0, finalTicketCount, 3500); // 2초 동안 증가
      animateNumber('ticket-price', 0, finalPrice, 3500, 1000); // 2초 동안 증가
    });
  </script>		
		
		
	</body>
</html>
