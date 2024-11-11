<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css"
	type="text/css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
</head>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
<style>
table tr, th, td {/* 
	border: 1px solid black; */
}
	

    .radio-btn {
        margin-right: 8px; /* 라디오 버튼과 텍스트 사이의 간격 조정 */
    }

    .radio-container label {
        margin-right: 20px; /* 라벨 간 간격을 일정하게 */
    }

    /* 라디오 버튼을 조금 더 커지게 설정 */
    .radio-btn {
        width: 16px;
        height: 16px;
        margin-right: 5px;
    }
    .table-content td input[type="radio"],td input[type="checkbox"] {
    width: auto;
    margin-right:15px;
}
.textarea-style {
        width: 100%;
        height: 80px;
        border-radius: 8px; /* 둥근 모서리 */
        font-size:16px;
        background-color: #f9f9f9;
        resize: none; /* 크기 조절 아이콘 제거 */
    }
    
     .disabled-date {
        background-color: #e0e0e0;
        cursor: not-allowed;
    }
</style>
<body>
	<div class="main-content">
		<div class="main-contenttop">
			<h1>티켓 오픈 공지</h1>
			<hr>
		</div>
		<div class="table-content">
		<form>
			<table style="border-collapse: collapse; margin-bottom: 20px;">
    <tr>
        <th>뮤지컬명</th>
        <td colspan="3">
            <input type="text" name="m_title" placeholder="뮤지컬을 선택하세요" readonly>
        </td>
        <td class="button-container" style="text-align: right;">
            <input type="button" value="찾기" onclick="showMusicalNamePopup(event)">
        </td>
    </tr>
    <tr>
        <th>등록 유형</th>
        <td></td>
        <td class="radio-container" style="width:25%; text-align:right">
            <label>
                <input type="radio" name="registration_type" value="new" class="radio-btn" checked> 신규 등록
            </label>
        </td>
        <td class="radio-container" colspan="2" style="width:25%; text-align:left;">
            <label>
                <input type="radio" name="registration_type" value="update" class="radio-btn" disabled> 수정
            </label>
        </td>
    </tr>
    <tr>
        <th>티켓 오픈 타입</th>
        <td></td>
        <td class="radio-container" style="text-align:right">
            <label>
                <input type="radio" name="ticket_type" value="open" class="radio-btn" checked> 티켓 오픈
            </label>
        </td>
        <td class="radio-container"  colspan="2">
            <label>
                <input type="radio" name="ticket_type" value="manual" class="radio-btn" > 직접 입력
            </label>
        </td>
    </tr>
    <tr>
        <th>티켓 오픈 시간</th>
        <td></td>
        <td style="text-align:right">
            <label for="ticket_open_time" style="font-weight: bold;" >일반 오픈</label>
        </td>
        <td>
            <input type="date" id="ticket_open_time">
        </td>
        <td><input type="time"></td>
    </tr>
    <tr id="musePass">
        <td></td>
        <th id="musuPassText" colspan="2" style="text-align:right">뮤즈 패스 오픈</th>
        <td>
            <input type="date" id="member_open_time">
        </td>
        <td><input type="time"></td>
        <td>
            <input type="checkbox" id="disable_member_open" style="margin-left: 10px;" onclick="toggleMemberOpen()"> 사용 안함
        </td>
    </tr>
    <tr>
        <th style="padding:0px; margin:0px">공연 정보</th>
        <td colspan="4">
            <textarea name="performance_info" class="textarea-style"></textarea>
        </td>
    </tr>
    <tr>
        <th>할인 정보</th>
        <td colspan="4">
            <textarea name="discount_info" class="textarea-style"></textarea>
        </td>
    </tr>
    <tr>
        <th>공연 소개</th>
        <td colspan="4">
            <textarea name="performance_intro" class="textarea-style"></textarea>
        </td>
    </tr>
    <tr>
        <th>캐스팅</th>
        <td colspan="4">
            <textarea name="casting" class="textarea-style"></textarea>
        </td>
    </tr>
    <tr>
        <th>캐스팅 상세</th>
        <td colspan="4">
            <textarea name="casting_detail" class="textarea-style"></textarea>
        </td>
    </tr>
    <tr>
        <th>이미지 등록</th>
        <td colspan="4" style="text-align:right">
            <input type="file" name="image">
        </td>
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
				<input type="submit" value="신청"> 
				<input type="reset" value="취소">
			</div>
			</form>
		</div>
	</div>
</body>
<script>
function toggleMemberOpen() {
    const dateInput = document.getElementById("member_open_time");
    const musuPassText = document.getElementById("musuPassText");
    const isDisabled = document.getElementById("disable_member_open").checked;

    // 날짜 입력 필드를 비활성화하거나 활성화합니다.
    dateInput.disabled = isDisabled;
    musuPassText.style.opacity = isDisabled ? "0.5" : "1";

    musuPassText.style.pointerEvents = isDisabled ? "none" : "auto";
}

</script>
</html>