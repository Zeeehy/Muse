<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
<script src="/muse/resources/js/httpRequest.js"></script>
</head>
<body>
<h1>예매페이지</h1>
<form>
    <section class="reservWrap">
        <article class="contWrap">
            <header class="step">
			    <h2>01 좌석 선택</h2>
			    <h3>[ ${musicalInfo.M_TITLE} ] <span> | ${musicalInfo.MH_NAME}</span></h3>
			    <div class="select">
			        <em>다른 관람일자 선택 : </em>
			        <span>일자</span>
			        <select id="playDate" onchange="updateTimes(event)">
			            <option>선택하세요!</option>
			            <c:forEach var="date" items="${playDate}">
			                <c:set var="dayOfWeek" value="${date.split(' ')[1]}" />
			                <c:choose>
			                    <c:when test="${dayOfWeek == '(토)'}">
			                        <option value="${date}" style="color: blue;">${date}</option>
			                    </c:when>
			                    <c:when test="${dayOfWeek == '(일)'}">
			                        <option value="${date}" style="color: red;">${date}</option>
			                    </c:when>
			                    <c:otherwise>
			                        <option value="${date}">${date}</option>
			                    </c:otherwise>
			                </c:choose>
			            </c:forEach>
			        </select>
			        <span>시간</span>
			        <select id="playTime">
			            <option name="time" value="">선택하세요!</option>
			        </select>
			    </div>
			</header>
            <section class="allSeat">
                <aside class="seatL">
					<%@ include file="/WEB-INF/views/reservation/reservSeat.jsp" %>
					<div class="seatReview" style="display: none;">
						<p>선택하신 좌석 <b>[R석] 1층-C블록 5열 6</b>의 평균 평점은 (5.0) 입니다.</p>
						<span>좌석 상세 리뷰  보기 ></span>
					</div>
                </aside>
                <aside class="seatR">
                    <div class="s Floor">
                        <h2>원하시는 좌석 위치를 선택해주세요.</h2>
                        <div>
                            <ul>
                                <li>1F <input type="checkbox"></li>
                                <li>2 / 3F <input type="checkbox"></li>
                            </ul>
                        </div>
                    </div>
                    <div class="s Rating">
                        <h2>좌석등급 / 잔여석</h2>
                        <div>
                            <ul>
                                <li>
                                    <div>
                                        <img src="#">VIP석
                                        <span>0석</span>
                                    </div>
                                    <span>170,000원</span>
                                </li>
                                <li>
                                    <div>
                                        <img src="#">R석
                                        <span>0석</span>
                                    </div>
                                    <span>140,000원</span>
                                </li>
                                <li>
                                    <div>
                                        <img src="#">S석
                                        <span>0석</span>
                                    </div>
                                    <span>110,000원</span>
                                </li>
                                <li>
                                    <div>
                                        <img src="#">A석
                                        <span>0석</span>
                                    </div>
                                    <span>80,000원</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="s Choice">
                        <h2>선택좌석</h2>
                        <div>
                        </div>
                    </div>
                    <div class="s Button">
                        <button class="nextBt">좌석선택완료</button>
                        <div class="subBtList">
                            <button class="subBt">이전단계</button>
                            <button class="subBt">좌석 다시 선택</button>
                        </div>
                    </div>
                </aside>
            </section>
        </article>
    </section>
</form>
<script>
	//선택된 날짜의 시간 옵션을 가져오기
	function updateTimes(event) {
	    var selectedDate = event.target.value;
	    var param = 'selectedDate=' + selectedDate;
	    console.log(param);
	    sendRequest('searchTime.do', param, updateTimesResult, 'GET');
	}
	
	// 시간 옵션 처리 함수
	function updateTimesResult() {
	    if (XHR.readyState === 4 && XHR.status === 200) {
	        var optionTimeList = XHR.responseText;
	        var data = JSON.parse(optionTimeList); 
	        var playTimeSelect = document.getElementById('playTime'); 
	        playTimeSelect.innerHTML = "<option>선택하세요!</option>"; 
			console.log(data);
	        // 각 시간 옵션을 select 요소에 추가
	        
	        for (var i = 0; i < data.playTime.length; i++) {
	            var time = data.playTime[i];
	            var optionElement = document.createElement("option");
	            optionElement.value = time;
	            optionElement.textContent = time;
	            playTimeSelect.appendChild(optionElement);
	        }
	    }
	}
</script>
<script>
//선택된 좌석들을 저장할 Set
const selectedSeats = new Set();
//현재 리뷰 중인 좌석을 추적
let currentReviewSeat = null;
//최대 선택 가능한 좌석 수 설정
const MAX_SEATS = ${maxTickets}; // 컨트롤러에서 전달받은 값

//CSS 스타일 추가
const style = document.createElement('style');
style.textContent = `
    .seat.selected {
        background-color: #FF9999;
        transition: background-color 0.3s ease;
    }
    .seat[data-grade="VIP"] {
        background-color: #FFD700 !important;
    }
    .seat[data-grade="R"] {
        background-color: #87CEEB !important;
    }
    .seat[data-grade="S"] {
        background-color: #98FB98 !important;
    }
    .seat[data-grade="A"] {
        background-color: #DDA0DD !important;
    }
`;
document.head.appendChild(style);

//선택된 날짜의 시간 옵션을 가져오기
function updateTimes(event) {
  var selectedDate = event.target.value;
  var param = 'selectedDate=' + selectedDate;
  console.log(param);
  sendRequest('searchTime.do', param, updateTimesResult, 'GET');
}

//시간 옵션 처리 함수
function updateTimesResult() {
  if (XHR.readyState === 4 && XHR.status === 200) {
      var optionTimeList = XHR.responseText;
      var data = JSON.parse(optionTimeList); 
      var playTimeSelect = document.getElementById('playTime'); 
      playTimeSelect.innerHTML = "<option>선택하세요!</option>"; 
      console.log(data);
      // 각 시간 옵션을 select 요소에 추가
      
      for (var i = 0; i < data.playTime.length; i++) {
          var time = data.playTime[i];
          var optionElement = document.createElement("option");
          optionElement.value = time;
          optionElement.textContent = time;
          playTimeSelect.appendChild(optionElement);
      }
  }
}

//updateSelectedSeats 함수 추가
function updateSelectedSeats() {
    const selectedSeatsDiv = document.querySelector('.s.Choice > div');
    selectedSeatsDiv.innerHTML = '';

    selectedSeats.forEach(function(seatInfo) {
        const p = document.createElement('p');
        p.textContent = '[' + seatInfo.grade + '석] ' + seatInfo.floor + '층-' + seatInfo.section + '블록 ' + seatInfo.row + '열 ' + seatInfo.number + '번';
        selectedSeatsDiv.appendChild(p);
    });
}

</script>

</body>
</html>
