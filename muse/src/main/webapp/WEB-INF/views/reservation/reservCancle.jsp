<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 아임포트 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="resources/css/Main.css">
    <link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
    <style>
        .priceList table {
            width: 100%;
            border-collapse: collapse;
        }
        .priceList th, .priceList td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: left;
            font-size: 14px;
        }
        .priceList th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .priceList .highlight {
            color: red;
        }
        .warning {
            font-size: 14px;
            color: red;
            margin-top: 5px;
        }
        .consent {
            margin-top: 20px;
		    font-size: 13px;
			border: 1px solid;
			padding: 15px;
        }
        .checkbox-group {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>취소수수료 페이지</h1>
    <form name="reservationForm" action="#" method="post">
   		<input type="hidden" name="mh_code" value="${mh_code}">
	    <input type="hidden" name="m_code" value="${m_code}">
	    <input type="hidden" name="selectedDate" value="${selectedDate}">
	    <input type="hidden" name="selectedTime" value="${selectedTime}">
		<input type="hidden" name="selectedSeats" value=""> 
		<input type="hidden" name="usePoint" id="jusePoint" value="${usePoint}">
		<input type="hidden" name="discount" value="${discount}">
    	<input type="hidden" name="ticketPrice" value="${ticketPrice}">
    	<input type="hidden" name="totalPrice" value="${ticketPrice - (usePoint != null ? usePoint : 0)}">
		<input type="hidden" name="jcancelDeadline" id="jcancelDeadline" value="${jcancelDeadline}">
		<input type="hidden" name="s_id" value="${s_id}">
        <section class="reservWrap">
            <article class="contWrap">
                <header class="step">
                    <h2>04 취소수수료</h2>
                    <h3>${musicalInfo.M_TITLE}<span> | ${musicalInfo.MH_NAME}</span></h3>
                    <div class="select">
				        <em>다른 관람일자 선택 : </em>
				        <span>일자</span>
				        <select id="playDate">
				            <option selected>${selectedDate}</option>
				        </select>
				        <span>시간</span>
				        <select id="playTime">
				            <option selected>${selectedTime}</option>
				        </select>
				    </div>
                </header>
                <section class="allSeat">
                    <aside class="seatL" style="display: flex; flex-direction: column;">
                    	<div class="priceT" style="padding: 36px 36px 0 36px;">
                    	<p class="stit"><span>취소수수료 동의</span></p>
                    		<div class="priceList">
                    			<table>
					                <thead>
					                    <tr>
					                        <th style="text-align: center;">취소일</th>
					                        <th style="text-align: center;">취소수수료</th>
					                    </tr>
					                </thead>
					                <tbody>
					                    <tr>
					                        <td>예매 후 7일 이내</td>
					                        <td>없음</td>
					                    </tr>
					                    <tr>
					                        <td>예매 후 8일~관람일 10일 전까지</td>
					                        <td class="highlight">장당 4,000원 (티켓금액의 10% 한도)</td>
					                    </tr>
					                    <tr>
					                        <td>관람일 9일~7일 전까지</td>
					                        <td class="highlight">티켓금액의 10%</td>
					                    </tr>
					                    <tr>
					                        <td>관람일 6일~3일 전까지</td>
					                        <td class="highlight">티켓금액의 20%</td>
					                    </tr>
					                    <tr>
					                        <td>관람일 2일~1일 전까지</td>
					                        <td class="highlight">티켓금액의 30%</td>
					                    </tr>
					                </tbody>
					            </table>
							    <p class="warning">
							    <%--  *취소기간: ${jcancelDeadline}<br> --%>
							     *예매취소는 예매일 이후 취소기한은 별도로 정하지 않습니다.<br>
							     단, 예매 후 당일 12시 이전 취소 시에는 취소수수료 없음(취소기한 내에 한함)
							   	</p>
							   	<div class="consent">
							     <p style="margin-bottom: 15px;"><strong style="font-size: 15px;">개인정보 제3자 정보제공</strong></p>
							     <p>
							        MUSE는 기획사와 이용자 간의 상품 거래를 중개하는 통신판매중개자입니다. 거래과정이 이루어진 이후의 고객정보 관련 책임은 정보 제공에 관한 동의를 확인한 후 발행 내에서 거래 당사자에게 예약에 관한 정보를 제공합니다.
							     </p>
							  </div>
							  <div class="checkbox-group">
							     <!-- <input type="checkbox" id="agree-all">
							     <label for="agree-all">모두 동의합니다.</label><br> -->
							     <input type="checkbox" id="agree-fee">
							     <label for="agree-fee">(필수) 취소수수료/취소기한을 확인하였으며, 동의합니다.</label><br>
							     <input type="checkbox" id="agree-info">
							     <label for="agree-info">(필수) 제3자 정보제공 내용에 동의합니다.</label>
							   </div>
							</div>
							  </div>
							  
                    </aside>
                    <aside class="seatR">
                        <div class="s inf">
                            <h2>나의 예매 정보</h2>
                            <div class="reservmInfo">
                                <div style="display: flex; gap: 15px; flex-direction: row; align-items: stretch;">
                                    <img src="">
                                    <ul class="mInfoList">
							            <li><span>${musicalInfo.M_TITLE}</span></li>
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
                                            <td>${selectedDate} ${selectedTime}</td>
                                        </tr>
                                        <tr>
                                            <th>선택좌석<br>(${seatCount}석)</th>
                                            <td>
										        <ul class="seatInf">
												    <c:if test="${not empty selectedSeats}">
												        <c:forEach var="seat" items="${selectedSeats}">
												            <li>
												                ${seat.grade}석, ${seat.floor}층-${seat.section}블록, ${seat.row}열 ${seat.number}번
												            </li>
												        </c:forEach>
												    </c:if>
												    <c:if test="${empty selectedSeats}">
												        <li>선택된 좌석이 없습니다.</li>
												    </c:if>
												</ul>
										    </td>
                                        </tr>
                                         <tr>
										    <th>티켓금액</th>
										    <td id="ticketPrice">${ticketPrice}원</td>
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
                                <span><b id="totalPrice">${ticketPrice - (usePoint != null ? usePoint : 0)}</b></span>
                            </div>
                        </div>
                        <div class="s Button"> 
                            <div class="subBtList">
                                <button type="button" class="subBt" onclick="goBack()">이전단계</button>
                                <button id="check_module" class="subBt pay" onclick="goPurchase()">결제하기</button>
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

// 취소 수수료 날짜
function updateCancelDeadline() {
    try {
        console.log("updateCancelDeadline 함수 실행");
        
        // 현재 날짜 객체 생성
        const today = new Date();
        console.log("오늘 날짜:", today);
        
        // 미부과기간 날짜 계산(7일)
        const noDay = new Date(today);
        noDay.setDate(today.getDate() + 7);
        //noDay.setHours(17, 0, 0);
        console.log("미부과기간:", noDay);
        
        // 예매 후 8일 
        
        // 요일 배열
        const days = ['일', '월', '화', '수', '목', '금', '토'];
        const dayOfWeek = days[noDay.getDay()];
        console.log("요일:", dayOfWeek);
        
        // 년, 월, 일 추출 및 로그 출력
        const year = noDay.getFullYear();
        const month = String(noDay.getMonth() + 1).padStart(2, '0');
        const date = String(noDay.getDate()).padStart(2, '0');
        
        console.log("추출된 값:", {
            year: year,
            month: month,
            date: date,
            dayOfWeek: dayOfWeek
        });
        
        // 날짜 포맷팅 - 일반 문자열 연결 사용
        const formattedDate =" ~ "+ year + "년 " + month + "월 " + date + "일 까지";
        console.log("포맷된 날짜:", formattedDate);
        
        const noDayElement  = document.getElementById('noDay');
        if (noDayElement ) {
        	noDayElement.textContent = formattedDate;
            console.log("날짜 설정 완료:", noDayElement.textContent);
        }
        
    } catch (error) {
        console.error('취소기한 업데이트 중 오류:', error);
    }
}

//페이지 로드 시 실행
//document.addEventListener('DOMContentLoaded', function() {
//    updateCancelDeadline();  // 페이지 로드 시 함수 실행
//});

document.addEventListener('DOMContentLoaded', function() {
    updateCancelDeadline();

    const nextButton = document.querySelector('.subBt.pay');
    const agreeFee = document.getElementById('agree-fee');
    const agreeInfo = document.getElementById('agree-info');
    
    // 버튼 상태 업데이트
    function updateButtonState() {
        if (agreeFee.checked && agreeInfo.checked) {
            nextButton.style.background = '#ff3d32';
            nextButton.style.color = '#fff';
            nextButton.style.opacity = '1';
            nextButton.style.cursor = 'pointer';
        } else {
            nextButton.style.background = '#f0f0f0';
            nextButton.style.color = '#000';
            nextButton.style.opacity = '0.5';
            nextButton.style.cursor = 'not-allowed';
        }
    }

    // 체크박스 클릭시
    agreeFee.addEventListener('change', updateButtonState);
    agreeInfo.addEventListener('change', updateButtonState);

    // 초기 버튼 상태
    updateButtonState();

    // 결제하기 버튼 클릭 ~
    nextButton.addEventListener('click', function(e) {
        e.preventDefault();
        
        if (agreeFee.checked && agreeInfo.checked) {
            document.querySelector('form').submit();
        } else {
            alert('필수 약관에 모두 동의해주세요.');
        }
    });
});

//페이지 로드 시 실행
document.addEventListener('DOMContentLoaded', function() {
    // 서버에서 받아온 좌석 데이터를 hidden input에 설정
    const selectedSeats = [
        <c:forEach items="${selectedSeats}" var="seat" varStatus="status">
            {
                grade: "${seat.grade}",
                floor: "${seat.floor}",
                section: "${seat.section}",
                row: "${seat.row}",
                number: "${seat.number}"
            }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];
    
    document.querySelector('input[name="selectedSeats"]').value = JSON.stringify(selectedSeats);
});

//결제해주러 가는 함수 //
function goPurchase(){

	const price = $("b#totalPrice").text();
	const user_id_pk = "${sessionScope.s_id}";
	const musical_mtitle = "${musicalInfo.M_TITLE}";
	
	const url = 'reservPay.do?s_id='+user_id_pk+'&price='+price+'&m_title='+musical_mtitle; 

     // 견적서번호 넘기기 
     window.open(url, "reservPay",
             "left=350px, top=100px, width=1000px height=600px");
               
} 



//결제하고나서 실행할 함수
function goInsertOrder(){
	const frm = document.reservationForm;
	frm.action = "reservSuccess.do"; 
    frm.method = "post";
    frm.submit();

}
</script>
</body>
</html>
