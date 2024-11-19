<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	width: 20px;
    height: 20px;
    float: left;
    display: flex;
    justify-content: center;
    align-items: center;
    border: none;
    border-radius: 3px;
    margin: 2.5px;
}

.row{
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}
.row .row_zone p{
	width:15px;
	height:18px;
	margin:0;
	display: flex;
    align-items: center;
    justify-content: center;
    margin: 2.5px;
    
}
.seats{
	margin: 5px;
    background: #e5e5e5;
    border: 0px;
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
	
}

.section_B .row{
	  justify-content: center;
	
}

.section_C .row{
	  justify-content: flex-start;
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
	margin:6px;}


/* 1점 : 빨강, 주황, 노랑, 연초록, 초록  */
.score1{
	background-color: red;
}

.score2{
	background-color: orange;
}

.score3{
	background-color: yellow;
}

.score4{
	background-color: lightgreen;
}

.score5{
	background-color: green;
}

 .score0{
	/*background-color:pink;*/
} 


</style>

<script type="text/javascript">

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
			
			
			var seat_div = document.createElement('div');
			seat_div.classList.add('seats');
			
			// id 설정하는 부분은 바꾸어 활용할 것
			// 현재는 seat의 position만 활용하였기때문에, 중복되는 id 발생 
			// => ex) 층 섹션 행 열 을 활용하여 id 설정하면 좋을 듯
			//seat_div.innerHTML = '<div class="seat" id="ps_'+(seatNum)+'"><p>'+(index+1)+'</p></div>';
			seat_div.innerHTML = '<div class="seat" id="ps_'+(seatNum)+'"><p>'+(seatNum)+'</p></div>';
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
	                         // 좌석 등급별 처리
	                     positionSeats.forEach((real_seat, index) => {
	                         // 기존 등급 클래스들 제거
	                         seat_div.classList.remove('score1', 'score2', 'score3', 'score4','score5','score0');
	                         
	                         console.log("aaa : "+real_seat.avg_score);
	                         
	                         // 좌석별 평점 가져오기
	                         switch(Math.round(real_seat.avg_score)  ) {
	                             case 1:
	                                 seat_div.classList.add('score1');
	                                 break;
	                             case 2:
	                                 seat_div.classList.add('score2');
	                                 break;
	                             case 3:
	                                 seat_div.classList.add('score3');
	                                 break;
	                             case 4:
	                                 seat_div.classList.add('score4');
	                                 break;
	                             case 5:
	                                 seat_div.classList.add('score5');
	                                 break;    
	                             default:
	                                 // 기본 스타일
	                                 seat_div.classList.add('score0');
	                         }
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

// 특정 좌석 정보를 출력하는 예시
function testClick(rowLayout, event) {
    // 클릭된 요소에서 가장 가까운 .seat 클래스를 가진 부모 요소 찾기
    // 이벤트 버블링 때문에
    const seatDiv = event.target.closest('.seat');
    
	var str = '';
	var params = ''; // URL로 전달할 파라미터 문자열
	var s_position = '';
	
    // rowLayout 객체의 모든 키와 값을 출력
    Object.entries(rowLayout).forEach(([key, value]) => {
        //console.log(`${key}: ${value}`);
        str+=key+':'+value+'\r\n';
        if(key=="sl_code" || key=="sl_section" || key=="sl_row" || key=="sl_floor"){
        	params += key+"="+value+"&"; // 파라미터로 추가
        }
        
    });
	
    // 마지막 '&'를 제거
    if (params.length > 0) {
        params = params.slice(0, -1); // 끝의 '&' 제거
        s_position = seatDiv.id.slice(3);
    }
	
    if (seatDiv && seatDiv.id) {
        //console.log('클릭된 요소 ID:', seatDiv.id);
        //alert(str+'클릭된 요소 ID: ' + seatDiv.id);
        //alert(params);
        
        if (params) {
            // 템플릿 리터럴을 사용하여 params가 제대로 URL에 반영되도록 함
            //window.location.href = `srShowList.do?${params}`;
            var mh_code ='${mh_code}';
            var m_code ='${m_code}';
            
            window.location.href = "srShowList.do?"+params+"&s_position="+s_position+"&mh_code="+mh_code+"&m_code="+m_code;
            
        } else {
            alert('전송할 파라미터가 없습니다.');
        }

       
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
        //const avg_score = seat.avg_score;

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

<div id="floor">

	<div class="floor_container">
		
	</div>
</div>

</body>
</html>