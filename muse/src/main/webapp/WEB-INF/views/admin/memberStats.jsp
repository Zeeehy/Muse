<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Ljh.css" type="text/css">
<style type="text/css">
.highcharts-figure,
.highcharts-data-table table {
    min-width: 360px;
    max-width: 800px;
    margin: 1em auto;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #ebebeb;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}

.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}

.highcharts-data-table th {
    font-weight: 600;
    padding: 0.5em;
}

.highcharts-data-table td,
.highcharts-data-table th,
.highcharts-data-table caption {
    padding: 0.5em;
}

.highcharts-data-table thead tr,
.highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}

.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

</style>



</head>

<script src="/muse/resources/Highcharts-10.3.1/code/highcharts.js"></script>
<script src="/muse/resources/Highcharts-10.3.1/code/modules/series-label.js"></script>
<script src="/muse/resources/Highcharts-10.3.1/code/modules/exporting.js"></script>
<script src="/muse/resources/Highcharts-10.3.1/code/modules/export-data.js"></script>
<script src="/muse/resources/Highcharts-10.3.1/code/modules/accessibility.js"></script>



<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>


<div style="margin-top: 200px;">
	<figure class="highcharts-figure">
	    <div id="container"></div>
	    <p class="highcharts-description">
	        뮤즈 회원의 증가량과 뮤즈패스 회원의 증가량을 보여주는 그래프입니다.
	    </p>
	</figure>
</div>




<script type="text/javascript">

var memberStatsData = [];

// JSTL로 데이터를 반복하여 Highcharts 데이터 배열에 추가
<c:forEach var="memberStats" items="${lists}">
    memberStatsData.push({
        joinMonth: '${memberStats.joinMonth}',  // 가입 월
        memberTotal: ${memberStats.memberTotal}, // 누적회원수
        museTotal: ${memberStats.museTotal}  // 뮤즈 회원수
    });
</c:forEach>

// Highcharts용 데이터 형식 변환
var joinMonthCategories = memberStatsData.map(function(item) {
    return Date.parse(item.joinMonth + "-01"); // 'YYYY-MM'을 timestamp로 변환
});

var memberTotalData = memberStatsData.map(function(item) {
    return item.memberTotal;
});

var museTotalData = memberStatsData.map(function(item) {
    return item.museTotal;
});

var pointStart = joinMonthCategories[0];

// Highcharts 설정
Highcharts.chart('container', {
    title: {
        text: '뮤즈회원 증가량 & 뮤즈패스 회원 증가량'
    },
    yAxis: {
        title: {
            text: '회원 수'
        }
    },
    xAxis: {
        type: 'datetime',
        labels: {
            format: '{value:%Y-%m}', // 날짜 형식을 YYYY-MM으로 지정
            step: 1 // 모든 포인트의 라벨 출력
        },
        tickInterval: 30 * 24 * 3600 * 1000 // 한 달 간격
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },
    plotOptions: {
        series: {
            label: {
                connectorAllowed: false
            },
            pointStart: pointStart, // 기준 시작 날짜
            pointInterval: 30 * 24 * 3600 * 1000 // 한 달 간격
        }
    },
    series: [{
        name: '회원 총 수',
        data: memberTotalData // 누적회원수 데이터
    }, {
        name: '뮤즈패스 회원 총 수',
        data: museTotalData // 뮤즈회원수 데이터
    }],
    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                legend: {
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom'
                }
            }
        }]
    }
});
</script>

</body>
</html>