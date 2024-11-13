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
                                <li>2F <input type="checkbox"></li>
                                <li>3F <input type="checkbox"></li>
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
// 현재 리뷰 중인 좌석을 추적
let currentReviewSeat = null;
// 최대 선택 가능한 좌석 수 설정
const MAX_SEATS = ${maxTickets}; // 템플릿 리터럴 제거

// CSS 스타일 추가
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

// setSeats 함수 수정
function setSeats(section_div, rowLayout) {
    var seatsData = rowLayout.sl_data.split('.');    
    var seats_div = document.createElement('div');
    seats_div.classList.add('row');
    var seatNum = 0;
    
    seatsData.forEach((seat, index) => {
        if(seat === 's') {
            seatNum++;
            var seat_div = document.createElement('div');
            seat_div.classList.add('seats');
            
            const floorMap = floorSeatMap.get(rowLayout.sl_floor);
            let seatGrade = 'R'; // 기본값

            if (floorMap) {
                const sectionMap = floorMap.get(rowLayout.sl_section);
                if (sectionMap) {
                    const rowMap = sectionMap.get(rowLayout.sl_row);
                    if (rowMap) {
                        const positionSeats = rowMap.get(seatNum);
                        if (positionSeats && positionSeats[0]) {
                            seatGrade = positionSeats[0].sg_name;
                        }
                    }
                }
            }

            // rowLayout 정보를 좌석 div에 저장
            seat_div.rowLayout = rowLayout;
            seat_div.innerHTML = `<div class="seat" id="ps_${seatNum}" data-grade="${seatGrade}"><p>${seatNum}</p></div>`;
            
            seats_div.appendChild(seat_div);
            
            seat_div.addEventListener('click', function(event) {
                const seatElement = event.target.closest('.seat');
                if (!seatElement) return;
                
                const seatReviewDiv = document.querySelector('.seatReview');
                const isSelected = Array.from(selectedSeats).find(seat => seat.element === seatElement);

                if (isSelected) {
                    // 선택 해제
                    selectedSeats.delete(isSelected);
                    seatElement.classList.remove('selected');
                    
                    if (currentReviewSeat === seatElement) {
                        seatReviewDiv.style.display = 'none';
                        currentReviewSeat = null;
                    }
                } else {
                	if (selectedSeats.size >= MAX_SEATS) {
                	    const message = "최대 " + MAX_SEATS + "개의 좌석까지만 선택할 수 있습니다.";

                	    alert(message);
                	    return;
                	}

                    const seatInfo = {
                        id: seatElement.id,
                        grade: seatElement.getAttribute('data-grade'),
                        floor: rowLayout.sl_floor,
                        section: rowLayout.sl_section,
                        row: rowLayout.sl_row,
                        number: seatNum,
                        element: seatElement
                    };

                    selectedSeats.add(seatInfo);
                    seatElement.classList.add('selected');

                    // 리뷰 정보 업데이트
                    if (seatReviewDiv) {
                        seatReviewDiv.querySelector('p').innerHTML = 
                            `선택하신 좌석 <b>[${seatInfo.grade}석] ${seatInfo.floor}층-${seatInfo.section}블록 ${seatInfo.row}열 ${seatInfo.number}번</b>의 평균 평점은 (5.0) 입니다.`;
                        seatReviewDiv.style.display = 'block';
                        currentReviewSeat = seatElement;
                    }
                }
                
                // 선택 좌석 목록 업데이트
                updateSelectedSeats();
            });
        } else if (seat === 'e') {
            var empty_seat_div = document.createElement('div');
            empty_seat_div.classList.add('seat');
            seats_div.appendChild(empty_seat_div);
        }
    });
    
    section_div.appendChild(seats_div);
}

// 선택된 좌석 목록을 업데이트하는 함수
function updateSelectedSeats() {
    const selectedSeatsDiv = document.querySelector('.s.Choice > div');
    selectedSeatsDiv.innerHTML = '';
    
    selectedSeats.forEach(seatInfo => {
        const p = document.createElement('p');
        p.textContent = `[${seatInfo.grade}석] ${seatInfo.floor}층-${seatInfo.section}블록 ${seatInfo.row}열 ${seatInfo.number}번`;
        selectedSeatsDiv.appendChild(p);
    });
}
</script>

</body>
</html>
