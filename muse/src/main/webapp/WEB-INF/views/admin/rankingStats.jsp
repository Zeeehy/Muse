<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>파트너 판매 랭킹</title>

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
	 m_title: '${rankingStats.m_title}',  // 파트너 이름
     count: ${rankingStats.count} // 판매 티켓수
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



<figure class="highcharts-figure">
    <div id="container" style="margin-top: 200px;"></div>
    <p class="highcharts-description">
       공연별 티켓 판매 순위입니다. 해당 통계는 티켓 판매 수량(예매당 1장)으로 측정했습니다.
    </p>
<!--    <div id="sliders">
         <table>
            <tr>
                <td><label for="alpha">Alpha Angle</label></td>
                <td><input id="alpha" type="range" min="0" max="45" value="15"/> <span id="alpha-value" class="value"></span></td>
            </tr>
            <tr>
                <td><label for="beta">Beta Angle</label></td>
                <td><input id="beta" type="range" min="-45" max="45" value="15"/> <span id="beta-value" class="value"></span></td>
            </tr>
            <tr>
                <td><label for="depth">Depth</label></td>
                <td><input id="depth" type="range" min="20" max="100" value="50"/> <span id="depth-value" class="value"></span></td>
            </tr>
        </table> 
    </div>
 -->     
</figure>


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
        pointFormat: '티켓 갯수: {point.y}'
    },
    title: {
        text: '공연별 티켓 판매 순위'
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
		
		
		
	</body>
</html>
