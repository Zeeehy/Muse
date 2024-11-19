<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예매자 확인 페이지</title>
    <link rel="stylesheet" type="text/css" href="resources/css/Main.css">
    <link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
    <style>
        
    </style>
</head>
<body>
    <h1>예매자 확인 페이지</h1>
    <form id="reservationForm" action="reservCancle.do" method="post">
	    <input type="hidden" name="mh_code" value="${mh_code}">
	    <input type="hidden" name="m_code" value="${m_code}">
	    <input type="hidden" name="selectedDate" value="${selectedDate}">
	    <input type="hidden" name="selectedTime" value="${selectedTime}">
		<input type="hidden" name="selectedSeats" value=""> 
	
		<input type="hidden" name="usePoint" id="jusePoint" value="${usePoint}">
		<input type="hidden" name="ticketPrice" id="ticketPriceInput" value="0">
		<input type="hidden" name="jcancelDeadline" id="jcancelDeadline" value="${cancelDeadline}">
        <section class="reservWrap">
            <article class="contWrap">
                <header class="step">
                    <h2>03 예매자 확인</h2>
                    <h3>
                        <c:out value="${musicalInfo.M_TITLE}" default="뮤지컬 제목" /> 
                        <span> | <c:out value="${musicalInfo.MH_NAME}" default="극장명" /></span>
                    </h3>
                    <div class="select">
                        <em>다른 관람일자 선택 : </em>
                        <span>일자</span>
                        <select id="playDate">
                            <option selected><c:out value="${selectedDate}"/></option>
                        </select>
                        <span>시간</span>
                        <select id="playTime">
                            <option selected><c:out value="${selectedTime}"/></option>
                        </select>
                    </div>
                </header>
                <section class="allSeat">
                    <!-- 왼쪽 섹션 -->
                    <aside class="seatL" style="display: flex; flex-direction: column;">
                    	<div class="priceT" style="padding: 36px 36px 0 36px;">
                    	<p class="stit"><span>예매자 확인</span></p>
                    		<div class="priceList">
                    			<table>
	                    			<tr>
					                    <th>이름</th>
					                    <td><input type="text" value="${memberInfo.U_NAME}" readonly></td>
					                </tr>
					                <tr>
					                    <th>연락처</th>
					                    <td>
					                    <input type="text" id="pNum" style="background-color: #eaeaea;" value="" placeholder="[예시] 010-0000-0000">
					                    <p class="warning">*전화번호를 정확히 입력하세요. 본인 확인이 되지 않아 예매가 불가능 합니다.</p> 
					                    </td>
					                </tr>
					                <tr>
					                    <th>이메일</th>
					                    <td><input type="text" value="${memberInfo.U_EMAIL}" readonly></td>
					                </tr>
					            </table>
	                    	</div>
	                    </div>
                    	<div class="pointB" style="padding: 15px 36px;">
                    		<p class="stit"><span>티켓 수령 방법</span></p>
                    		<div style="padding: 25px; background: #fff;">
                    			<p style="color: #FF3D32; text-align:center;" ><b style="font-size: 20px; margin-right: 25px;">현장수령</b> 예매시 부여되는 "예약번호"로 관람일 당일 티켓을 수령하여 입장합니다.</p>
                    		</div>
                    	</div>
                    </aside>

                    
                    <!-- 오른쪽 섹션 -->
                    <aside class="seatR">
                        <div class="s inf">
                            <h2>나의 예매 정보</h2>
                            <div class="reservmInfo">
                                <div style="display: flex; gap: 15px; flex-direction: row; align-items: stretch;">
                                    <img src="">
                                    <ul class="mInfoList">
                                        <li><span><c:out value="${musicalInfo.M_TITLE}"/></span></li>
                                        <li>
                                        	<fmt:formatDate value="${musicalInfo.M_STARTDATE}" pattern="yyyy.MM.dd"/> ~ 
    										<fmt:formatDate value="${musicalInfo.M_ENDDATE}" pattern="yyyy.MM.dd"/>
    									</li>
                                        <li>${musicalInfo.MH_NAME}</li>
                                        <li>${musicalInfo.M_AGE}</li>
                                        <li>관람시간 : ${musicalInfo.M_TIME}분</li>
                                    </ul>
                                </div>
                                <table style="margin-top: 15px;">
                                    <tbody>
                                        <tr>
                                            <th>일시</th>
                                            <td><c:out value="${selectedDate}"/> <c:out value="${selectedTime}"/></td>
                                        </tr>
                                        <tr>
                                            <th>선택좌석<br>(${seatCount}석)</th>
                                            <td>
                                                <ul class="seatInf">
                                                    <c:forEach items="${selectedSeats}" var="seat">
                                                        <li>
												            ${seat.grade}석, ${seat.floor}층-${seat.section}블록, ${seat.row}열 ${seat.number}번
												        </li>
                                                    </c:forEach>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>티켓금액</th>
                                            <td>
                                                <c:set var="totalPrice" value="0"/>
                                                <c:forEach items="${selectedSeats}" var="seat">
                                                    <c:set var="totalPrice" value="${totalPrice + seat.price}"/>
                                                </c:forEach>
                                                <c:out value="${ticketPrice}"/>원
                                            </td>
                                        </tr>
                                        <tr>
										    <th>포인트 사용</th>
										    <td><b id="selectedPointAmount">${usePoint} P</b> 사용</td>
										</tr>
                                        <tr>
                                            <th>취소기한</th>
    										<td><b id="cancelDeadline">${jcancelDeadline != null ? jcancelDeadline : '취소기한이 설정되지 않았습니다.'}</b></td>
                                        </tr>
                                        <tr>
                                            <th>취소 수수료</th>
                                            <td><b>티켓금액의 0~30%</b></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="s Choice">
                            <h2>총 결제 금액</h2>
                            <div>
                                <span><b><c:out value="${ticketPrice - (usePoint != null ? usePoint : 0)}"/>원</b></span>
                            </div>
                        </div>
                        
                        <div class="s Button"> 
                            <div class="subBtList">
                                <button type="button" class="subBt" onclick="goBack()">이전단계</button>
                                <button type="button" class="subBt" style="background: #FF3D32; color: #fff;" onclick="Next()">다음단계</button>
                            </div>
                        </div>
                    </aside>
                </section>
            </article>
        </section>
    </form>
<script>
//이전단계
function goBack() {
    history.back();
}

//연락처 입력시 자동으로 하이픈 추가 (편리한듯..)
document.getElementById('pNum').addEventListener('input', function(e) {
    let value = e.target.value.replace(/[^0-9]/g, ''); // 숫자만 남기기
    
    if (value.length > 3 && value.length <= 7) {
        value = value.slice(0,3) + '-' + value.slice(3);
    } else if (value.length > 7) {
        value = value.slice(0,3) + '-' + value.slice(3,7) + '-' + value.slice(7,11);
    }
    
    e.target.value = value;
});

//좌석 정보를 JSON 문자열로 변환하는 함수
function prepareSeatsData() {
    const seatsData = [];
    const seatElements = document.querySelectorAll('.seatInf li');
    
    seatElements.forEach(seat => {
        const seatText = seat.textContent.trim();
        const [grade, location] = seatText.split(',');
        const [floor, section] = location.split('-');
        const [row, number] = seat.querySelector('span')?.textContent.split(' ') || [];
        
        seatsData.push({
            grade: grade.replace('석', '').trim(),
            floor: floor.replace('층', '').trim(),
            section: section.replace('블록', '').trim(),
            row: row.replace('열', '').trim(),
            number: number.replace('번', '').trim()
        });
    });
    
    return JSON.stringify(seatsData);
}

function Next(){
	const phoneInput = document.getElementById('pNum');
	const phoneValue = phoneInput.value.trim();
	const memberPnum = "${memberInfo.U_PNUM}"
	
	// 연락처 형식 검사
	const pNumCheck = /^010-\d{4}-\d{4}$/;
	
	// 빈 값인지 체크
	if(!phoneValue){
		alert('연락처를 입력해주세요.');
		return;
	}
	
	// 회원정보 형식(test) 맞는지 체크
	if(!pNumCheck.test(phoneValue)){
		alert("연락처 형식이 올바르지 않습니다. (예시:010-0000-0000)");
		return;
	}
	
	// 회원정보와 일치하는지 체크
	if(phoneValue !== memberPnum){
		alert("회원정보와 일치하지 않은 연락처 입니다.");
	} else {
		alert("회원정보와 일치합니다!");
        document.getElementById('reservationForm').submit();
	}	
	
	// 좌석 데이터 준비
    const seatsInput = document.querySelector('input[name="selectedSeats"]');
    seatsInput.value = prepareSeatsData();

    // 폼 데이터 검증
    if (!validateFormData()) {
        return;
    }
    
 	// 모든 검증을 통과하면 폼 제출
    try {
        document.getElementById('reservationForm').submit();
    } catch (error) {
        console.error('폼 제출 중 오류 발생:', error);
        alert('예매 진행 중 오류가 발생했습니다. 다시 시도해주세요.');
    }

}

//페이지 로드 시 초기화
document.addEventListener('DOMContentLoaded', function() {
    // 좌석 데이터 초기 설정
    const seatsInput = document.querySelector('input[name="selectedSeats"]');
    if (seatsInput) {
        seatsInput.value = prepareSeatsData();
    }

    // 티켓 가격 설정
    const ticketPriceInput = document.getElementById('ticketPriceInput');
    if (ticketPriceInput) {
        const totalPrice = Array.from(document.querySelectorAll('.seatInf li'))
            .reduce((sum, seat) => {
                const priceText = seat.getAttribute('data-price') || '0';
                return sum + parseInt(priceText, 10);
            }, 0);
        ticketPriceInput.value = totalPrice;
    }
});

</script>
</body>
</html>