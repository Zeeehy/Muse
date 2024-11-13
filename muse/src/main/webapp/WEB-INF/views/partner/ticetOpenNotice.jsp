<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="/muse/resources/js/httpRequest.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
</head>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
<%@include file="musicalNamePopup.jsp"%>

<style>
table tr, th, td { /* 
	border: 1px solid black; */
	
}

.radio-btn {
	margin-right: 8px; /* 라디오 버튼과 텍스트 사이의 간격 조정 */
}



/* 라디오 버튼을 조금 더 커지게 설정 */
.radio-btn {
	width: 16px;
	height: 16px;
	margin-right: 5px;
}

.table-content td input[type="radio"], td input[type="checkbox"] {
	width: auto;
	margin-right: 15px;
}

.textarea-style {
	width: 100%;
	height: 80px;
	border-radius: 8px; /* 둥근 모서리 */
	font-size: 16px;
	background-color: #f9f9f9;
	resize: none; /* 크기 조절 아이콘 제거 */
}

.disabled-date {
	background-color: #e0e0e0;
	cursor: not-allowed;
}
    .table-content input[value="찾기"]{
	/* width: 80px;
    height: 40px; */
    border-radius: 10px; 
    padding: 8px 20px;
    background-color: #2d92f5;
    color: white;
    border: none;
    cursor: pointer;
}
.table-content input[value="신청"]{
	 width: 80px;
    height: 40px; 
    border-radius: 10px; 
    padding: 8px 20px;
    background-color: #2d92f5;
    color: white;
    border: none;
    cursor: pointer;
}
</style>
<body>
	<div class="main-content">
		<div class="main-contenttop">
			<h1>티켓 오픈 공지</h1>
			<hr>
		</div>

		<div class="table-content">
			<form class="table-content">
				<table style="border-collapse: collapse; margin-bottom: 20px;">
					<tr>
						<th>뮤지컬명</th>
						<td colspan="3"><input type="text" name="m_title"
							placeholder="뮤지컬을 선택하세요" readonly> <input type="hidden"
							name="m_code"></td>
						<td class="button-container" style="text-align: right;"><input
							type="button" value="찾기" onclick="showMusicalNamePopup(event)">
						</td>
					</tr>
					<tr>
						<th>등록 유형</th>
						<td></td>
						<td class="radio-container" style="width: 25%; text-align: right">
							<label> <input type="radio" name="registration_type"
								value="" class="radio-btn" checked> 신규 등록
						</label>
						</td>
						<td class="radio-container" colspan="2"
							style="width: 25%; text-align: left;"><label> <input
								type="radio" name="registration_type" value="update"
								class="radio-btn" disabled> 수정
						</label></td>
					</tr>
					<tr>
						<th>티켓 오픈 타입</th>
						<td></td>
						<td style="width: 25%; text-align: right"><input type="radio" name="ticket_type" value="open"
							class="radio-btn" checked onclick="userSelect()"> 신규 오픈</td>
						<td class="radio-container" colspan="2"><label> <input
								type="radio" name="ticket_type" value="manual" class="radio-btn"
								onclick="userSelect()"> 직접 입력
						</label></td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" name="on_type"
							id="on_type" placeholder="ex)오픈 1차" disabled></td>
					</tr>

					<tr>
						<th>티켓 오픈 시간</th>
						<td></td>
						<td style="text-align: right"><label for="ticket_open_time"
							style="font-weight: bold;">일반 오픈</label></td>
						<td><input type="date" id="ticket_open_time"
							value="on_open_date"></td>
						<td><input type="time" id="on_open_time"></td>
					</tr>
					<tr id="musePass">
						<td style="text-align:right;">
						<input type="checkbox" id="disable_member_open"
							 onclick="toggleMemberOpen()">
							사용 안함    
						</td>
						<th id="musePassText" colspan="2" style="text-align: right">뮤즈
							패스 오픈</th>
						<td><input type="date" id="member_open_time"
							value="on_muse_open_date"></td>
						<td><input type="time" id="on_muse_open_time"></td>
						
					</tr>
					<tr>
						<th>공연 정보</th>
						<td colspan="4"><textarea name="performance_info"
								class="textarea-style" name="123"></textarea></td>
					</tr>
					<tr>
						<th>할인 정보</th>
						<td colspan="4"><textarea name="discount_info"
								class="textarea-style"></textarea></td>
					</tr>
					<tr>
						<th>공연 소개</th>
						<td colspan="4"><textarea name="performance_intro"
								class="textarea-style"></textarea></td>
					</tr>
					<tr>
						<th>캐스팅</th>
						<td colspan="4"><textarea name="casting"
								class="textarea-style"></textarea></td>
					</tr>
					<tr>
						<th>기타 전달사항</th>
						<td colspan="4"><textarea name="on_etc"
								class="textarea-style"></textarea></td>
					</tr>
				</table>
				<div class="partnerInfo">
					<h2 style="text-align: center;">파트너 정보</h2>
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
				</div>
				<div class="buttondiv">
					<input type="button" value="신청" onclick="insertTicketOpen()">
					<input type="reset" value="취소">
				</div>

			</form>
		</div>
	</div>
</body>
<script>
var musical_code = '';
function toggleMemberOpen() {
    const dateInput = document.getElementById("member_open_time");
    const musePassText = document.getElementById("musePassText");
    const timeInput = document.getElementById("on_muse_open_time");
    const isDisabled = document.getElementById("disable_member_open").checked;
	
    
    dateInput.disabled = isDisabled;
    timeInput.disabled = isDisabled;
    musePassText.style.opacity = isDisabled ? "0.5" : "1";

    musePassText.style.pointerEvents = isDisabled ? "none" : "auto";
}

function userSelect() {

    const onTypeInput = document.getElementById("on_type");

    const isManualSelected = document.querySelector('input[name="ticket_type"][value="manual"]').checked;
    if(!isManualSelected){
    	onTypeInput.value='';
    }

    onTypeInput.disabled = !isManualSelected;
    onTypeInput.style.opacity = isManualSelected ? "1" : "0.5";
}


function inputMusicalName(element) {
    var MusicalName = element.textContent || element.innerText;  // 클릭된 항목의 텍스트 가져오기
    
    document.getElementsByName('m_title')[0].value = MusicalName;
    
    closeMusicalNamePopup();

    var MusicalM_code= element.id;
    musical_code = MusicalM_code; //선택한 뮤지컬 idx값
} 

 function insertTicketOpen(){
	 if(document.getElementById("m_title")){
		 alert('뮤지컬을 선택해주세요');
		 return;
	 }
	var m_code= musical_code; //뮤지컬 idx
	var rs_code ='0'; //요청상태
	var on_type = ''; //
	if (document.querySelector('input[name="ticket_type"][value="open"]:checked')) {
        on_type = '신규 오픈';
    } else if (document.querySelector('input[name="ticket_type"][value="manual"]:checked')) {
        on_type = document.getElementById("on_type").value;
    }
	
	var on_openDate = document.getElementById("ticket_open_time").value;
	var on_openTime = document.getElementById("on_open_time").value;
	var on_muse_openDate = '';
	var on_muse_openTime = '';
	if(!document.getElementById("disable_member_open").checked){
		on_muse_openDate = document.getElementById("member_open_time").value;
		on_muse_openTime = document.getElementById("on_muse_open_time").value;
	}
	
	alert(document.getElementById("disable_member_open").checked);
	
	var on_info= document.getElementsByName('performance_info')[0].value;
	var on_sale = document.getElementsByName('discount_info')[0].value;
	var on_content = document.getElementsByName('performance_intro')[0].value;
	var on_casting = document.getElementsByName('casting')[0].value;
	var on_etc = document.getElementsByName('on_etc')[0].value;
	
	/* var noticeImage = document.getElementsByName('image')[0];
	var fileName = noticeImage.files.length > 0 ? noticeImage.files[0].name : '';
	var on_image = fileName;  */
	
	console.log("뮤지컬 코드 (m_code):", m_code);
    console.log("요청 상태 (rs_code):", rs_code);
    console.log("티켓 타입 (on_type):", on_type);
    console.log("티켓 오픈 시간 (on_open):", on_openDate);
    console.log("티켓 오픈 시간 (on_openTime):", on_openTime);
    console.log("뮤즈 패스 오픈 시간 (on_muse_open):", on_muse_openDate);
    console.log("뮤즈 패스 오픈 시간 (on_muse_openTime):", on_muse_openTime);
    console.log("공연 정보 (on_info):", on_info);
    console.log("할인 정보 (on_sale):", on_sale);
    console.log("공연 소개 (on_content):", on_content);
    console.log("캐스팅 (on_casting):", on_casting);
    console.log("기타 전달사항 (on_etc):", on_etc);
    
    //console.log("공지 이미지 이름 (on_image):", on_image);
    
    var param = 'm_code=' + m_code + 
    '&rs_code=' + rs_code + 
    '&on_type=' + on_type + 
    '&on_openDate=' + on_openDate + 
    '&on_openTime=' + on_openTime + 
    '&on_muse_openDate=' + on_muse_openDate + 
    '&on_muse_openTime=' + on_muse_openTime + 
    '&on_info=' + on_info + 
    '&on_sale=' + on_sale + 
    '&on_content=' + on_content + 
    '&on_casting=' + on_casting + 
    '&on_etc=' + on_etc ;
    window.location.href='insertOpenNotice.do?' + param;
 }
</script>
</html>