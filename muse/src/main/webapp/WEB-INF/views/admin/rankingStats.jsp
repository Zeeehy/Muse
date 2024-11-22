<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>공연 판매 랭킹</title>
<link rel="stylesheet" href="/muse/resources/css/Ljh.css" type="text/css">
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
<!-- jQuery (Slick이 필요로 함) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
 <script>
 $(document).ready(function() {
 
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
	 
	 
	 $(".time").on("click", function() {
	        var page = $(this).data("time");  // 현재 페이지 정보 가져오기
	        console.log(page);
	        
	        $.ajax({
	            url: "rankingStatsTime.do",  // Ajax 요청 URL
	            type: "GET",
	            data: { page: page },  // page 번호를 요청 파라미터로 전송
	            dataType: "json", // JSON 응답을 기대
	            success: function(response) {
	            	console.log("데이터 성공: ", response);
	            	
	            	
	                var rankingStatsData = [];

	                // 서버에서 받은 데이터(response)로 rankingStatsData 배열에 항목 추가
	                response.lists.forEach(function(rankingStats) {
				        rankingStatsData.push({
				            m_title: rankingStats.m_title,  // 파트너 이름
				            count: rankingStats.count      // 판매 티켓수
				        });
  					 });	

	                // m_title 데이터만 추출하여 mTitleData 배열 생성
	                var mTitleData = rankingStatsData.map(function(item) {
	                    return item.m_title;
	                });

	                // count 데이터만 추출하여 countData 배열 생성
	                var countData = rankingStatsData.map(function(item) {
	                    return item.count;
	                });
	                
	                
	                chart.update({
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
	                        categories: mTitleData
	                    },
	                    series: [{
	                        data: countData,
	                        colorByPoint: true
	                    }]
	                });
	                
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
	             	
	            },
	            error: function(xhr, status, error) {
	                console.error("데이터 로딩 실패: ", error);
	            }
	        });
	    });
	 
		
	});
</script>

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

	<div style="margin-top: 200px;"> 
	   	<input class="time blueButton" type="button" value="1일" data-time="oneday">
	   	<input class="time blueButton" type="button" value="1주일" data-time="oneweek">
	   	<input class="time blueButton" type="button" value="1달" data-time="onemonth">
	   	<input class="time blueButton" type="button" value="전체" data-time="all">
	</div>

   	
    <div id="container" >
    </div>
    
    <p class="highcharts-description">
       공연별 티켓 판매 순위입니다. 해당 통계는 티켓 판매 수량(예매당 1장)으로 측정했습니다.
    </p>
<!-- 
    <div id="sliders">
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
