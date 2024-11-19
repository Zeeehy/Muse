<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

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
    	 //categories: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
        type: "datetime",
        tickInterval: 30 * 24 * 3600 * 1000
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
            //pointStart: "1월"
            pointStart: (function() {
                const now = new Date(); // 현재 시간
                now.setFullYear(now.getFullYear() - 1); // 1년 전
                return Date.UTC(now.getFullYear(), now.getMonth(), now.getDate());
            })(),
			pointInterval: 30 * 24 * 3600 * 1000
        }
    },

    series: [ {
        name: '회원 총 수',
        data: [null, null, null, null, null, null, null,
            null, 11164, 11218, 10077]
    }, {
        name: '뮤즈패스 회원 총 수',
        data: [21908, 5548, 8105, 11248, 8989, 11816, 18274,
            17300, 13053, 11906, 10073]
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