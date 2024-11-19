<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="resources/css/Main.css">
    <link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
    <script src="/muse/resources/js/httpRequest.js"></script>
</head>
<body>
    <h1>가격/할인 페이지</h1>
	<form id="reservationForm" method="post" action="reservCheck.do">
	    <input type="hidden" name="mh_code" value="${mh_code}">
	    <input type="hidden" name="m_code" value="${m_code}">
	    <input type="hidden" name="selectedDate" value="${selectedDate}">
	    <input type="hidden" name="selectedTime" value="${selectedTime}">
		<input type="hidden" name="selectedSeats" id="formSeats" value="${selectedSeats}">
		<input type="hidden" name="jsonSeats" id="jsonSeats" value='${jsonSeats}'>
		<input type="hidden" name="usePoint" id="jusePoint" value="${usePoint}">
		<input type="hidden" name="ticketPrice" id="ticketPriceInput" value="0">
		<input type="hidden" name="jcancelDeadline" id="jcancelDeadline" value="${cancelDeadline}">
		<section class="reservWrap">
            <article class="contWrap">
                <header class="step">
				    <h2>02 가격/할인</h2>
				    <h3>${musicalInfo.M_TITLE} <span>| ${musicalInfo.MH_NAME}</span></h3>
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
                    	<div class="priceTList" style="max-height: 470px; overflow-y: scroll;">
						    <c:set var="processedGrades" value=""/> <!--  이미 처리된 등급 저장 -->
						    <c:forEach var="currentSeat" items="${selectedSeats}"> <!-- (1) 모든 좌석을 돌면서 각 등급별로 한번씩만 처리 -->
						        <c:set var="currentGrade" value="${currentSeat.grade}"/> <!-- 처리중인 좌석등급을 변수에 저장 -->
						        <c:if test="${!fn:contains(processedGrades, currentGrade)}"> <!-- 처리된 등급인지 확인 -->
						            <c:set var="seatCount" value="0"/> <!-- 같은 등급의 좌석 수를 카운트하기 위한 변수 초기화 -->  
						            <c:forEach var="seat" items="${selectedSeats}"> <!-- (2) 전체좌석 중에 현재 등급과 동일한 좌석 수 계산 -->
						                <c:if test="${seat.grade eq currentGrade}">
						                    <c:set var="seatCount" value="${seatCount + 1}"/>
						                </c:if>
						            </c:forEach>
						            
						            <div class="priceT">
						                <p class="stit">
						                    <span>${currentGrade}석</span> | 좌석 ${seatCount}매를 선택하셨습니다.
						                </p>
						                <div class="priceList">
						                    <table>
						                        <thead>
						                            <tr>
						                                <th rowspan="2">기본가</th>
						                                <td>일반</td>
						                                <td>${currentSeat.price}원</td>
						                                <td>
						                                    <select name="normalTickets_${currentGrade}">
						                                        <option value="">선택</option>
						                                        <c:forEach begin="1" end="${seatCount}" var="i">
						                                            <option value="${i}">${i}매</option>
						                                        </c:forEach>
						                                    </select>
						                                </td>
						                            </tr>
						                        </thead>
						                        <tbody>
						                            <tr>
						                                <th rowspan="3">기본할인</th>
						                                <td>국가유공자 할인(본인만) 50%</td>
						                                <td>${currentSeat.price / 2}원</td>
						                                <td>
						                                    <select name="veteranTickets_${currentGrade}">
						                                        <option value="">선택</option>
						                                        <c:if test="${seatCount >= 1}">
						                                            <option value="1">1매</option>
						                                        </c:if>
						                                    </select>
						                                </td>
						                            </tr>
						                            <tr>
						                                <td>장애인 할인(1~3등급/동반 1인) 50%</td>
						                                <td>${currentSeat.price / 2}원</td>
						                                <td>
						                                    <select name="disability13Tickets_${currentGrade}">
						                                        <option value="">선택</option>
						                                        <c:if test="${seatCount >= 1}">
						                                            <option value="1">1매</option>
						                                        </c:if>
						                                        <c:if test="${seatCount >= 2}">
						                                            <option value="2">2매</option>
						                                        </c:if>
						                                    </select>
						                                </td>
						                            </tr>
						                            <tr>
						                                <td>장애인 할인(4~6등급/본인만) 50%</td>
						                                <td>${currentSeat.price / 2}원</td>
						                                <td>
						                                    <select name="disability46Tickets_${currentGrade}">
						                                        <option value="">선택</option>
						                                        <c:if test="${seatCount >= 1}">
						                                            <option value="1">1매</option>
						                                        </c:if>
						                                    </select>
						                                </td>
						                            </tr>
						                        </tbody>
						                    </table>
						                </div>
						            </div>
						            
						            <c:set var="processedGrades" value="${processedGrades}${currentGrade},"/>
						        </c:if>
						    </c:forEach>
						</div>
                    	<div class="pointB">
					    <p class="stit"><span>My Point</span></p>
					    <div class="pointContainer">
					        <div class="pointCheck">
					            <label>나의 포인트 조회 :</label>
					            <input type="text" id="myPoint" value="조회중..." readonly>
					            <button type="button" onclick="checkMyPoint()"></button>
					        </div>
					        <div class="pointUse">
					            <label>포인트 사용하기 :</label>
					            <input type="text" id="usePoint" value="0">
					            <button type="button" onclick="useMyPoint()">사용하기</button>
					        </div>
					    </div>
					</div>
                    </aside>
                    <aside class="seatR">
                        <div class="s inf">
                            <h2>나의 예매 정보</h2>
                            <div class="reservmInfo">
                                <div style="display: flex; gap: 15px; flex-direction: row; align-items: stretch;">
							        <img src="${musicalInfo.M_POSTER}">
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
												    <%
												    Object selectedSeats = request.getAttribute("selectedSeats");
												    System.out.println("selectedSeats: " + selectedSeats);
												%>
												</ul>

										    </td>
										</tr>
                                        <tr>
										    <th>티켓금액</th>
										    <td id="ticketPrice">0원</td>
										</tr>
										<tr>
										    <th>포인트 사용</th>
										    <td><b id="selectedPointAmount">0 P</b> 사용</td>
										</tr>
                                        <tr>
                                            <th>취소기한</th>
                                            <td><b id="cancelDeadline"></b></td>
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
						        <span><b id="totalPrice">0원</b></span>
						    </div>
						</div>
                        <div class="s Button"> 
                            <div class="subBtList">
                                <button type="button" class="subBt bk" onclick="goBack()">이전단계</button>
        						<button type="submit" class="subBt" style="background: #FF3D32; color: #fff;">다음단계</button>
                            </div>
                        </div>
                    </aside>
                </section>
            </article>
        </section>
    </form>
</body>
<script>
// 이전단계
function goBack() {
    history.back();
}

document.addEventListener('DOMContentLoaded', function() {
    console.log("문서 로드 완료");
    updateCancelDeadline();
    checkMyPoint();

    const form = document.getElementById('reservationForm');
    const submitButton = document.querySelector('button[type="submit"]');

 	// submit 버튼 클릭 시에만 이벤트 적용
    submitButton.addEventListener('click', function(e) {
        e.preventDefault();
        
        try {
            let totalRequiredSeats = 0;    
            let totalSelectedSeats = 0;     
           
            
         	// 각 등급별로 처리
            document.querySelectorAll('.priceT').forEach(priceTable => {
                const seatInfo = priceTable.querySelector('.stit').textContent;
                const gradeRequiredSeats = parseInt(seatInfo.match(/좌석\s*(\d+)매/)[1]);
                totalRequiredSeats += gradeRequiredSeats;
                console.log('seatInfo:', seatInfo);
                
                let gradeSelectedSeats = 0;
                priceTable.querySelectorAll('select').forEach(select => {
                    gradeSelectedSeats += parseInt(select.value || 0);
                });
                totalSelectedSeats += gradeSelectedSeats;
            });
            
            if (totalSelectedSeats !== totalRequiredSeats) {
                alert('선택하신 모든 좌석의 티켓 매수를 선택해주세요.');
                return;
            }
            
            // selectedSeats 값이 있는지 확인
            const formSeats = document.getElementById('formSeats');
            if (!formSeats.value) {
                console.error('좌석 데이터가 없습니다');
                console.log("formSeats:"+formSeats);
                return;
            }
            
         // 할인 정보를 좌석 데이터에 추가
			
			const seatsData = ${jsonSeats};
			const updatedSeatsData = seatsData.map(seat => {
			    // 해당 등급의 priceT div를 찾기
			    const priceTables = document.querySelectorAll('.priceT');
			    let matchingPriceTable = null;
			    
			    
			    // 각 priceTable을 순회하면서 해당하는 등급 찾기
			    priceTables.forEach(table => {
			        const gradeSpan = table.querySelector('.stit span');
			        if (gradeSpan && gradeSpan.textContent.replace('석', '') === seat.grade) {
			            matchingPriceTable = table;
			        }
			    });
			
			    if (matchingPriceTable) {
			        const discountInfo = {
			            normal: parseInt(matchingPriceTable.querySelector('select[name="normalTickets_' + seat.grade + '"]').value || 0),
			            veteran: parseInt(matchingPriceTable.querySelector('select[name="veteranTickets_' + seat.grade + '"]').value || 0),
			            disability13: parseInt(matchingPriceTable.querySelector('select[name="disability13Tickets_' + seat.grade + '"]').value || 0),
			            disability46: parseInt(matchingPriceTable.querySelector('select[name="disability46Tickets_' + seat.grade + '"]').value || 0)
			        };
			        return {...seat, discountInfo};
			    }
			    return seat;
			});
            // 업데이트된 데이터를 폼에 설정
            formSeats.value = JSON.stringify(updatedSeatsData);
            
            alert(updatedSeatsData);
            
            const usePoint = document.getElementById('jusePoint').value;
            const cancelDeadline = document.getElementById('jcancelDeadline').value;
            
            const ticketPriceText = document.getElementById('ticketPrice').textContent;
            const ticketPrice = ticketPriceText.replace(/[^0-9]/g, '');
            document.getElementById('ticketPriceInput').value = ticketPrice;
            
            console.log('전송될 포인트:', usePoint);
            console.log('전송될 취소기한:', cancelDeadline);
            alert(jcancelDeadline);
            // 검증 통과시 폼 제출
            form.submit();
            
        } catch (error) {
            console.error('폼 제출 검증 중 오류:', error);
            alert('티켓 선택을 확인하는 중 오류가 발생했습니다.');
        }
    });
});


document.querySelectorAll('.priceList select').forEach(select => {
    select.addEventListener('change', function() {
        // select 이름에서 등급 정보 추출 (예: normalTickets_VIP -> VIP)
        let gradeType = this.name.split('_')[1];
        
        // 해당 등급의 최대 티켓 수 찾기
        let seatInfo = this.closest('.priceT').querySelector('.stit').textContent;
        let maxTickets = parseInt(seatInfo.match(/좌석\s*(\d+)매/)[1]);

        // 현재 선택된 값
        let selectedValue = parseInt(this.value || 0);

        // 일반 요금인지 할인 요금인지 구분하여 처리
        if (this.name.includes('normalTickets')) {
            handleNormalTicketChange(this, gradeType, maxTickets, selectedValue);
        } else {
            handleDiscountTicketChange(this, gradeType, maxTickets);
        }

        // 전체 가격 업데이트
        updateAllPrices();
    });
});

// 전체 가격 업데이트 함수
function updateAllPrices() {
    let totalSum = 0;

    // 모든 등급에 대해 순회
    document.querySelectorAll('.priceT').forEach(priceTable => {
        try {
            // 기본 가격 찾기
            let basePrice = parseInt(priceTable.querySelector('thead td:nth-child(3)').textContent.replace(/[^0-9]/g, ''));
            
            // 해당 등급의 선택된 매수 계산
            let selects = priceTable.querySelectorAll('select');
            let gradeTotal = 0;

            selects.forEach(select => {
                let selectedValue = parseInt(select.value || 0);
                
                // 할인 적용
                if (select.name.includes('normalTickets')) {
                    gradeTotal += selectedValue * basePrice;
                } else {
                    // 50% 할인 적용
                    gradeTotal += selectedValue * (basePrice / 2);
                }
            });

            totalSum += gradeTotal;
        } catch (error) {
            console.error('등급별 가격 계산 중 오류:', error);
        }
    });

    // 화면에 가격 표시 업데이트
    let ticketPriceElement = document.getElementById('ticketPrice');
    let totalPriceElement = document.getElementById('totalPrice');

    if (ticketPriceElement) {
        ticketPriceElement.textContent = totalSum.toLocaleString() + '원';
        document.getElementById('ticketPriceInput').value = totalSum;
    }
    if (totalPriceElement) {
        totalPriceElement.textContent = totalSum.toLocaleString() + '원';
    }
}

function handleNormalTicketChange(select, gradeType, maxTickets, selectedValue) {
    let priceTable = select.closest('.priceT');
    let discountSelects = priceTable.querySelectorAll('select[name*="Tickets_' + gradeType + '"]');
    let totalDiscountSelected = 0;

    // 할인 티켓 선택 수 계산
    discountSelects.forEach(sel => {
        if (sel !== select) {
            totalDiscountSelected += parseInt(sel.value || 0);
        }
    });

    // 최대 매수 초과 체크
    if (selectedValue + totalDiscountSelected > maxTickets) {
        alert(`선택하신 좌석 수(${maxTickets}매)를 초과하여 선택하실 수 없습니다.`);
        select.value = '';
        return;
    }

    // 모든 좌석을 일반으로 선택한 경우
    if (selectedValue === maxTickets) {
        discountSelects.forEach(discountSelect => {
            if (discountSelect !== select) {
                discountSelect.value = '';
                discountSelect.disabled = true;
            }
        });
        alert('모든 좌석을 일반요금으로 선택하셨습니다.');
    } else {
        discountSelects.forEach(discountSelect => {
            if (discountSelect !== select) {
                discountSelect.disabled = false;
            }
        });
    }
}

function handleDiscountTicketChange(select, gradeType, maxTickets) {
    let priceTable = select.closest('.priceT');
    let allSelects = priceTable.querySelectorAll('select[name*="Tickets_' + gradeType + '"]');
    let totalSelected = 0;

    // 전체 선택된 매수 계산
    allSelects.forEach(sel => {
        totalSelected += parseInt(sel.value || 0);
    });

    // 최대 매수 초과 체크
    if (totalSelected > maxTickets) {
        alert(`선택하신 좌석 수(${maxTickets}매)를 초과하여 선택하실 수 없습니다.`);
        select.value = '';
        return;
    }

    // 남은 매수가 없으면 비활성화
    allSelects.forEach(sel => {
        if (totalSelected === maxTickets && sel.value === '') {
            sel.disabled = true;
        } else {
            sel.disabled = false;
        }
    });

    if (totalSelected === maxTickets) {
        //alert('모든 좌석이 선택되었습니다.');
    }
}



// 포인트 조회 함수
function checkMyPoint() {
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'checkPoint.do', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                try {
                    const response = JSON.parse(xhr.responseText);
                    if (response.success) {
                        document.getElementById('myPoint').value = response.point.toLocaleString() + ' P';
                    } else {
                        alert('포인트 조회 중 오류가 발생했습니다: ' + response.message);
                    }
                } catch (e) {
                    console.error('포인트 조회 응답 처리 중 오류:', e);
                    alert('포인트 조회 중 오류가 발생했습니다.');
                }
            } else {
                alert('서버 통신 오류가 발생했습니다.');
            }
        }
    };
    
    xhr.send();
}

//포인트 사용 함수 수정
function useMyPoint() {
    const usePointInput = document.getElementById('usePoint');
    const usePointValue = parseInt(usePointInput.value.replace(/[^0-9]/g, ''));
    const currentPoint = parseInt(document.getElementById('myPoint').value.replace(/[^0-9]/g, ''));
    const ticketPrice = parseInt(document.getElementById('ticketPrice').textContent.replace(/[^0-9]/g, ''));
    
    // 유효성 검사
    if (isNaN(usePointValue) || usePointValue <= 0) {
        alert('사용할 포인트를 올바르게 입력해주세요.');
        usePointInput.value = '0';
        updateTotalPrice(0);
        return;
    }
    
    if (usePointValue > currentPoint) {
        alert('보유하신 포인트보다 많은 포인트를 사용할 수 없습니다.');
        usePointInput.value = '0';
        updateTotalPrice(0);
        return;
    }
    
    if (usePointValue > ticketPrice) {
        alert('티켓 금액보다 많은 포인트를 사용할 수 없습니다.');
        usePointInput.value = ticketPrice;
        updateTotalPrice(ticketPrice);
        return;
    }

    // 포인트 사용 처리
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'usePoint.do', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                try {
                    const response = JSON.parse(xhr.responseText);
                    if (response.success) {
                        // 포인트 사용 성공
                        document.getElementById('selectedPointAmount').textContent = usePointValue.toLocaleString() + ' P';
                        updateTotalPrice(usePointValue);
                        alert('포인트 사용이 선택되었습니다. 결제 완료 후 차감됩니다.');
                    } else {
                        alert(response.message);
                        usePointInput.value = '0';
                        updateTotalPrice(0);
                    }
                } catch (e) {
                    console.error('포인트 사용 처리 중 오류:', e);
                    alert('포인트 사용 처리 중 오류가 발생했습니다.');
                    usePointInput.value = '0';
                    updateTotalPrice(0);
                }
            }
        }
    };
    
    xhr.send('usePoint=' + usePointValue);
}


//추가된 함수: 가격 업데이트
function updatePrice(gradeType) {
 try {
     // 해당 등급의 priceList 찾기
     let priceList = document.querySelector(`select[name="normalTickets_${gradeType}"]`).closest('.priceList');

     // 기본 가격 가져오기 (일반 요금 가격)
     let basePrice = parseInt(priceList.querySelector('thead td:nth-child(3)').textContent.replace(/[^0-9]/g, ''));

     // 선택된 매수 계산
     let normal = parseInt(priceList.querySelector(`select[name="normalTickets_${gradeType}"]`).value || 0);
     let veteran = parseInt(priceList.querySelector(`select[name="veteranTickets_${gradeType}"]`).value || 0);
     let disability13 = parseInt(priceList.querySelector(`select[name="disability13Tickets_${gradeType}"]`).value || 0);
     let disability46 = parseInt(priceList.querySelector(`select[name="disability46Tickets_${gradeType}"]`).value || 0);

     // 가격 계산
     let normalTotal = normal * basePrice; // 일반 요금 총액
     let discountPrice = Math.floor(basePrice / 2); // 50% 할인가
     let discountTotal = (veteran + disability13 + disability46) * discountPrice; // 할인 적용된 총액
     let totalPrice = normalTotal + discountTotal; // 총 결제 금액

     // 화면 업데이트
     let ticketPriceElement = document.getElementById('ticketPrice');
     let totalPriceElement = document.getElementById('totalPrice');

     if (ticketPriceElement) ticketPriceElement.textContent = totalPrice.toLocaleString() + '원';
     if (totalPriceElement) totalPriceElement.textContent = totalPrice.toLocaleString() + '원';

 } catch (error) {
     console.error('가격 업데이트 중 오류 발생:', error);
 }
}

//총 결제금액 업데이트 함수
function updateTotalPrice(usedPoint) {
    const ticketPrice = parseInt(document.getElementById('ticketPrice').textContent.replace(/[^0-9]/g, ''));
    const totalPrice = ticketPrice - usedPoint;
    
    // 총 결제금액 업데이트
    document.getElementById('totalPrice').textContent = totalPrice.toLocaleString() + '원';
    
    // 사용 포인트 표시 업데이트
    document.getElementById('selectedPointAmount').textContent = usedPoint.toLocaleString() + ' P';
}

//포인트 입력 이벤트 처리
document.getElementById('usePoint').addEventListener('input', function(e) {
    this.value = this.value.replace(/[^0-9]/g, '');
    
    const currentPoint = parseInt(document.getElementById('myPoint').value.replace(/[^0-9]/g, ''));
    const ticketPrice = parseInt(document.getElementById('ticketPrice').textContent.replace(/[^0-9]/g, ''));
    let inputValue = parseInt(this.value);
    
    if (isNaN(inputValue)) {
        inputValue = 0;
    }
    
    if (inputValue > currentPoint) {
        this.value = currentPoint;
        inputValue = currentPoint;
    }
    
    if (inputValue > ticketPrice) {
        this.value = ticketPrice;
        inputValue = ticketPrice;
    }
    
    updateTotalPrice(inputValue);
});


function updateCancelDeadline() {
    try {
        console.log("updateCancelDeadline 함수 실행");
        
        // 현재 날짜 객체 생성
        const today = new Date();
        console.log("오늘 날짜:", today);
        
        // 내일 날짜 계산
        const tomorrow = new Date(today);
        tomorrow.setDate(today.getDate() + 1);
        tomorrow.setHours(17, 0, 0);
        console.log("내일 날짜:", tomorrow);
        
        // 요일 배열
        const days = ['일', '월', '화', '수', '목', '금', '토'];
        const dayOfWeek = days[tomorrow.getDay()];
        console.log("요일:", dayOfWeek);
        
        // 년, 월, 일 추출 및 로그 출력
        const year = tomorrow.getFullYear();
        const month = String(tomorrow.getMonth() + 1).padStart(2, '0');
        const date = String(tomorrow.getDate()).padStart(2, '0');
        
        console.log("추출된 값:", {
            year: year,
            month: month,
            date: date,
            dayOfWeek: dayOfWeek
        });
        
        // 날짜 포맷팅 - 일반 문자열 연결 사용
        const formattedDate = year + "년 " + month + "월 " + date + "일(" + dayOfWeek + ") 17:00";
        console.log("포맷된 날짜:", formattedDate);
        
        const cancelDeadlineElement = document.getElementById('cancelDeadline');
        if (cancelDeadlineElement) {
            cancelDeadlineElement.textContent = formattedDate;
            console.log("날짜 설정 완료:", cancelDeadlineElement.textContent);
        }
        document.getElementById('jcancelDeadline').value = formattedDate;
        console.log("폼 제출 직전 전송될 취소기한 값:", document.getElementById('jcancelDeadline').value);

    } catch (error) {
        console.error('취소기한 업데이트 중 오류:', error);
    }
}

</script>
</html>
