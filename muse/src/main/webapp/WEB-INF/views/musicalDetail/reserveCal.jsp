<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
        }
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
        .calendar-header button {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 4px;
        }
        .calendar-header button:hover {
            background: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: center;
        }
        th {
            background: #f5f5f5;
        }
        td {
            cursor: pointer;
        }
        td:hover {
            background: #f0f0f0;
        }
        .today {
            background: #e3f2fd;
        }
        .selected {
            background: #b3e5fc;
        }
        .disabled {
            color: #ccc;
            cursor: not-allowed;
        }
        .reservation-form {
            margin-top: 20px;
            padding: 20px;
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
    </style>
</head>
<body>
 <div class="calendar-container">
        <div class="calendar-header">
            <button onclick="previousMonth()">&lt; 이전</button>
            <h2 id="currentMonth"></h2>
            <button onclick="nextMonth()">다음 &gt;</button>
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
            <h3>회차: <span id="selectedDate"></span></h3>
            <p>공연 시간 선택:</p>
            <div id="timeSelect">

            </div>
            <div id="remainSeats">
            
            </div>
            <div id="roundCasting">
            	<h3 class="roundCastingHead">캐스팅</h3>
            	<div id="roundCastingList"></div>
            </div>
            <button onclick="makeReservation()">예매하기</button>
        </div>
    </div>

    <script>
    
    const startDate = new Date('2024-11-15');
    const endDate = new Date('2025-06-22');
    
    console.log(startDate);
    console.log(endDate);
    startDate.setHours(0, 0, 0, 0);
    endDate.setHours(23, 59, 59, 999);


	var remainSeats =document.querySelector('#remainSeats');
	var roundCastingList =document.querySelector('#roundCastingList');
    let currentDate = new Date();
    let selectedDate = null;
    var m_code = '${mddto.m_code}';
    	
		var timeSelect = document.querySelector('#timeSelect');

        // 공연 가능한 날짜 (예시 데이터)
        const availableDates = [5, 6, 12, 13, 19, 20, 26, 27];
        
        function isAvailableDate(year, month, day) {
            const checkDate = new Date(year, month-1, day);
            checkDate.setHours(0, 0, 0, 0);

            // 시작일과 종료일 사이에 있는지, 오늘 이후인지 확인
            if (checkDate >= startDate && checkDate <= endDate && checkDate >= new Date()) {
            	console.log('분기');
            	console.log(checkDate);
            	console.log(startDate);
            	console.log(endDate);
                const dayOfWeek = checkDate.getDay();
                // 공연 요일 체크 (예: 월요일 공연)
                
                if (dayOfWeek < 8) {
                    return true;
                }
            }
            return false;
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
            currentDate = new Date() < startDate ? new Date(startDate) : new Date();
            showCalendar(currentDate);
            // 가장 가까운 예매 가능일 선택
            selectNearestAvailableDate(currentDate);
        }

        function showCalendar(date) {
            const year = date.getFullYear();
            const month = date.getMonth();

            // 헤더 업데이트
            document.getElementById('currentMonth').textContent = year+'년'+(month + 1)+'월';

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
	    				    div.innerHTML = index+1+'회차<span>'+time+'</span>';
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
	    		        console.log(actors);
	    		        console.log(seats);
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
        	       showCalendar(currentDate);
        	   }

        }

        function nextMonth() {
            currentDate.setMonth(currentDate.getMonth() + 1);
            showCalendar(currentDate);
        }

        function makeReservation() {
            if (!selectedDate) {
                alert('날짜를 선택해주세요.');
                return;
            }

            const time = document.getElementById('timeSelect').value;
            const reservationDate = selectedDate.toLocaleDateString();
            
            alert('예매가 완료되었습니다!\n날짜: '+reservationDate+'\n시간:'+time);
        }

        // 초기 달력 생성
        initCalendar();
        
    </script>

</body>

</html>