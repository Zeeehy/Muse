<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/muse/resources/js/httpRequest.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css"
	type="text/css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- 검색 아이콘 -->

<style>
.table-content td input {
    width: 95%;
    padding: 5px;
}
.main {
	width: 100%;
}

.table-content input[type="image"], input[name="ma_img"] {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
}
.partnerInfo{
	width:100%; 
}

.table-content input[value="저장"]{
	width: 80px;
    height: 40px;
    border-radius: 10px; 
    padding: 8px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
}
.table-content input[value="추가"]{
	width: 80px;
    height: 40px;
    border-radius: 10px; 
    padding: 8px 20px;
    background-color: #2d92f5;
    color: white;
    border: none;
    cursor: pointer;
}
.table-content input[value="찾기"]{
	width: 80px;
    height: 40px;
    border-radius: 10px; 
    padding: 8px 20px;
    background-color: #60c558;
    color: white;
    border: none;
    cursor: pointer;
}
.table-content input[value="삭제"] {
    border-radius: 10px;
    padding: 8px 20px;
    background-color: #f44336;
    color: white;
    border: none;
    cursor: pointer;
}
.table-content input[value="스케줄 등록"]{
	/* width: 80px;
    height: 40px; */
    border-radius: 10px; 
    padding: 8px 20px;
    background-color: #2d92f5;
    color: white;
    border: none;
    cursor: pointer;
}

/* .table-content table{
	margin:30px;
} */
</style>
</head>
<body>

	<%@include file="header.jsp"%>
	<%@include file="sidebar.jsp"%>
	<%@include file="actorPopup.jsp"%>
	<%@include file="musicalNamePopup.jsp"%>
	<div class="main-content">
		<div class="main-contenttop">
			<h1>캐스트 보드</h1>

			<hr>
		</div>
		<div class="table-content">
			<table>
				<tr>
					<th colspan="3">뮤지컬명</th>
					<td colspan="3"><input type="text" name="m_title"
						placeholder="뮤지컬을 선택하세요" readonly></td>
					<td colspan="2" class="button-container"><input type="button"
						value="찾기" onclick="showMusicalNamePopup(event)"></td>
				</tr>

				<tr>
					<th colspan="3">접수번호 / 상태</th>
					<td colspan="3"><input type="text"></td>
					<td colspan="2"><input type="button" value="찾기"></td>
				</tr>
			</table>
			<table id="dateTable">
				<tr>
					<th colspan="3" style="text-align: center;">공연 스케줄</th>
					<td><input type="date" id="startDate"></td>
					<td style="text-align: center;">~</td>
					<td><input type="date" id="endDate"></td>
					<td colspan="2"><input type="button" value="조회"
						onclick="addDateRows()"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;">공연일</td>
					<td colspan="3" style="text-align: center;">공연 시간</td>
					<td colspan="2"></td>
				</tr>

			</table>
			<div>
				<input type="button" value="스케줄 등록" onclick="insertMusicalDate()">
			</div>
			<table id="roleTable" style="margin-top: 10px;">
				<tr>
					<th colspan="4" style="text-align: center; width: 50%">배우 정보</th>
					<th style="text-align: center; width: 10%">출연일</th>
					<th style="text-align: center; width: 10%">출연 시간</th>
					<th style="width: 10%; text-align: right;">역할</th>
					<td style="width: 10%; text-align: center"><input type="text"
						id="roleInput"></td>
					<td colspan="1"><input type="button" value="추가"
						onclick="addRow()" ></td>

				</tr>
			</table>

			<div class="buttondiv">
				<input type="button" value="저장" onclick="insertCast()"> <input
					type="reset" value="취소">
			</div>
		</div>
	</div>
</body>
<script>
var roleArray = [];
var count = 0;
var countDate = 0;
var actorListName = []; //생성된 배우 역할 배열
var musical_code = '';
var dateList = []; //생성된 일자별 배우 등록 구분 배열
var selectValue ='';
var selectValueDate ='';

function show(){
	var actorName = document.getElementsByName('ma_name')[0].value;
	var param = 'ma_name=' + actorName
	if(actorName==''){
	alert('값입력');
	}else{
	sendRequest('seachActor.do',param,showResult,'GET');
	}
}

function showResult() {
    if (XHR.readyState === 4) {
        if (XHR.status === 200) {
            var actorlist = XHR.responseText;
            var data = JSON.parse(actorlist); 
            var tableBody = document.getElementById('actorTableBody');
            tableBody.innerHTML = '';

            if (data.list.length == 0) {  // 'data' 변수에서 'list' 참조
                var row = document.createElement('tr');
                var noResultCell = document.createElement('td');
                noResultCell.colSpan = 2;
                noResultCell.textContent = '검색된 결과가 없습니다.';
                row.appendChild(noResultCell);
                tableBody.appendChild(row);
            } else {
                for (var i = 0; i < data.list.length; i++) {
                    var dto = data.list[i];
                    var birthDate = new Date(dto.ma_birth); // Date 객체로 변환
                    var formattedBirthDate = formatDate(birthDate); // 형식화된 생일
                    var row = document.createElement('tr');  // 새로운 행 생성
                    var ma_code = dto.ma_code;
                    var ma_name = dto.ma_name;
                    var ma_img = dto.ma_img;
 					row.innerHTML = 
                    	    '<td style="text-align: center;">' +
                    	        '<a onclick="inputActorName()">' + ma_name + '</a>' +
                    	        '<input type="hidden" name="ma_code_popup" value="' + ma_code + '">' +
                    	        '<input type="hidden" name="ma_img_popup" value="' + ma_img + '">' +
                    	        '<input type="hidden" name="ma_name_popup" value="' + ma_name + '">' +
                    	    '</td>' +
                    	    '<td style="text-align: center;">' + formattedBirthDate + '</td>';
 					tableBody.appendChild(row);
                }
            }
        }
    }
    
}

//캐스트 보드에서만 필요함.
function inputMusicalName(element) {
    var MusicalName = element.textContent || element.innerText;  // 클릭된 항목의 텍스트 가져오기
    
    document.getElementsByName('m_title')[0].value = MusicalName;
    
    closeMusicalNamePopup();

    
 	var MusicalM_code= element.id; 
    var param = 'm_code=' + MusicalM_code;
    musical_code = MusicalM_code; // 팝업의 뮤지컬 검색창에서 뮤지컬 이름 선택하면 전역변수에 뮤지컬 dix값 저장됌
    alert('뮤지컬 idx'+musical_code);
    sendRequest('MusicalDateSelect.do',param, MusicalDateSelectResult,'GET');
    resetTables();
} 
//뮤지컬 이름 팝업에서 이름 클릭시 input date의min,max값 지정
function MusicalDateSelectResult(){
	if(XHR.readyState==4){
		if (XHR.status == 200) {
			var data = JSON.parse(XHR.responseText);
			var startDateBefore = new Date(data.Datedto.m_startDate);
			var endDateBefore = new Date(data.Datedto.m_endDate);
			var startDate = formatDate(startDateBefore);
			var endDate = formatDate(endDateBefore);
			document.getElementById('startDate').setAttribute("min", startDate);
			document.getElementById('startDate').setAttribute("max", endDate);
			document.getElementById('endDate').setAttribute("min", startDate);
			document.getElementById('endDate').setAttribute("max", endDate);

		}
	}
}
//추가한 배우 역할, 배우 idx 가져옴(삭제된것 뺴고)
function insertCast(){
	for (var i = 0; i < actorListName.length; i++) {
	    const trId = actorListName[i];  // 배열에서 id 값을 가져옴
	    const trElement = document.getElementById(trId);  // 해당 id를 가진 tr 요소를 찾음
		
	    var actorListTr = trElement.innerHTML;
	    //console.log(actorListTr);
	    const insertActorName = trElement.querySelector("#ma_char"); 
	   	const insertChar = insertActorName.textContent;
	    const insertMaCode = trElement.querySelector("input[name='ma_code']").value;

	    const maDateElement = trElement.querySelector("#ma_date");
	    const maTimeElement = trElement.querySelector("#ma_time");

		 // 선택된 값을 가져오기 위해 `value` 속성을 사용합니다.
	 	const selectedDate = maDateElement.value;
	 	const selectedTime = maTimeElement.value;
	    //console.log("이름 :", insertActorName);
	    console.log("이름 :", insertChar);
	    console.log("코드 :", insertMaCode);
	    console.log("날짜 :", selectedDate);
	    console.log("시간 :", selectedTime); 
	    var params = 'ma_code='+insertMaCode+'&mc_char=' + insertChar + '&m_code=' +musical_code+'&mo_date='+selectedDate +'&mo_time='+selectedTime;
	    if (insertMaCode === null || insertMaCode === '' || 
	    	    insertChar === null || insertChar === '' || 
	    	    musical_code === null || musical_code === '' || 
	    	    selectedDate === null || selectedDate === '' || 
	    	    selectedTime === null || selectedTime === '') {
	    	    alert('값을 모두 입력해주세요');
	    	}else{
	    		sendRequest('insertCast.do',params,insertCastResult,'GET');
	    	}
	}
}
//저장 isert문
function insertCastResult(){
	if(XHR.readyState==4){
		if (XHR.status == 200) {
			var data = XHR.responseText;
			var Jdata = JSON.parse(data);
			console.log(Jdata.result+"@@@@@@@@@@@@@@@@@@@@@@");
			if(Jdata.result>=1){
				alert('성공');
			}else{
				alert('실패');
				 document.getElementById('roleTable').innerHTML = `
				    	<tr>
						<th colspan="4" style="text-align: center; width: 50%">배우 정보</th>
						<th style="text-align: center; width: 10%">출연일</th>
						<th style="text-align: center; width: 10%">출연 시간</th>
						<th style="width: 10%; text-align: right;">역할</th>
						<td style="width: 10%; text-align: center"><input type="text" id="roleInput"></td>
						<td colspan="1"><input type="button" value="추가" onclick="addRow()"></td>
					</tr>
				    `;
			}
		}
	}
	
}


function inputActorName() {
    // 클릭된 요소의 부모 행(tr) 찾기
    var clickId = document.querySelector('#countNum').value;
    
    var row = document.querySelector('#'+clickId);

    //tr 내에서 ma_code, ma_name, ma_img input 요소(팝업창 hidden값임)
    var ma_code = document.querySelector('input[name="ma_code_popup"]').value;
    var ma_name = document.querySelector('input[name="ma_name_popup"]').value;
    var ma_img = document.querySelector('input[name="ma_img_popup"]').value;
    
    
    
	var ma_code2 =row.querySelector('input[name="ma_code"]');
    var ma_name2 =row.querySelector('input[name="ma_name"]');
    var ma_img2 =row.querySelector('input[name="ma_img"]');
	ma_code2.value=ma_code;
	ma_name2.value=ma_name;
	ma_img2.src=ma_img;
    closeActorPopup();
}

//타입 변환 함수 0000--00--00 00:00:00 를 년월일만 나오게
function formatDate(date) {
    var day = date.getDate();
    var month = date.getMonth() + 1; 
    var year = date.getFullYear();

    if (day < 10) {
        day = '0' + day;
    }
    if (month < 10) {
        month = '0' + month;
    }

    return year + '-' + month + '-' + day; // "yyyy-MM-dd" 형식으로 반환
}

function addRow() {
	if(document.getElementsByName("m_title")[0].value==null||document.getElementsByName("m_title")[0].value==''){
		alert('뮤지컬을 선택해주세요');
		return;
	}
	if(document.getElementById("roleInput").value == "" || document.getElementById("roleInput").value == null ){
		alert('역할을 입력해주세요');
		return;
	}
	count++;
    const table = document.getElementById("roleTable");
    const roleInput = document.getElementById("roleInput").value
    
    roleArray.push(roleInput);
    
    const newRow = table.insertRow();
    
    newRow.id="actor"+count;
    selectValueDate = newRow.id;
    actorListName.push(newRow.id);
    
    var end = `
	        <td colspan="2"><input type="image" name="ma_img" src="/muse/resources/img/actor/no_img.jpg" /></td>
	        <td style="text-align: center;">
	            <input type="text" name="ma_name" placeholder="배우 이름" required readonly>
	        </td>
	        
	        <td>
	            <input type="button" value="찾기" onclick="openActorPopup(event)">
	            
	            <input type="hidden" name="ma_code">
	        </td>
	        <td>
        		<select value="날짜선택" id="ma_date" onchange="searchTime(event)">
        		<option value="">날짜 선택</option>
        		</select>
        	</td>
        	<td>
    		<select value="시간선택" id="ma_time">
    		<option value="">시간 선택</option>
    		</select>
    	</td>
	        <td colspan="2" style="text-align: center;" id="ma_char">` + roleInput + `</td>
	        <td colspan="3"><input type="button" value="삭제" onclick="deleteRow(this)"></td>`;
    	newRow.innerHTML = end;
    
        document.getElementById("roleInput").value = ""; 
        //행추가 함수 끝나고 그 안의 날짜 선택값 입력 함수
        var param = 'm_code='+musical_code;
        sendRequest('dateList.do',param,dateListResult,'GET');
}

function dateListResult(){
	if (XHR.readyState === 4) {
        if (XHR.status === 200) {
	  //selectoption값 설정 시작
	var data = XHR.responseText;
var optionList = JSON.parse(data); 
var optionMa_date = optionList.Datelist.mo_date;
//for (var i = 0; i < actorListName.length; i++) {
   // var trId = actorListName[i]; 
   
   var trElement = document.getElementById(selectValueDate); 
    var ma_date = trElement.querySelector('#ma_date'); // #ma_date로 select 요소를 찾기
	//var ma_date = document.getElementById('ma_date');
  
    console.log(ma_date); //
    ma_date.innerHTML = '';
    for (var j = 0; j < optionList.Datelist.length; j++) {
        var item = optionList.Datelist[j];
        var date = new Date(item.mo_date);
        var formattedDate = formatDate(date); 
        var option = document.createElement('option');
        option.value = formattedDate;
        option.textContent = formattedDate;

        ma_date.appendChild(option); // ma_date에 옵션을 추가
    }
//}
}
}
}

function deleteRow(button) {
    const row = button.closest('tr');  // 'button'의 부모 요소인 tr을 찾아냄
    row.remove();  // tr 요소를 바로 삭제
    
    // actorListName에서 row.id 삭제
    const actorIndex = actorListName.indexOf(row.id);
    if (actorIndex !== -1) actorListName.splice(actorIndex, 1);

    // dateList에서 row.id 삭제
    const dateIndex = dateList.indexOf(row.id);
    if (dateIndex !== -1) dateList.splice(dateIndex, 1);
	
}
function addDateRows() {
	
	 if(document.getElementsByName("m_title")[0].value==null||document.getElementsByName("m_title")[0].value==''){
		alert('뮤지컬을 선택해주세요');
		return;
	}
	//seachMusicalOpenDate();
	    const startDateInput = document.getElementById("startDate").value; // 시작 날짜 입력
	    const endDateInput = document.getElementById("endDate").value;     // 종료 날짜 입력
	    
	 if (startDateInput ==''||startDateInput == null|| endDateInput==''||endDateInput==null) {
	        alert('시작 날짜와 종료 날짜를 선택해주세요');
	        return;
	    }
	
	 
		//입력했던 필드 초기화
		const table = document.getElementById("dateTable");
	
		  document.getElementById('dateTable').innerHTML = `
				<tr>
					<th colspan="3" style="text-align: center;">공연 스케줄</th>
					<td><input type="date" id="startDate"></td>
					<td style="text-align: center;">~</td>
					<td><input type="date" id="endDate"></td>
					<td colspan="2"><input type="button" value="조회"
						onclick="addDateRows()"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;">공연일</td>
					<td colspan="3" style="text-align: center;">공연 시간</td>
					<td colspan="2"></td>
				</tr>
				
			</table>
		    `;  
		    
		    
		    //초기화끝
		    
		    
	
   
    // Date 객체로 변환
    let currentDate = new Date(startDateInput);
    const endDate = new Date(endDateInput);

    // startDate가 endDate보다 작거나 같은 동안 반복
    while (currentDate <= endDate) {
    	countDate ++;
        const newRow = table.insertRow();
		newRow.id="Date"+countDate;
		dateList.push(newRow.id);
        // 날짜 포맷 (yyyy-mm-dd 형식으로)
        const formattedDate = currentDate.toISOString().split("T")[0];

        // 행 내용 추가
        	const formattedDateData=`
            <td colspan="4" style="text-align: center;" id="mo_date">` +formattedDate+ `</td>
            <td colspan="3" style="text-align: center;">
                <input type="text" name="mo_time" value="14:00" required style="text-align: center;">
            </td>
            <td colspan="2">
                <input type="button" value="삭제" onclick="deleteRow(this)">
            </td>
        `;
		newRow.innerHTML = formattedDateData;
        // 현재 날짜에 하루를 추가
        currentDate.setDate(currentDate.getDate() + 1);
    }
}




function openActorPopup(event) {
    // 클릭된 버튼의 위치 정보를 가져옵니다.
    var button = event.target;
    var buttonRect = button.getBoundingClientRect();
    
    // 팝업을 표시하고 위치를 조정합니다.
    var popup = document.getElementById("ActorPopup");
    popup.style.display = "block";
    popup.style.position = "absolute";
    
    // 버튼 우측에만 위치하도록 설정
    popup.style.top = (buttonRect.top + window.scrollY) + "px"; // 버튼의 세로 위치를 그대로 사용
    popup.style.left = (buttonRect.right + window.scrollX + 200) + "px"; // 버튼의 오른쪽에 배치 (5px 간격)
	
 
    var tr_id = event.target.closest('tr').id;
    
 	document.querySelector("#countNum").value = tr_id;
}
// 팝업 닫기
function closeActorPopup() {
    document.getElementById('ActorPopup').style.display = 'none';
}

//db인설트
function insertMusicalDate(){
	for(var i=0; i<dateList.length;i++){
		const trId = dateList[i];  // 배열에서 id 값을 가져옴
		alert(trId);
	    const trElement = document.getElementById(trId);
	    var dateListTr = trElement.innerHTML;
	    console.log(dateListTr);
	    const insertMo_date = trElement.querySelector("#mo_date").textContent;//태그타입
	    const insertMo_time = trElement.querySelector("input[name='mo_time']").value;
	    console.log("날짜 :", insertMo_date);
	    console.log("시간 :", insertMo_time);
	    
	    var params = 'm_code='+ musical_code +'&mo_date='+insertMo_date +'&mo_time='+insertMo_time;
		sendRequest('insertMusicalDateList.do',params,insertMusicalDateResult(),'GET'); 
	}
}
	
function insertMusicalDateResult(){
	if (XHR.readyState === 4) {
        if (XHR.status === 200) {
            var result = parseInt(XHR.responseText);
            if(result>=1){
            	alert('날짜 저장 완료');
            	
            }
        }
	}
}

//날짜의 시간값 구하기(optiontime값)
function searchTime(event){
	var selectDate = event.target.value;

	selectValue = event.target.closest('tr').id;

	console.log(selectValue+"@@@@@@@@@@@@@@");
	var param = 'm_code=' + musical_code + '&mo_date=' + selectDate;
	sendRequest('searchTime1.do',param,searchTimeResult,'GET');
}

	function searchTimeResult() {
	    if (XHR.readyState === 4) {
	        if (XHR.status === 200) {
	            var optionTimeList = JSON.parse(XHR.responseText);
	            var timelist = optionTimeList.Timelist;

	         
	                var trElement = document.getElementById(selectValue);
	                var ma_time = trElement.querySelector('#ma_time');
	                ma_time.innerHTML = ''; //ma_time의 값 초기화.
	                
	                var defaultOption = document.createElement("option");
	                defaultOption.value = "";
	                
	                for (var j = 0; j < timelist.length; j++) {
	                    var item = timelist[j]; 
	                    var optionElement = document.createElement("option");
	                    optionElement.value = item.mo_time; //
	                    optionElement.textContent = item.mo_time;
	                    ma_time.appendChild(optionElement);
	                }
	         
	        }
	    }
	}
	function resetTables() {
	    // 입력 필드를 먼저 초기화
	    document.getElementById('startDate').value = ''; // 시작 날짜 초기화
	    document.getElementById('endDate').value = '';   // 종료 날짜 초기화
	    document.getElementById('roleInput').value = ''; // 역할 입력 필드 초기화

	    // dateTable 초기화
	    document.getElementById('dateTable').innerHTML = `
			<tr>
				<th colspan="3" style="text-align: center;">공연 스케줄</th>
				<td><input type="date" id="startDate"></td>
				<td style="text-align: center;">~</td>
				<td><input type="date" id="endDate"></td>
				<td colspan="2"><input type="button" value="조회"
					onclick="addDateRows()"></td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;">공연일</td>
				<td colspan="3" style="text-align: center;">공연 시간</td>
				<td colspan="2"></td>
			</tr>
			
		</table>
	    `;

	    // roleTable 초기화
	    document.getElementById('roleTable').innerHTML = `
	    	<tr>
			<th colspan="4" style="text-align: center; width: 50%">배우 정보</th>
			<th style="text-align: center; width: 10%">출연일</th>
			<th style="text-align: center; width: 10%">출연 시간</th>
			<th style="width: 10%; text-align: right;">역할</th>
			<td style="width: 10%; text-align: center"><input type="text" id="roleInput"></td>
			<td colspan="1"><input type="button" value="추가" onclick="addRow()"></td>
		</tr>
	    `;
	}
</script>
</html>