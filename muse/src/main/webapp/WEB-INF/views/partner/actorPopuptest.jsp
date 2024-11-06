<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 팝업 스타일 */
.ActorPopup {
	position: absolute; /* 절대 위치 */
	/* top: 30px; /* 아이콘 아래로 조정 */ */
	left: 100%; /* 아이콘의 오른쪽 위치 */
	margin-left: 10px; /* 아이콘과의 간격 */
	padding: 10px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0.3rem 0.6rem rgba(0, 0, 0, 0.2);
	z-index: 1000; /* 다른 요소보다 위에 표시 */
	display: flex; /* 기본적으로 숨김 */
	width:175px;
}

/* 닫기 버튼 스타일 */
.actorClose-btn {
	position: absolute;
	top: 5px;
	right: 5px;
	background: none;
	border: none;
	font-size: 18px;
	cursor: pointer;
}
</style>
</head>
<body>
<table><tr>
<div style="position: relative; width: 100%; max-width: 300px;">
        <input type="text" id="searchInputActor" placeholder="검색어를 입력하세요" style="width: 100%; padding-right: 30px;">
        <i class="fas fa-search" id="searchIcon" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;"  onclick="showActorPopup()"></i>
        <td><input type="button" onclick="openActorPopup()"></td>
    </div> 
    </tr></table>     
   			 <span class="ActorPopup-container" style="position: relative;">
   			<div id="ActorPopup" class="ActorPopup" style="display:none;">
     		<div class="popupActorWrap">
     		<button class="actorClose-btn" onclick="closeActorPopup()">X</button>
     		<table>
     			<tr>
     				<th>이름</th>
     				<th>생년월일</th>
     			</tr>
     			<tr>
     				<td>김준수</td>
     				<td>0000-00-00</td>
     			</tr>
     			
     		</table>
     		</div>
   </div>
   </span>
</body>
<script>
//배우 불러오기 스크립트
function showActorPopup() {
    const popup = document.getElementById('ActorPopup');
    popup.style.display = 'flex';
}

// actorPopup을 닫는 함수
function closeActorPopup() {
    const popup = document.getElementById('ActorPopup');
    popup.style.display = 'none';
}
</script>
</html>