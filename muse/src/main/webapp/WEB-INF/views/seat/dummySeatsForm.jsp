<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<style>


.floorSection {
    display: flex;
    justify-content: center;
    gap : 30px;
}
/* .A1A1{
	display: flex;
} */


.seating_table_container{
	display: flex;
    justify-content: center;
    align-items: center;
    margin: 40px;
    font-weight: bolder;
}

/* .seattable_zone_container{
    height: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 20px 0;
} */

.first, .second{
	display: flex;
    justify-content: center;
    align-items: center;
    margin: 40px;
    font-weight: bolder;
}


.seat {
    height: 25px;
    float: left;
    display: flex;
    justify-content: center;
    align-items: center;
    border: none;
    border-radius: 10%;
    margin: 2.5px;
}

.row{
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}
.row .row_zone p{
	width:25px;
	height:25px;
	margin:0;
	display: flex;
    align-items: center;
    justify-content: center;
    margin: 2.5px;
    
}
.seats{
	margin : 5px;
	background: yellow;
}
.seat {
    width: 25px;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    unicode-bidi: isolate;
}

/* .section_A,.section_B,.section_C{
	display: flex;
} */

.section_A .row{
	  justify-content: flex-end;
	  height: 40px;
	
}

.section_B .row{
	  justify-content: center;
	
}

.section_C .row{
	  justify-content: flex-start;
	      height: 40px;
}

#seattable_zone{
	text-align: center;
}

.rowNum{
	margin-top: 21.3px;
	display: flex;
    flex-direction: column;
}
.row_zone {
	margin:5px;}

.VIP{
	background-color: red;
}

</style>

<script type="text/javascript">

var m_code = 'm_1';
var mhl_code = 'mhl_1';


// 존재하는 모든 섹션 ver json
var jsection = ${section};

// 모든 좌석레이아웃 ver json
var layoutData = ${layouts};

// 모든 층수 ver json
var jfloor = ${floor};

// 모든 좌석 ver json
var seatList = ${seatList};

console.log(seatList);

// 한 층의 최대 행을 가져와 뿌리기 위함 ex)12 => 1~12
// 몰라도 됨
var obj = JSON.parse('${max_rowMap}');
var jmax_rowMap = new Map(Object.entries(obj));

// 층별 map (좌석레이아웃)
// ex) key = 1,2
// value = groupLayout =>sectionLayout => line => 좌석
var floorGroupMap = new Map();

// 층별 섹션별 출력할 div map
var floorGroupDiv = new Map();

// seatList를 층별 섹션별로 관리하기 위함
var floorSeatMap = new Map();

var dummyFloorMap = new Map();

var count = 0;

document.addEventListener("DOMContentLoaded",()=>{
	
	const floorContainer = document.querySelector('.floor_container');


 // 층별로 그룹레이아웃을 관리하는 Map 객체 생성
    // `layoutData` 배열을 순회하면서 층별로 그룹화된 섹션 데이터를 저장
    layoutData.forEach(function(line,index) {
    	
    	//seatLayout의 구역과 층
        var section = line.sl_section;
        var floor = line.sl_floor;

        // 층이 처음 등장하면 `floorGroupMap`에 빈 Map을 초기화
        // floorGroupMap => 층/섹션/seat_layout
        // floorGroupDiv => 층/섹션/div (좌석들이 출력될 div)
        if (!floorGroupMap.has(floor)) {
        	
            floorGroupMap.set(floor, new Map());
            floorGroupDiv.set(floor, new Map());
            
            const floorDiv = document.createElement('div');
            floorDiv.className = 'floor';
            floorDiv.id = 'floor_'+floor;
            floorDiv.innerHTML = '<div class="seating_table_container"><div id="sittable_floor">'+floor+'층</div></div>'; // 예: "1층", "2층" 등
            
            const floorSectionDiv = document.createElement('div');
            floorSectionDiv.className = 'floorSection';
            floorSectionDiv.id = 'floorSection'+floor;
            

            floorContainer.appendChild(floorDiv);
            floorDiv.appendChild(floorSectionDiv);
            
            
        }

        // 해당 층의 섹션별 그룹화된 데이터를 관리하는 Map 가져오기
        var groupLayout = floorGroupMap.get(floor);
        var groupDiv = floorGroupDiv.get(floor);
        
        // 섹션이 처음 등장하면 `groupLayout`에 빈 배열을 초기화
        if (!groupLayout.has(section)) {
            groupLayout.set(section, []);
            
         // 해당 섹션에 대한 `<div>` 동적 생성 및 추가
            const sectionDiv = document.createElement('div');
            sectionDiv.className = 'section_'+section;
            sectionDiv.textContent = '섹션: '+section;

            // 생성한 층 `<div>`에 섹션 `<div>` 추가
            const floorSectionDiv = document.getElementById('floorSection'+floor);
            floorSectionDiv.appendChild(sectionDiv);
            
            
            if(section!='C'){
                makeRowNum(floorSectionDiv,floor);
            }
            
            //section을 키값으로 해당 div를 추가
            // ex) key = 'A', value = div 
            groupDiv.set(section, sectionDiv);

            
        }

        // 현재 좌석 정보를 해당 섹션 배열에 추가
        groupLayout.get(section).push(line);
    });
    
    
    // seatList를 map으로 변환하는 코드
    makeSeatListToMap();

    
    // 맵 객체로 좌석 출력하는 코드
    
    // 층별
    // 2,3 	
 	jfloor.forEach(function(floor){
 		// 구역별
 		// A,B,C
 		jsection.forEach((section)=>{
 			// 해당하는 layout과 div를 가져옴
            let sectionLayout = floorGroupMap.get(floor).get(section);
            let section_div = floorGroupDiv.get(floor).get(section);
            section_div.innerHTML = '<div class="seattable_zone_container"><div id="seattable_zone">'+section+'</div></div>';

            
            if (sectionLayout) {
            	sectionLayout.forEach((rowLayout) => {
            		//console.log("좌석 코드: " + seat.sl_code);
            		
					// 해당하는 좌석레이아웃으로 좌석을 설정하는 함수
            		setSeats(section_div,rowLayout);  
                    

                });
            } else {
                console.log("해당 섹션에 데이터가 없습니다: " + section);
            }

 		});
 		
 	});

console.log('here');
console.log(floorGroupMap);
 console.log(floorGroupDiv);
 console.log(floorSeatMap);
    
});

// 좌석 설정하는 함수
function setSeats(section_div,rowLayout){
	
	// n.n.s.s.s.s.s.s.n.n
	var seatsData = rowLayout.sl_data.split('.');	
	
	// 좌석을 담을 div 생성
	var seats_div = document.createElement('div');
	seats_div.classList.add('row');
	
	// seat table의 position 값과 비교하는데 사용되는 변수
	var seatNum = 0;
	
	seatsData.forEach((seat,index)=>{

		if(seat === 's'){
			
			// 좌석을 설정할 때마다 증가
			seatNum++;
			count++;
			
			var seat_div = document.createElement('div');
			seat_div.classList.add('seats');
			
			// id 설정하는 부분은 바꾸어 활용할 것
			// 현재는 seat의 position만 활용하였기때문에, 중복되는 id 발생 
			// => ex) 층 섹션 행 열 을 활용하여 id 설정하면 좋을 듯
			//seat_div.innerHTML = '<div class="seat" id="ps_'+(seatNum)+'"><p>'+(index+1)+'</p></div>';
			seat_div.innerHTML = '<div class="seat" id="ps_'+(seatNum)+'"><p>'+(count)+'</p></div>';
			//seat_div.innerHTML = '<div class="seat"><p>'+(rowLayout.sl_code)+'</p></div>';
			
			
			seats_div.appendChild(seat_div);
			
			// 모든 좌석에 click 이벤트 활용하는 예시
			seat_div.addEventListener("click",function(event){
				testClick(rowLayout,event);
			});
			
			
	 		
/* 			
  			배열을 활용한 특정 좌석에 접근하는 법 (성능 낮음)
 			seatList.forEach(function(real_seat){
				console.log(real_seat);
				if(rowLayout.sl_row==real_seat.s_row && seatNum == real_seat.s_position && rowLayout.sl_floor == real_seat.s_floor &&
						rowLayout.sl_section == real_seat.s_section){
					
					seat_div.classList.add('VIP');
				}
			});
 */			
 			
 			// map을 활용한 특정 좌석에 접근하기
 			// ex) 예매된 좌석 처리, 등급별 색상 처리
			const floorMap = floorSeatMap.get(rowLayout.sl_floor);
			//console.log(floorMap);

			// 층별 접근
			if (floorMap) {
			    const sectionMap = floorMap.get(rowLayout.sl_section);
			    // 섹션별 접근
			    if (sectionMap) {
			        const rowMap = sectionMap.get(rowLayout.sl_row);
			        // 행별 접근
			        if (rowMap) {
			            const positionSeats = rowMap.get(seatNum);
			            // 열별 접근 (좌석 정보가 존재할 경우)
			            if (positionSeats) {
			                // seat Table 데이터 처리
			                positionSeats.forEach((real_seat,index) => {
			                    // 행, 열 확인
			                        // class 부여 => 색 표시
			                        //alert(seatNum + ' : ' + real_seat.s_position);
			                        
			                        
			                        seat_div.classList.add('VIP');
			                        
			                    
			                });
			            }
			        }
			    }
			}


				 
			
		} else if (seat ==='e') {
			var empty_seat_div = document.createElement('div');
			empty_seat_div.classList.add('seat');
			
			seats_div.appendChild(empty_seat_div);
		}
		
		
	});
	
	section_div.appendChild(seats_div);
	
}
function deepCopyMap(originalMap) {
    let newMap = new Map();

    originalMap.forEach((value, key) => {
        if (value instanceof Map) {
            // 값이 Map 객체인 경우, 재귀적으로 복사
            newMap.set(key, deepCopyMap(value));
        } else if (Array.isArray(value)) {
            // 값이 배열인 경우, 복사
            newMap.set(key, [...value]);
        } else {
            // 기본 값인 경우, 그대로 복사
            newMap.set(key, value);
        }
    });

    return newMap;
}

function makeDummy(){
	
	let copyFloorMap = deepCopyMap(floorGroupMap);
	
	console.log("더미 시작");
	
	jfloor.forEach(function(floor){
 		// 구역별
 		// A,B,C
 		jsection.forEach((section)=>{
 			// 해당하는 layout과 div를 가져옴
            let sectionLayout = copyFloorMap.get(floor).get(section);
            
 			
 			console.log(sectionLayout);
 			
            if (sectionLayout) {
            	sectionLayout.forEach((rowLayout) => {
            	setDummySeats(rowLayout);

                });
            } else {
                console.log("해당 섹션에 데이터가 없습니다: " + section);
            }

 		});
 		
 	});
	
	console.log(dummyFloorMap);
	
}

function setDummySeats(rowLayout){
    // n.n.s.s.s.s.s.s.n.n
    var seatsData = rowLayout.sl_data.split('.');    
    
    // 좌석을 담을 div 생성
    
    // seat table의 position 값과 비교하는데 사용되는 변수
    var seatNum = 0;
    
    seatsData.forEach((seat, index) => {
        if (seat === 's') {
            seatNum++;
            
            const floor = rowLayout.sl_floor; // seat -> rowLayout 으로 수정
            const section = rowLayout.sl_section; // seat -> rowLayout 으로 수정
            const row = rowLayout.sl_row; // seat -> rowLayout 으로 수정
            
            // dummyFloorMap
            if (!dummyFloorMap.has(floor)) {
                dummyFloorMap.set(floor, new Map());
            }

            const dummySectionMap = dummyFloorMap.get(floor);
            
            if (!dummySectionMap.has(section)) {
                dummySectionMap.set(section, new Map());
            }
            
            const dummyRowMap = dummySectionMap.get(section);
            
            if (!dummyRowMap.has(row)) {
                dummyRowMap.set(row, new Map());
                // 여기서 dummySectionMap에 다시 할당
                dummySectionMap.set(section, dummyRowMap);
            }
            
            const dummyPositionMap = dummyRowMap.get(row);
            if (!dummyPositionMap.has(seatNum)) {
                dummyPositionMap.set(seatNum, []);
                // 여기서 dummyRowMap에 다시 할당
                dummyRowMap.set(row, dummyPositionMap);
            }

            if (section == 'A') {
                dummyPositionMap.get(seatNum).push(["sg_1", m_code, mhl_code, section, seatNum, row, floor]);

            } else if (section == 'B') {
                // section B 관련 로직
            	dummyPositionMap.get(seatNum).push(["sg_2", m_code, mhl_code, section, seatNum, row, floor]);

            } else {
                // 기타 섹션 관련 로직
            	dummyPositionMap.get(seatNum).push(["sg_3", m_code, mhl_code, section, seatNum, row, floor]);
            }
        } else if (seat === 'e') {
            // 빈 좌석 관련 로직
        }
    });
}

function sendDummyFloorMapToController() {
    // dummyFloorMap을 평범한 객체로 변환
    let dummyFloorObject = {};
    dummyFloorMap.forEach((sectionMap, floor) => {
        dummyFloorObject[floor] = {};
        sectionMap.forEach((rowMap, section) => {
            dummyFloorObject[floor][section] = {};
            rowMap.forEach((positionMap, row) => {
                dummyFloorObject[floor][section][row] = {};
                positionMap.forEach((positions, seatNum) => {
                    dummyFloorObject[floor][section][row][seatNum] = positions;
                });
            });
        });
    });

    console.log("전송할 데이터:", JSON.stringify(dummyFloorObject)); // 데이터 확인용
    console.log(JSON.stringify(dummyFloorObject, null, 2));
    // 서버로 데이터 전송
    fetch('insertDummySeats.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=UTF-8',
            'Accept': 'application/json'
        },
        body: JSON.stringify(dummyFloorObject)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        console.log('서버 응답:', data);
    })
    .catch(error => {
        console.error('오류 발생:', error);
    });
}



// 특정 좌석 정보를 출력하는 예시
function testClick(rowLayout, event) {
    // 클릭된 요소에서 가장 가까운 .seat 클래스를 가진 부모 요소 찾기
    // 이벤트 버블링 때문에
    const seatDiv = event.target.closest('.seat');
    
	var str = '';
    // rowLayout 객체의 모든 키와 값을 출력
    Object.entries(rowLayout).forEach(([key, value]) => {
        console.log(`${key}: ${value}`);
        
        str+=key+':'+value+'\r\n';
    });
	
    if (seatDiv && seatDiv.id) {
        console.log('클릭된 요소 ID:', seatDiv.id);
        alert(str+'클릭된 요소 ID: ' + seatDiv.id);
    } else {
        console.log('클릭된 요소에 ID가 없습니다.');
    }

}


// 구역과 구역 사이의 기다란 숫자 근데 신경안써도 됨
function makeRowNum(floorSectionDiv,floor){
	
	var rowNumDiv = document.createElement('div');
	rowNumDiv.classList.add('rowNum');

	for(var i=1; i<=jmax_rowMap.get(""+floor); i++){

		rowNumDiv.innerHTML += '<div class="row"><div class="row_zone"><p class="seat_num">'+i+'</p></div></div>';

	}
	
	floorSectionDiv.appendChild(rowNumDiv);

}


function makeSeatListToMap() {
    // 층별 섹션별로 데이터를 그룹화하기 위한 맵
    seatList.forEach((seat) => {
        const floor = seat.s_floor;
        const section = seat.s_section;
        const row = seat.s_row;
        const position = seat.s_position;

        // 층이 처음 등장하면 층에 대한 새로운 Map을 초기화
        if (!floorSeatMap.has(floor)) {
            floorSeatMap.set(floor, new Map());
        }

        // 섹션이 처음 등장하면 섹션에 대한 새로운 Map을 초기화
        const sectionMap = floorSeatMap.get(floor);
        if (!sectionMap.has(section)) {
            sectionMap.set(section, new Map());
        }

        // 행이 처음 등장하면 행에 대한 새로운 Map을 초기화
        const rowMap = sectionMap.get(section);
        if (!rowMap.has(row)) {
            rowMap.set(row, new Map());
        }

        // 열이 처음 등장하면 새로운 배열을 초기화
        const positionMap = rowMap.get(row);
        if (!positionMap.has(position)) {
            positionMap.set(position, []);
        }

        // 최하위 배열에 좌석 추가
        positionMap.get(position).push(seat);
    });
}



</script>
</head>
<body>
<div>
sendDummyFloorMapToController
	<input type="button" onclick="makeDummy();" value="makeDummy" style="width:500px; height:500px;" >
	<input type="button" onclick="sendDummyFloorMapToController();" value="sendDummyFloorMapToController" style="width:500px; height:500px;" >
</div>
<div id="floor">

	<div class="floor_container">
		
	</div>
</div>

</body>
</html>