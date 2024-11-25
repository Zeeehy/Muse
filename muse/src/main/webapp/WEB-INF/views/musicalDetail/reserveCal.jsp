<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .calendar-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .calendar-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        /* .calendar-header button {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 4px;
        } */
        .button {
		    color: #ff3d32;
		    background: none;
		    font-size: 1.2rem;
		}
        .calendar-header button:hover {
            color: #000;
        }
        table.moreInfoTable {
            width: 100%;
            border-collapse: collapse;
                border-right: 1px solid #dfe5ed;
        }
        th, td {
            /*border: 1px solid #ddd;*/
            padding: 15px;
            text-align: center;
        }
        th {
            background: #f5f5f5;
        }
        #calendarBody td {
            cursor: pointer;
            
        }
        #calendarBody td:hover {
            background: #f0f0f0;
            border-radius: 100%;
        }
        .today {
            background: #e3f2fd;
        }
        /* .selected {
            background: #b3e5fc;
        } */
        .disabled {
            color: #ccc;
            cursor: not-allowed;
            border-radius: 100%;
        }
        .reservation-form {
            margin-top: 20px;
            border-top: 1px solid #ddd;
            display: none;
        }
        .reservation-form button {
            background: #2196F3;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }
        .reservation-form button:hover {
            background: #1976D2;
        }
        .calendar-header {
		    padding: 20px 20px 30px;
		}
		.calendar-header button {
			cursor: pointer;
		    border: none;
		    background: none;
		    color: #ff3e32;
		}
		.calendar-header h2 {
			font-size: 1.2rem;
	    	word-spacing: 0.5rem;
	    	font-weight: 500;
		}
		.flex {
		    display: flex;
		    flex-direction: column;
		    gap: 30px;
		    margin-bottom: 20px;
		    color: #444;
		    font-weight: 700;
		}
		.flex span {
			font-size: 14px;
		    font-weight: 500;
		    padding: 15px;
		    border: 1px solid #ff3d32;
		    border-radius: 10px;
		    width: 100px;
		    text-align: center;
		    color: #ff3d32;
		}
		.flex .time-option.selected {
			/* padding-top:15px; */
		}
		.flex .time-option span{
			margin-left:15px;
		}
		#roundCasting {
			padding:20px;
			border-top:1px solid #ddd;
		}
		#remainSeats{
			padding: 0 15px 15px;
    		color: #bbb;
		}
		#timeSelect {
		    display: flex;
		    flex-direction: column;
		    gap: 50px;
		}
		
		.time-option.selected span {
			background-color: #ff3d32;
   			 color: white;
		}
    </style>
</head>
<body>
 <div class="calendar-container">
 		<div id="ticketOpenInfo">
        <!-- 예매 오픈 시간 정보가 들어갈 자리 -->
	    </div>
	    <div id="ticketTimer" style="display: none;">
	        <!-- 타이머가 들어갈 자리 -->
	    </div>
        <div class="calendar-header">
            <button onclick="previousMonth()">◀</button>
            <h2 id="currentMonth"></h2>
            <button onclick="nextMonth()">▶</button>
        </div>
        <table id="calendar">
            <thead>
                <tr>
                    <th>일</th>
                    <th>월</th>
                    <th>화</th>
                    <th>수</th>
                    <th>목</th>
                    <th>금</th>
                    <th>토</th>
                </tr>
            </thead>
            <tbody id="calendarBody"></tbody>
        </table>
        <div id="reservationForm" class="reservation-form">
        <div style="padding:20px;">
            <span id="selectedDate" style="display: none;"></span>
            <div class="flex">
            회차
            <div id="timeSelect"></div>
            </div>
        </div>
            <div id="remainSeats">
            
            </div>
            <div id="roundCasting">
            	<h3 class="roundCastingHead" style="padding-bottom:15px;">캐스팅</h3>
            	<div id="roundCastingList"></div>
            </div>
           </div>
    </div>
	<button id="resBtn" 
	onclick="makeReservation()" style="    width: 100%;
    padding: 20px;
    background: #ff3d32;
    color: #fff;
    font-size: 20px;
    display: none;
	">예매하기</button>
        
    <script>
    
    //const startDate = new Date('2024-11-15');
    
    var on_open = '${ondto.on_open}';
    var on_muse_open = '${ondto.on_muse_open}';

//    var on_open = '2024-11-24 21:50:00';
//    var on_muse_open = '2024-11-24 20:44:00';

   	const s_id = '${sessionScope.s_id}';
    const m_code = '${mddto.m_code}';
    const maxPerform = ${maxPerform};
    var endDate = null;
	var startDate = null;
    let performList = ${performList};
    let currentDate = new Date();

	var availableDates = [];
	
	var s_mpass ='${s_mpass}';
    let openDate = null;
    let museOpenDate = null;
	
	function checkTicketOpenTime(on_open, on_muse_open) {
	    const now = new Date();
	    
	    // 문자열 trim 처리
	    on_open = (on_open || '').trim();
	    on_muse_open = (on_muse_open || '').trim();
	    
	    
	    try {
	        if (on_open) {
	            openDate = on_open.includes('/') ? 
	                new Date(on_open) : 
	                new Date(on_open.replace(/-/g, '/'));
	        }
	        
	        if (on_muse_open) {
	            museOpenDate = on_muse_open.includes('/') ? 
	                new Date(on_muse_open) : 
	                new Date(on_muse_open.replace(/-/g, '/'));
	        }
	    } catch (e) {
	        console.error('날짜 형식이 잘못되었습니다:', e);
	        return false;
	    }
	    
	     const dateFormatOptions = { 
	             year: 'numeric', 
	             month: '2-digit', 
	             day: '2-digit',
	             hour: '2-digit', 
	             minute: '2-digit'
	         };

	    // 멤버십 여부 체크
	    const isMember = (s_mpass === '1');
        let messages = [];
        let canBook = false;
        
        // 시간 표시 메시지 추가
        if (openDate) {
            messages.push('일반 예매 오픈: ' + openDate.toLocaleString('ko-KR', dateFormatOptions));
        }
        if (museOpenDate) {
            messages.push('멤버십 예매 오픈: ' + museOpenDate.toLocaleString('ko-KR', dateFormatOptions));
        }

        
        if (isMember && museOpenDate) {
            // 멤버십 회원인 경우
            canBook = (now >= museOpenDate);
        } else {
            // 일반 회원인 경우
            canBook = (now >= openDate);
        }
        
        
        displayMessage(messages, canBook);


	    const targetDate = isMember && museOpenDate ? museOpenDate : openDate;

	    
	    if (now < targetDate) {
	        updateTimer(targetDate);
	        return false;
	    }
	    
	    return true;
	}

	function updateTimer(targetDate) {
	    // 이전 타이머 제거
	    if (window.timerInterval) {
	        clearInterval(window.timerInterval);
	    }
	    
	    const now = new Date();
	    const timeDiff = targetDate - now;
	    
	    // 1시간 이상 남은 경우 타이머를 시작하지 않음
	    if (timeDiff > 3600000) {
	        return;
	    }
	    
	    function showTimer() {
	        const now = new Date();
	        const timeDiff = targetDate - now;
	        
	        if (timeDiff <= 0) {
	            location.reload();
	            return;
	        }
	        
	        // 1시간 = 3600000 밀리초
	        if (timeDiff > 3600000) {
	            // 1시간 이상 남은 경우 타이머 표시하지 않음
	            if (window.timerInterval) {
	                clearInterval(window.timerInterval);
	            }
	            return;
	        }
	        
	        const minutes = Math.floor(timeDiff / (1000 * 60));
	        const seconds = Math.floor((timeDiff % (1000 * 60)) / 1000);
	        
	        let timeText = '예매 오픈까지 ' + minutes + '분 ' + seconds + '초';
	        
	        var openTimer = document.querySelector('#openTimer');
	        if(openTimer) {
	            openTimer.innerHTML = 
	                '<div style="padding: 50px 20px; text-align: center; background: #f9f9f9; border-radius: 8px;">' +
	                    '<p>' + timeText + ' 남았습니다.</p>' +
	                '</div>';
	        }
	    }
	    
	    showTimer();
	    window.timerInterval = setInterval(showTimer, 1000);
	}

	// 메시지 표시 함수도 수정하여 D-DAY 스타일 적용
function displayMessage(messages, canBook) {
		

	if(openDate==null && museOpenDate==null){
        const calendarContainer = document.querySelector('.calendar-container');
        calendarContainer.innerHTML = '';
        var openMsgDiv = document.createElement('div');
        calendarContainer.appendChild(openMsgDiv);
        openMsgDiv.id = 'openMsgDiv';
        
        openMsgDiv.innerHTML = '<div style="' +
        'padding: 50px 20px;' +
        'text-align: center;' +
        'background: #f9f9f9;' +
        'border-radius: 8px;' +
        'margin: 20px 0;' +
        'color: #333;' +
        'font-size: 16px;' +
        'line-height: 1.6;' +
        'border: 1px solid #ddd;' +
        '">' +
        '잘못된 접근입니다.' +
        '</div>';

	} else if (!canBook) {
        const calendarContainer = document.querySelector('.calendar-container');
        if (calendarContainer) {
            calendarContainer.innerHTML = '';
            
            var openMsgDiv = document.createElement('div');
            calendarContainer.appendChild(openMsgDiv);
            openMsgDiv.id = 'openMsgDiv';
            
            var openTimer = document.createElement('div');
            calendarContainer.appendChild(openTimer);
            openTimer.id = 'openTimer';
            
            // 현재 시간과 targetDate 비교해서 D-day 계산
			const now = new Date();
			const today = new Date(now.getFullYear(), now.getMonth(), now.getDate()); // 시간 제거

			// 날짜 문자열 가져오기
			let dateStr = '';
			const isMember = (s_mpass === '1');
			
			// 멤버십 예매 시간이 있고, 멤버십 회원인 경우
			if (isMember && on_muse_open && messages[1]) {
			    dateStr = messages[1].split(': ')[1];
			} 
			// 그 외의 경우 일반 예매 시간 사용
			else{
			    dateStr = messages[0].split(': ')[1];
			}
			
			// 날짜 문자열 파싱
			const [year, month, day] = dateStr.split(' ');
			
			// 연도, 월, 일에서 '.' 제거
			const cleanYear = year.replace('.', '');
			const cleanMonth = month.replace('.', '');
			const cleanDay = day.replace('.', '');
			
			// 날짜만 있는 Date 객체 생성
			const targetDate = new Date(
			    parseInt(cleanYear),
			    parseInt(cleanMonth) - 1,
			    parseInt(cleanDay)
			);
			
			const timeDiff = targetDate - today;
			const days = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));
			
			// D-day 텍스트 계산
			let dDayText;
			if (days === 0) {
			    dDayText = 'D-DAY';
			} else {
			    dDayText = 'D-' + days;
			}
            
            let messageHtml = '';
            messages.forEach(function(msg) {
                messageHtml += '<p style="margin: 5px 0;">' + msg + '</p>';
            });
            
            // D-day 메시지 추가
            messageHtml += '<p style="margin: 15px 0 5px 0; color: #ff3d32; font-weight: bold; font-size: 24px;">' + dDayText + '</p>';

            openMsgDiv.innerHTML = '<div style="' +
                'padding: 50px 20px;' +
                'text-align: center;' +
                'background: #f9f9f9;' +
                'border-radius: 8px;' +
                'margin: 20px 0;' +
                'color: #333;' +
                'font-size: 16px;' +
                'line-height: 1.6;' +
                'border: 1px solid #ddd;' +
                '">' +
                messageHtml +
                '</div>';
            
            // 예매 버튼 제어
            const resBtn = document.querySelector('#resBtn');
            if (resBtn) {
                resBtn.style.display = canBook ? 'block' : 'none';
            }
        }
    }
}
	
	function displayOptionMessage(msg){
		
		 const calendarContainer = document.querySelector('.calendar-container');
	     calendarContainer.innerHTML = '';
	        var openMsgDiv = document.createElement('div');
	        calendarContainer.appendChild(openMsgDiv);
	        openMsgDiv.id = 'openMsgDiv';
	        
	        openMsgDiv.innerHTML = '<div style="' +
	        'padding: 50px 20px;' +
	        'text-align: center;' +
	        'background: #f9f9f9;' +
	        'border-radius: 8px;' +
	        'margin: 20px 0;' +
	        'color: #333;' +
	        'font-size: 16px;' +
	        'line-height: 1.6;' +
	        'border: 1px solid #ddd;' +
	        '">' +
	        msg +
	        '</div>';
	}

	// checkOption 함수는 이전과 동일
	function checkOption() {
	    // 예매 시간 체크
	    if (!checkTicketOpenTime(on_open, on_muse_open)) {
	        return false;
	    }
	    
	    // 기존 로직
	    if (!performList || performList.length === 0) {
	        displayOptionMessage(['해당 공연은 일정이 없습니다.']);
	        return false;
	    }
	    
	    availableDates = performList.map(perform => {
	        return new Date(perform.mo_date);
	    });
	    
	    endDate = new Date(maxPerform.mo_date);
	    startDate = availableDates[0];
	    
	    if (!startDate || !endDate) {
	        displayOptionMessage(['공연 일정을 확인할 수 없습니다.']);
	        return false;
	    }
	    
	    document.querySelector('#resBtn').style.display = 'block';
	    
	    startDate.setHours(0, 0, 0, 0);
	    endDate.setHours(23, 59, 59, 999);
	    currentDate = new Date(startDate);
	    
	    return true;
	}


	var remainSeats =document.querySelector('#remainSeats');
	var roundCastingList =document.querySelector('#roundCastingList');
    let selectedDate = null;
    	
	var timeSelect = document.querySelector('#timeSelect');

        // 공연 가능한 날짜 (예시 데이터)
        
        function isAvailableDate(year, month, day) {
            const checkDate = new Date(year, month-1, day);
            checkDate.setHours(0, 0, 0, 0);
            
            const today = new Date();
            today.setHours(0, 0, 0, 0);  // 오늘 날짜도 시간을 0시 0분으로 설정

            // 시작일과 종료일 사이에 있는지, 오늘 이후(또는 같은 날)인지 확인
/*             if (checkDate >= startDate && checkDate <= endDate && checkDate >= today) {
                const dayOfWeek = checkDate.getDay();
                // 공연 요일 체크 (예: 월요일 공연)
                if (dayOfWeek < 8) {
                    return true;
                }
            }
            return false; */
            
            
            return availableDates.some(date => {
                const availableDate = new Date(date);
                return availableDate.getFullYear() === checkDate.getFullYear() &&
                       availableDate.getMonth() === checkDate.getMonth() &&
                       availableDate.getDate() === checkDate.getDate();
            });
            
        }
        
        function selectNearestAvailableDate(date) {
            const year = date.getFullYear();
            const month = date.getMonth();
            const lastDay = new Date(year, month + 1, 0).getDate();
            
            // 현재 월의 모든 날짜 확인
            for (let day = 1; day <= lastDay; day++) {
                if (isAvailableDate(year, month + 1, day)) {
                    // 가능한 날짜 찾으면 선택
                    selectDate(year, month + 1, day);
                    return;
                }
            }
        }

        function initCalendar() {
            // 오늘 날짜가 공연 시작일보다 이전이면 시작일을, 아니면 오늘 날짜를 기준으로
/*             currentDate = new Date() < startDate ? new Date(startDate) : new Date();
            showCalendar(currentDate);
            // 가장 가까운 예매 가능일 선택
            selectNearestAvailableDate(currentDate); */
            
            if (!checkOption()) {
            	
                return; // Exit if initialization fails
            }
            
/*         	if (availableDates.length > 0) {
                currentDate = new Date(availableDates[0]);
            } else {
                currentDate = new Date();
            } */
            showCalendar(currentDate);
            selectNearestAvailableDate(currentDate);
        }
        

        function showCalendar(date) {
        	
        	
            const year = date.getFullYear();
            const month = date.getMonth();

            // 헤더 업데이트
            document.getElementById('currentMonth').textContent = year+'년 '+(month + 1)+'월';
	
            const firstDay = new Date(year, month, 1);
            const lastDay = new Date(year, month + 1, 0);
            const startingDay = firstDay.getDay();
            const totalDays = lastDay.getDate();

            const calendarBody = document.getElementById('calendarBody');
            calendarBody.innerHTML = '';

            let date_ = 1;
            for (let i = 0; i < 6; i++) {
                const row = document.createElement('tr');
                
                for (let j = 0; j < 7; j++) {
                    const cell = document.createElement('td');
                    
                    if (i === 0 && j < startingDay) {
                        // 빈 셀
                        cell.textContent = '';
                    } else if (date_ > totalDays) {
                        // 달력 끝난 후 빈 셀
                        cell.textContent = '';
                    } else {
                        cell.textContent = date_;
                        
                        cell.setAttribute('data-year', year);
                        const realMonth = month+1;  // 먼저 계산
                        cell.setAttribute('data-month', realMonth);
                        
                        cell.setAttribute('data-date', date_);
                        


                        
                        if (isAvailableDate(year, realMonth, date_)) {
                            cell.addEventListener('click', () => selectDate(cell.dataset.year, cell.dataset.month, cell.dataset.date));
                        } else {
                            cell.classList.add('disabled');
                        }

                        date_++;
                    }
                    row.appendChild(cell);
                }
                calendarBody.appendChild(row);
                if (date_ > totalDays) break;
            }
        }

        function selectDate(year, month, day) {
            // 이전 선택 제거
            const previousSelected = document.querySelector('.selected');
            if (previousSelected) {
                previousSelected.classList.remove('selected');
            }
            

            // 새로운 선택
            const cells = document.querySelectorAll('td');
            cells.forEach(cell => {
                if (cell.textContent === String(day)) {
                    cell.classList.add('selected');
                }
            });

            // 선택된 날짜 저장
            
            showMusicalRound(year, month, day);
            
            // 예약 폼 표시
            const reservationForm = document.getElementById('reservationForm');
            document.getElementById('selectedDate').textContent = 
                year+'년'+month+'월'+ day+'일';
            reservationForm.style.display = 'block';
        }
        
        function showMusicalRound(year, month, day) {
        	
            const formattedDate = year+'-'+month+'-'+day;
            
            
        	var params = 'm_code=${mddto.m_code}';
			params += '&mo_date='+formattedDate;
			sendRequest('getRounds.do', params, function(){
				if (XHR.readyState === 4) {
	    			if (XHR.status === 200) {
	    				var musicalOption = JSON.parse(XHR.responseText);  // JSON 파싱

	    				timeSelect.innerHTML = ''; // 기존 내용 초기화

	    				musicalOption.forEach((time, index) => {
	    				    var div = document.createElement('div');
	    				    div.className = 'time-option';  // 스타일 적용을 위한 클래스
	    				    div.innerHTML = index+1+'회차 <span>'+time+'</span>';
	    				    div.setAttribute('data-time', time);

	    				    
	    				    if(index==0){
	    				    	setTimeSelect(div,year, month, day);
	    				    }
	    				    
	    				    // 선택 가능하도록 클릭 이벤트 추가
	    				    div.onclick = function() {
	    				        // 기존 선택 제거
	    				        document.querySelectorAll('.time-option').forEach(el => {
	    				            el.classList.remove('selected');
	    				        });
	    				        // 현재 선택 표시
	    				        setTimeSelect(div,year, month, day);
	    				    };
	    				    
	    				    timeSelect.appendChild(div);
	    				});

	    			}
	    		}
			},
					'GET');
			
    		
    	}
        
        
        
        function showMusicalOption(div,year, month, day){
            const formattedDate = year+'-'+month+'-'+day;

        	var params = 'm_code=${mddto.m_code}';
			params += '&mo_date='+formattedDate+'&mo_time='+div.dataset.time;
			sendRequest('getSelectedMusicalOption.do', params, function(){
				if (XHR.readyState === 4) {
	    			if (XHR.status === 200) {
	    				
	    				var response = JSON.parse(XHR.responseText);  // JSON 파싱
	    				
	    				var actors = response.actors;
	    		        var seats = response.seats;

//	    				var remainSeats =document.querySelector('#remainSeats');
//	    				var roundCasting =document.querySelector('#roundCasting');
	    				
	    				var count = 0;
	    				remainSeats.innerHTML = '<p>';
	    				
	    				 for (let grade in response.seats) {
	    					 if(count!=0){
		    					 remainSeats.innerHTML += ' / '+ grade + ' : '+seats[grade];
	    					 } else {
		    					 remainSeats.innerHTML += grade + ' : '+seats[grade];

	    					 }
	    					 count++;
	    			     }
		    			remainSeats.innerHTML += '</p>';

	    				roundCastingList.innerHTML = '<p>';
	    				
	    				count=0;
	    				response.actors.forEach(actor => {
	    					if(count != 0){
		    					roundCastingList.innerHTML +=' / '+ actor.ma_name;

	    					} else{
		    					roundCastingList.innerHTML +=  actor.ma_name;

	    					}
	    					count++;
	    					
	    		        });
	    				roundCastingList.innerHTML +='</p>';

	    			}
	    		}
			},
					'GET');
        }
        
        
        // 시간 설정
        function setTimeSelect(div,year, month, day){
        	
        	div.classList.add('selected');
        	showMusicalOption(div,year, month, day);
        }
        
        

        function previousMonth() {
        	   const newDate = new Date(currentDate);
        	   newDate.setMonth(newDate.getMonth() - 1);

        	   // 오늘 날짜
        	   const today = new Date();
        	   today.setDate(1);  // 월 비교를 위해 1일로 설정

        	   if(newDate >= startDate && newDate >= today) {
        	       currentDate.setMonth(currentDate.getMonth() - 1);
        	       
        	       var year = currentDate.getFullYear();
        	       var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
        	       var dateString = year+'-'+month+'-01';
        	       
        	       var params = 'm_code=${mddto.m_code}&dateString='+ dateString;
        	       sendRequest('moveMonthCalendar.do', params, function(){
        	           if (XHR.readyState === 4) {
        	               if (XHR.status === 200) {
        	                   performList = JSON.parse(XHR.responseText);
        	                   availableDates = performList.map(perform => {
        	                       return new Date(perform.mo_date);
        	                   });
        	                   // 데이터 로드 완료 후 달력 표시
        	                   showCalendar(currentDate);
        	                   selectNearestAvailableDate(currentDate);

        	               }
        	           }
        	       }, 'GET');
        	   }
        	}

        function nextMonth() {
            const newDate = new Date(currentDate);
            newDate.setMonth(newDate.getMonth() + 1);
            
            if ((newDate.getFullYear() < endDate.getFullYear()) || 
                (newDate.getFullYear() === endDate.getFullYear() && newDate.getMonth() <= endDate.getMonth())) {
                currentDate.setMonth(currentDate.getMonth() + 1);
                
                var year = currentDate.getFullYear();
                var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
                var dateString = year+'-'+month+'-01';
                
                var params = 'm_code=${mddto.m_code}&dateString='+ dateString;
                sendRequest('moveMonthCalendar.do', params, function(){
                    if (XHR.readyState === 4) {
                        if (XHR.status === 200) {
                            performList = JSON.parse(XHR.responseText);
                            availableDates = performList.map(perform => {
                                return new Date(perform.mo_date);
                            });
                            // 데이터 로드 완료 후 달력 표시
                            showCalendar(currentDate);
                            selectNearestAvailableDate(currentDate);

                        }
                    }
                }, 'GET');
            }
        }
        
        function showMonthMusicalOption(){
        	
        	//currentDate = js date
        	var year = currentDate.getFullYear();
        	var month = (currentDate.getMonth() + 1).toString().padStart(2, '0'); // 1자리 월을 2자리로
        	var dateString = year+'-'+month+'-01';
        	var params = 'm_code=${mddto.m_code}&dateString='+ dateString;
        	sendRequest('moveMonthCalendar.do', params, function(){
        		if (XHR.readyState === 4) {
	    			if (XHR.status === 200) {
	    				
	    				console.log(XHR.responseText);
	    				
	    				performList = JSON.parse(XHR.responseText);
	    				
	    				availableDates = performList.map(perform => {
	    				    return new Date(perform.mo_date);
	    				});
	    				
	    				
	    			}
        		}
        	},
			'GET');
        }

        function makeReservation() {
        	//reserveMain.do
        	//param
        	
        	//m_code, mh_code, 일자, 시간
        	// selectedDate 
/*             if (!selectedDate) {
                alert('날짜를 선택해주세요.');
                return;
            }

            const time = document.getElementById('timeSelect').value;
            const reservationDate = selectedDate.toLocaleDateString();
            
            alert('예매가 완료되었습니다!\n날짜: '+reservationDate+'\n시간:'+time); */
            
            var selected = document.querySelector('.selected');
            
            if(!selected){
                alert('날짜를 선택해주세요.');
				return;
            }
            
            if(!s_id){
            	window.location.href = 'memberLogin.do';
            	return;
            }
            
            console.log(selected);
            
            var time_sel = document.querySelector('.time-option.selected');
            
            console.log(time_sel);
            
            var dateParam = selected.dataset.year+'-'+selected.dataset.month+'-'+selected.dataset.date;
            var timeParam = time_sel.dataset.time;
            
            window.open('reservMain.do?mh_code=${mhdto.mh_code }&m_code=${mddto.m_code}&sl_bind=1&selectedDate=' + dateParam + '&selectedTime=' + timeParam, "reservMain", "width=1250, height=850, top=100, left=200, location=no");
            
        }

        // 초기 달력 생성
        initCalendar();
        
    </script>

</body>

</html>