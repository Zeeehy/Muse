<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/muse/resources/js/httpRequest.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css"
	type="text/css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- 검색 아이콘 -->

<style>
.main {
	width: 100%;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<%@include file="sidebar.jsp"%>
	<%@include file="actorPopup.jsp"%>
	<div class="main-content">
		<div class="main-contenttop">
			<h1>캐스트 보드</h1>

			<hr>
		</div>
		<div class="table-content">
			<table>
				<tr>
					<th colspan="3">뮤지컬명</th>
					<td colspan="3"><input type="text"></td>
					<td colspan="2"><input type="button" value="찾기"></td>
				</tr>
				<tr>
					<th colspan="3">접수번호 / 상태</th>
					<td colspan="3"><input type="text"></td>
					<td colspan="2"><input type="button" value="찾기"></td>
				</tr>

			</table>
			<table border="1" id="roleTable" style="margin-top:0px;">
				<tr>
					<th colspan="4" style="text-align: center; width:65%">역할 선택</th>
					<td colspan="2"><input type="text" id="roleInput"></td>
					<td colspan="1"><input type="button" value="추가" onclick="addRow()"></td>

				</tr>
				<tr>

					<td colspan="4" style="text-align: center;">배우</td>
					<td colspan="2" style="text-align: center;">역할</td>
					<td></td>
				</tr>
			</table>
			<input type="submit" value="저장">
			<!-- ajax처리 -->
			<table border="1" id="dateTable">

				<tr>
					<th colspan="3">일자별 배우 등록</th>
					<td><input type="date" id="startDate"></td>
					<td style="text-align: center;">~</td>
					<td><input type="date" id="endDate"></td>
					<td colspan="2"><input type="button" value="조회"
						onclick="addDateRows()"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">공연일</td>
					<td colspan="3" style="text-align: center;">시간</td>
					<td colspan="3" style="text-align: center;">역할</td>
					<td>삭제 버튼</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">공연일</td>
					<td colspan="3" style="text-align: center;"><select>
							<option>시간</option>
							<option>10:00</option>
							<option>14:00</option>
					</select></td>
					<td colspan="3" style="text-align: center;">배우 역할</td>
					<td></td>
				</tr>
			</table>
			<h2>파트너 정보</h2>
			<table>
				<tr>
					<th>파트너 명</th>
					<td><input type="text" required></td>
				</tr>
				<tr>
					<th>사업자 번호</th>
					<td><input type="text" required></td>
				</tr>
				<tr>
					<th>사업자 명</th>
					<td><input type="text" required></td>
				</tr>
				<tr>
					<th>대표자 이름</th>
					<td><input type="text" required></td>
				</tr>
			</table>
			<div class="buttondiv">
				<input type="submit" value="신청"> <input type="reset"
					value="취소">
			</div>
		</div>
	</div>



</body>
<script>
var roleArray = [];
var count = 0;

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
            tableBody.innerHTML = '';  // 기존 테이블 데이터 초기화

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
                    alert(ma_code + ma_name + ma_img);
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

function inputActorName() {
    // 클릭된 요소의 부모 행(tr) 찾기
    var clickId = document.querySelector('#countNum').value;
    
    //clickId.parentNode.id;
    //alert(clickId.parentNode.name);
    
    alert(clickId);
    var row = document.querySelector('#'+clickId);  // clickId라는 ID를 가진 tr을 찾음
    alert(row);

    // 해당 tr 내에서 ma_code, ma_name, ma_img input 요소들을 찾습니다
    var ma_code = document.querySelector('input[name="ma_code_popup"]').value;
    var ma_name = document.querySelector('input[name="ma_name_popup"]').value;
    var ma_img = document.querySelector('input[name="ma_img_popup"]').value;
    
    alert(ma_code+ma_name+ma_img)
    
    
	var ma_code2 =row.querySelector('input[name="ma_code"]');
    var ma_name2 =row.querySelector('input[name="ma_name"]');
    var ma_img2 =row.querySelector('input[name="ma_img"]');
	ma_code2.value=ma_code;
	ma_name2.value=ma_name;
	ma_img2.src=ma_img;
    closeActorPopup();
}





//타입 변환 함수
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
	count++;
    const table = document.getElementById("roleTable");
    const roleInput = document.getElementById("roleInput").value
    
    roleArray.push(roleInput);
    
    const newRow = table.insertRow();
    
    newRow.id="actor"+count;
    
    var end = `
	        <td colspan="2"><input type="image" name="ma_img" /></td>
	        <td style="text-align: center;">
	            <input type="text" name="ma_name" placeholder="배우 이름">
	        </td>
	        <td>
	            <input type="button" value="검색" onclick="openActorPopup(event)">
	            <input type="hidden" name="ma_code">
	        </td>
	        <td colspan="2" style="text-align: center;">` + roleInput + `</td>
	        <td><input type="button" value="삭제" onclick="deleteRow(this)"></td>
    `;

        
    newRow.innerHTML = end;
    
        document.getElementById("roleInput").value = "";
}

// 행 삭제 함수
function deleteRow(button) {
    const row = button.parentNode.parentNode;
    row.parentNode.removeChild(row);
}

function addDateRows() {
    const table = document.getElementById("dateTable"); // 행을 추가할 테이블
    const startDateInput = document.getElementById("startDate").value; // 시작 날짜 입력
    const endDateInput = document.getElementById("endDate").value;     // 종료 날짜 입력

    // Date 객체로 변환
    let currentDate = new Date(startDateInput);
    const endDate = new Date(endDateInput);

    // startDate가 endDate보다 작거나 같은 동안 반복
    while (currentDate <= endDate) {
        const newRow = table.insertRow();

        // 날짜 포맷 (yyyy-mm-dd 형식으로)
        const formattedDate = currentDate.toISOString().split("T")[0];
		alert(formattedDate);

        // 행 내용 추가
        	const formattedDateData=`
            <td colspan="2" style="text-align: center;">` +formattedDate+ `</td>
            <td colspan="3" style="text-align: center;">
                <select>
                    <option>시간</option>
                    <option>10:00</option>
                    <option>14:00</option>
                    <option>18:00</option>
                </select>
            </td>
            <td colspan="3" style="text-align: center;">
                <input type="text" placeholder="역할 입력">
            </td>
            <td>
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
</script>
</html>