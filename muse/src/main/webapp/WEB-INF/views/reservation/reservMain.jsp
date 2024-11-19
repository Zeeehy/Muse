<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
<script src="/muse/resources/js/httpRequest.js"></script>
<style>
.seatIf_img {
	display: flex;
    gap: 10px;
    align-items: center;
}
.seatIf_img img{
	width: 15px;
    height: auto;
}
</style>
</head>
<body>
<h1>예매페이지</h1>
<form id="reservationForm" action="reservSale.do" method="post">
	<input type="hidden" name="mh_code" value="${mh_code}">
    <input type="hidden" name="m_code" value="${m_code}">
    <input type="hidden" name="selectedDate" id="formDate">
    <input type="hidden" name="selectedTime" id="formTime">
    <input type="hidden" name="selectedSeats" id="formSeats">
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
					            <c:when test="${date eq selectedDate}">
					                <c:choose>
					                    <c:when test="${dayOfWeek == '(토)'}">
					                        <option value="${date}" style="color: blue;" selected>${date}</option>
					                    </c:when>
					                    <c:when test="${dayOfWeek == '(일)'}">
					                        <option value="${date}" style="color: red;" selected>${date}</option>
					                    </c:when>
					                    <c:otherwise>
					                        <option value="${date}" selected>${date}</option>
					                    </c:otherwise>
					                </c:choose>
					            </c:when>
					            <c:otherwise>
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
					            </c:otherwise>
					        </c:choose>
					    </c:forEach>
					</select>
					
					<select id="playTime">
					    <option name="time" value="">선택하세요!</option>
					    <c:if test="${not empty selectedTime}">
					        <option value="${selectedTime}" selected>${selectedTime}</option>
					    </c:if>
					</select>
			    </div>
			</header>
            <section class="allSeat" >
                <aside class="seatL" style="display:none;">
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
                                <li>1F <input type="checkbox" name="floor" onclick="handleCheck(this)" value="1"></li>
                                <li>2 / 3F <input type="checkbox" name="floor" onclick="handleCheck(this)" value="2"></li>
                            </ul>
                        </div>
                    </div>
                    <div class="s Rating">
					    <h2>좌석등급 / 잔여석</h2>
					    <div>
						    <ul>
							    <c:forEach var="seatIf" items="${musicalPrice}" varStatus="a">
							        <li>
							            <div class="seatIf_img">
							                <c:choose>
							                    <c:when test="${seatIf.SG_NAME eq 'VIP'}">
							                        <img src="resources/img/reserv/seat_vip.png">
							                    </c:when>
							                    <c:when test="${seatIf.SG_NAME eq 'R'}">
							                        <img src="resources/img/reserv/seat_r.png">
							                    </c:when>
							                    <c:when test="${seatIf.SG_NAME eq 'S'}">
							                        <img src="resources/img/reserv/seat_s.png">
							                    </c:when>
							                    <c:when test="${seatIf.SG_NAME eq 'A'}">
							                        <img src="resources/img/reserv/seat_a.png">
							                    </c:when>
							                </c:choose>
							                ${seatIf.SG_NAME}석
    										<span class="remaining-seats" data-grade="${seatIf.SG_NAME}" style="margin-top: 2px; color:red;">0</span>
							            </div>
							            <span><fmt:formatNumber value="${seatIf.SP_PRICE}" pattern="#,###"/>원</span>
							        </li>
							    </c:forEach>
							</ul>
					    </div>
					</div>

                    <div class="s Choice">
                        <h2>선택좌석</h2>
                        <div>
                        </div>
                    </div>
                    <div class="s Button">
				        <button type="button" class="nextBt" onclick="validateAndSubmit()">좌석선택완료</button>
				        <div class="subBtList">
				            <button type="button" class="subBt" style="width:100%;">좌석 다시 선택</button>
				        </div>
				    </div>
                </aside>
            </section>
        </article>
    </section>
</form>
<script>
const style = document.createElement('style');
style.textContent = `
    .seat.selected {
        background-color: #FF9999;
        transition: background-color 0.3s ease;
    }
`;
document.head.appendChild(style);

//선택된 좌석들을 저장할 Set
const selectedSeats = new Set();

//현재 리뷰 중인 좌석 저장
let currentReviewSeat = null;

//공연 최대 매수
const MAX_SEATS = ${maxTickets}; // 컨트롤러에서 전달받은 값

// 선택좌석에 추가
function updateSelectedSeats() {
    const selectedSeatsDiv = document.querySelector('.s.Choice > div');
    selectedSeatsDiv.innerHTML = ''; // 초기화

    selectedSeats.forEach(function(seatInfo) {
        const p = document.createElement('p');
        p.textContent = '[' + seatInfo.grade + '석] ' + 
                       seatInfo.floor + '층-' + 
                       seatInfo.section + '블록 ' + 
                       seatInfo.row + '열 ' + 
                       seatInfo.number + '번';
        selectedSeatsDiv.appendChild(p);
    });
}

//좌석리뷰 창 표시
function showReview(seatInfo) {
    const reviewDiv = document.querySelector('.seatReview');
    if (reviewDiv) {
        const reviewText = reviewDiv.querySelector('p b');
        reviewText.textContent = `[${seatInfo.grade}석] ${seatInfo.floor}층-${seatInfo.section}블록 ${seatInfo.row}열 ${seatInfo.number}`;
        reviewDiv.style.display = 'block';
    }
}

// 좌석리뷰 창 닫기
function hideReview() {
    const reviewDiv = document.querySelector('.seatReview');
    if (reviewDiv) {
        reviewDiv.style.display = 'none';
    }
}

// 선택한 좌석 초기화
function resetSeatSelections() {
    // 좌석 리뷰 숨기기
    hideReview();
    
    // 선택한 좌석의 스타일 초기화
    document.querySelectorAll('.seat.selected').forEach(function(seat) {
        seat.classList.remove('selected');
    });
    
    // 선택된 좌석 목록 비우기
    selectedSeats.clear();
    
    // 선택좌석 div 비우기
    const selectedSeatsDiv = document.querySelector('.s.Choice > div');
    if (selectedSeatsDiv) {
        selectedSeatsDiv.innerHTML = '';
    }
}

// 좌석과 잔여석 초기화 함수
function resetSeatsAndCount() {
    // 좌석 영역 숨기기
    const seatL = document.querySelector('.seatL');
    seatL.style.display = 'none';
    
    // 잔여석 초기화
    document.querySelectorAll('.remaining-seats').forEach(element => {
        element.textContent = '0';
    });
    
    // 선택된 좌석 초기화
    resetSeatSelections();
}

// 날짜, 시간 선택 상태 확인 함수
function isValidSelection() {
    const playDate = document.getElementById('playDate').value;
    const playTime = document.getElementById('playTime').value;
    return playDate && 
           playTime && 
           playDate !== '선택하세요!' && 
           playTime !== '' && 
           playTime !== '선택하세요!';
}

// 좌석 표시 여부 확인
function checkSeatVisibility() {
    const seatL = document.querySelector('.seatL');
    
    if (isValidSelection()) {
        seatL.style.display = 'block';
    } else {
        seatL.style.display = 'none';
        resetSeatSelections();
    }
}

//파라미터 체크 함수 추가
function hasTimeParameters() {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.has('selectedDate') && urlParams.has('selectedTime');
}

// 해당 날짜의 시간옵션 가져오기
function updateTimes(event) {
    const selectedDate = event.target.value;
    const playTimeSelect = document.getElementById('playTime');
    const urlParams = new URLSearchParams(window.location.search);
    
    // 선택이 유효하지 않으면 모든 것을 초기화
    if (selectedDate === '선택하세요!') {
        resetSeatsAndCount();
        playTimeSelect.innerHTML = "<option value=''>선택하세요!</option>";
        return;
    }
    
    // **날짜 변경 시에만** 파라미터 체크 후 1F로 리다이렉트
    if (event.type === 'change' && hasTimeParameters()) {
        window.location.href = '/muse/reservMain.do?mh_code=${mh_code}&m_code=${m_code}&sl_bind=1';
        return;
    }
    
    // 잔여석 초기화
    document.querySelectorAll('.remaining-seats').forEach(element => {
        element.textContent = '0';
    });
    
    // 좌석 영역 숨기기
    const seatL = document.querySelector('.seatL');
    seatL.style.display = 'none';
    
    // 선택된 좌석 초기화
    resetSeatSelections();
    
    // 새로운 날짜의 시간 옵션을 가져오기
    const param = 'selectedDate=' + selectedDate;
    sendRequest('searchTime.do', param, updateTimesResult, 'GET');
}


// 시간옵션 처리
function updateTimesResult() {
    if (XHR.readyState === 4 && XHR.status === 200) {
        var data = JSON.parse(XHR.responseText);
        var playTimeSelect = document.getElementById('playTime');
        
        // 시간 선택 초기화
        playTimeSelect.innerHTML = "<option value=''>선택하세요!</option>";
        
        // 새로운 시간 옵션 추가
        if (data.playTime && data.playTime.length > 0) {
            data.playTime.forEach(function(time) {
                var option = document.createElement("option");
                option.value = time;
                option.textContent = time;
                playTimeSelect.appendChild(option);
            });
        }
        
        // URL에서 선택된 시간 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        const selectedTime = urlParams.get('selectedTime');
        
        // 이전에 선택된 시간이 있으면 설정
        if (selectedTime && data.playTime.includes(selectedTime)) {
            playTimeSelect.value = selectedTime;
            
            // 날짜와 시간이 모두 유효하면 좌석과 잔여석 표시
            if (isValidSelection()) {
                checkSeatVisibility();
                updateRemainingSeat();
                updateReservedSeat();
            }
        } else {
            resetSeatsAndCount();
        }
    }
}

// 예약된 좌석 목록 다시 가져오는 함수
function updateReservedSeat(){
    const playDate = document.getElementById('playDate').value;
    const playTime = document.getElementById('playTime').value;
	const param = 'm_code=${m_code}&selectedDate='+playDate+'&selectedTime='+playTime;
    sendRequest('updateReservedSeat.do', param, function(){
        if (XHR.readyState === 4 && XHR.status === 200) {

            const data = XHR.responseText;
            seatList = JSON.parse(data);
            
            //초기화
            var disablearr = document.querySelectorAll('.disabled');
            
            disablearr.forEach(function(dis){
            	dis.classList.remove('disabled');
            	dis.style.pointerEvents = 'auto'; // 또는 'auto'
            	dis.style.opacity = '1';
            	
            	
            });
            
            
            
            seatList.forEach(function(r_seat){
            	
            	if(r_seat.reservation_status==0){
            		const seatElement = document.getElementById(r_seat.s_code);
            		
                    seatElement.classList.add('disabled'); // 비활성화 스타일 추가
                    seatElement.style.pointerEvents = 'none'; // 클릭 막기
                    seatElement.style.opacity = '0.5';
            	}
            	
            });
            
            
        }
    }, 'GET');

}

//잔여석 업데이트 함수
function updateRemainingSeat() {
    if (!isValidSelection()) {
        resetSeatsAndCount();
        return;
    }
    const playDate = document.getElementById('playDate').value;
    const playTime = document.getElementById('playTime').value;
    const sl_bind = new URLSearchParams(window.location.search).get('sl_bind') || "1";
    
    const param = 'selectedDate=' + playDate + 
                 '&selectedTime=' + playTime + 
                 '&mh_code=${mh_code}&m_code=${m_code}' +
                 '&sl_bind=' + sl_bind;
    
    sendRequest('getRemainingSeat.do', param, handleRemainingSeatResponse, 'GET');
}

function handleRemainingSeatResponse() {
    if (XHR.readyState === 4 && XHR.status === 200) {
        const data = JSON.parse(XHR.responseText);
        
        const seatElements = document.querySelectorAll('.seatIf_img span');
        
        seatElements.forEach(element => {
            const gradeText = element.parentElement.textContent.trim();
            const grade = gradeText.split('석')[0];
            
            if (data[grade] !== undefined) {
                element.textContent = data[grade];
            } else {
                element.textContent = '0';
            }
        });
    }
}

// 체크박스 처리 함수
function handleCheck(checkbox) {
    var checkboxes = document.getElementsByName('floor');
    checkboxes.forEach(function(item) {
        if (item === checkbox) {
            item.checked = true;
            item.closest('li').classList.add('checked');
        } else {
            item.checked = false;
            item.closest('li').classList.remove('checked');
        }
    });

    const sl_bind = checkbox.value;
    const selectedDate = document.getElementById('playDate').value;
    const selectedTime = document.getElementById('playTime').value;

    // URL 구성 - 유효한 선택일 때만 날짜와 시간 포함
    let url = '/muse/reservMain.do?mh_code=${mh_code}&m_code=${m_code}&sl_bind=' + sl_bind;
    
    if (isValidSelection()) {
        url += '&selectedDate=' + encodeURIComponent(selectedDate);
        url += '&selectedTime=' + encodeURIComponent(selectedTime);
    }

    window.location.href = url;
}

//DOM 로드 후 이벤트 리스너 등록
document.addEventListener('DOMContentLoaded', function() {
    // 초기 상태 설정
    const seatL = document.querySelector('.seatL');
    const selectedDate = '${selectedDate}';
    const selectedTime = '${selectedTime}';
    seatL.style.display = 'none';
    
    // 층수 체크박스 초기 설정
    const sl_bind = new URLSearchParams(window.location.search).get('sl_bind') || "1";
    const checkboxes = document.querySelectorAll('input[name="floor"]');
    
    checkboxes.forEach(checkbox => {
        if (checkbox.value === sl_bind) {
            checkbox.checked = true;
            checkbox.closest('li').classList.add('checked');
        } else {
            checkbox.checked = false;
            checkbox.closest('li').classList.remove('checked');
        }
    });
    
    // 선택된 날짜가 있으면 시간 옵션 가져오기
    if(selectedDate) {
        var event = {
            target: {
                value: selectedDate
            }
        };
        updateTimes(event);
    }
    
    // 날짜와 시간이 모두 선택되어 있으면 좌석 보이기
    if(isValidSelection()) {
        seatL.style.display = 'block';
        updateRemainingSeat();
        updateReservedSeat();
    } else {
        seatL.style.display = 'none';
    }
    
    // 날짜 변경 이벤트
    document.getElementById('playDate').addEventListener('change', function(event) {
        const selectedValue = event.target.value;
        
        if (selectedValue === '선택하세요!') {
            resetSeatsAndCount();
        } else if (hasTimeParameters()) {
            // 파라미터가 있는 상태에서 날짜 변경시에만 1F로 리다이렉트
            window.location.href = '/muse/reservMain.do?mh_code=${mh_code}&m_code=${m_code}&sl_bind=1';
        } else {
            resetSeatSelections();
            updateTimes(event);
        }
    });

    // 시간 변경 이벤트
    document.getElementById('playTime').addEventListener('change', function() {
        if (!isValidSelection()) {
            resetSeatsAndCount();
        } else {
            checkSeatVisibility();
            updateRemainingSeat();
            updateReservedSeat();
        }
    });
    
    // 좌석 다시 선택 버튼 이벤트
    document.querySelector('.subBtList .subBt').addEventListener('click', function(event) {
        if (!event.target.classList.contains('nextBt')) {
            event.preventDefault(); // 다른 버튼만 기본 동작 방지
            resetSeatSelections();
        }
    });
});

function validateAndSubmit() {
    const playDate = document.getElementById('playDate').value;
    const playTime = document.getElementById('playTime').value;
    
    if (!playDate || playDate === '선택하세요!') {
        alert('공연 날짜를 선택해주세요.');
        return false;
    }
    
    if (!playTime || playTime === '선택하세요!') {
        alert('공연 시간을 선택해주세요.');
        return false;
    }
    
    if (selectedSeats.size === 0) {
        alert('좌석을 선택해주세요.');
        return false;
    }

    // hidden 필드에 값 설정
    document.getElementById('formDate').value = playDate;
    document.getElementById('formTime').value = playTime;
    
    // 선택된 좌석 정보를 JSON 문자열로 변환하여 저장
    const seatsArray = Array.from(selectedSeats);
    document.getElementById('formSeats').value = JSON.stringify(seatsArray);
    
    console.log('히어');
    console.log(seatsArray);
    alert(seatsArray);

    
    // 폼 제출
    document.getElementById('reservationForm').submit();
    return true;
}

 //좌석 클릭 이벤트

// 좌석 리뷰 UI 업데이트 함수
/* 
 * 
 중복된 함수
 function updateSeatReview(avgScore, seatInfo) {
    const reviewDiv = document.querySelector('.seatReview');
    if (reviewDiv) {
        reviewDiv.querySelector('p').innerHTML = `
            선택하신 <b>[${seatInfo.section}석 ${seatInfo.floor}층-${seatInfo.section}블록 ${seatInfo.row}열 ${seatInfo.position}번]</b>
            좌석의 평균 평점은 (${avgScore.toFixed(1)}) 입니다.
        `;
        reviewDiv.style.display = 'block';
    }
} */
</script>
</body>
</html>
