<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="/muse/resources/js/httpRequest.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css">
<link rel="stylesheet" href="/muse/resources/css/Ljh.css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>

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
						<td colspan="4"><input type="text" name="m_title" readonly value="${dto.m_title}"> 
						<input type="hidden" ></td>
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
						<td colspan="4"><input type="text" name="on_type" readonly style="    color: black;"
							id="on_type" value="${dto.on_type}" disabled></td>
					</tr>

					<tr>
						<th>티켓 오픈 시간</th>
						<td style="text-align: right"><label for="ticket_open_time" 
							style="font-weight: bold;">일반 오픈</label></td>
						<td><input type="text" id="on_open" readonly style="width:150px;"
							value="${dto.on_open}"></td>
							<td style="text-align: right; width: 150px;" ><label for="ticket_open_time"
							style="font-weight: bold;">뮤즈패스 오픈</label></td>
						<td><input type="text" id="ticket_open_time" readonly style="width:150px;"
							value="${dto.on_muse_open}"></td>
					</tr>
					
					<tr>
						<th>공연 정보</th>
						<td colspan="4"><textarea name="performance_info"  readonly
								class="textarea-style" name="123">${dto.on_info}</textarea></td>
					</tr>
					<tr>
						<th>할인 정보</th>
						<td colspan="4"><textarea name="discount_info"  readonly
								class="textarea-style">${dto.on_sale}</textarea></td>
					</tr>
					<tr>
						<th>공연 소개</th>
						<td colspan="4"><textarea name="performance_intro" readonly
								class="textarea-style">${dto.on_content}</textarea></td>
					</tr>
					<tr>
						<th>캐스팅</th>
						<td colspan="4"><textarea name="casting" readonly
								class="textarea-style">${dto.on_casting}</textarea></td>
					</tr>
					<tr>
						<th>기타 전달사항</th>
						<td colspan="4"><textarea name="on_etc" readonly
								class="textarea-style">${dto.on_etc}</textarea></td>
					</tr>
				</table>
				<div class="partnerInfo">
					<h2 style="text-align: center;">파트너 정보</h2>
					<table>
		                <tr>
		                    <th>파트너 명</th>
		                    <td><input type="text" value="${dto.pr_name}" readonly ></td>
		                </tr>
		                <tr>
		                    <th>사업자 번호</th>
		                    <td><input type="text" value="${dto.pr_num}" readonly ></td>
		                </tr>
		                <tr>
		                    <th>사업자 연락처</th>
		                    <td><input type="text" value="${dto.pr_pnum}" readonly></td>
		                </tr>
		                <tr>
		                    <th>사업자 이메일</th>
		                    <td><input type="text" value="${dto.pr_email}" readonly></td>
		                </tr>

					</table>
				</div>
				<div class="buttondiv" style="margin-bottom:50px;margin-top:50px;">
				
					<input class="blueButton" type="button" value="승인" onclick="window.location.href='openRequestEnd.do?rs_code=1&on_code=${dto.on_code}'" style="width: 90px;font-size: 16pt;height: 50px;">
					<input class="redButton" type="button" value="거절" onclick="window.location.href='openRequestEnd.do?rs_code=2&on_code=${dto.on_code}'" style="width: 90px;font-size: 16pt;height: 50px;">
					<input class="grayButton" type="button" value="뒤로가기" onclick="window.location.href='openRequestList.do'" style="margin: 20px; width: 90px;font-size: 16pt;height: 50px;">
					
				</div>

			</form>
		</div>
	</div>
</body>

</html>