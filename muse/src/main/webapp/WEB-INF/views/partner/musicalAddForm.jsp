<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
</head>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
<%@include file="musicalNamePopup.jsp"%>
<style>
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
.textarea-style {
	width: 100%;
	height: 80px;
	border-radius: 8px; /* 둥근 모서리 */
	font-size: 16px;
	background-color: #f9f9f9;
	resize: none; /* 크기 조절 아이콘 제거 */
}
</style>
<body>
	<div class="main-content">
		<div class="main-contenttop">
			<h1>뮤지컬 등록</h1>
			<hr>
		</div>
		<form name="insertMusical" action="insertMusical.do" method="post" enctype="multipart/form-data">
		<div class="table-content">
			<table>
				<tr>
					<th style="width: 20%;">뮤지컬명</th>
					<td colspan="3" style="width: 40%;"></td>
					<td colspan="4"><input type="text" name="m_title" placeholder="ex)뮤지컬 ***"></td>
					<td><input type="hidden" value="${sessionScope.s_pr_code }" name="pr_code"></td>
				</tr>

				<tr>
						<th>등록 유형</th>
						<td colspan="5"></td>
						<td class="radio-container" style="width: 25%; text-align: right">
							<label> <input type="radio" name="registration_type" 
							 class="radio-btn" checked> 신규 등록
						</label>
						</td>
						<td class="radio-container" colspan="2"
							style="width: 25%; text-align: left;"><label> <input
								type="radio" name="registration_type" value="update"
								class="radio-btn" disabled> 수정
						</label></td>
					</tr>
				<tr>
					<th>관람 등급</th>
					<td colspan="3"></td>
					<td colspan="4"><input type="text" name="m_age" placeholder="ex)15세"></td>
				</tr>
				<tr>
					<th>공연장</th>
					<td colspan="3"></td>
					<td colspan="4"><select name="mh_code">
							<c:forEach var="dto" items="${HallList}">
								<option value="${dto.mh_code}">${dto.mh_name}</option>
							</c:forEach>
					</select></td>

				</tr>
				<tr>
					<th>공연 스케줄</th>
					<td colspan="3"></td>
					<td><input type="date" id="m_startDate" name="m_startDate"></td>
					<td style="text-align: center">~</td>
					<td colspan="3"><input type="date" id="m_endDate"
						name="m_endDate"></td>
				</tr>
				<tr>
					<th>판매 오픈 시간</th>
					<td colspan="3"></td>
					<td colspan="2"><input type="date" name="m_openDate"></td>
					<td><input type="time" name="m_openTime"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;"></td>
					<th colspan="2" style="text-align: center;">공연 시간(인터미션 포함)</th>
					<td><input type="number" name="m_time" placeholder="e150"></td>
					<th><a>분</a></th>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;"></td>
					<th colspan="2" style="text-align: center;">인터 미션 시간</th>
					<td><input type="number" name="m_inTime" placeholder="30"></td>
					<th><a>분</a></th>
				</tr>
				<tr>
					<th>매수 제한</th>
					<td colspan="3" style="text-align: center;"></td>
					<td colspan="3" style="text-align: center;"><label>최대
							매수</label><select name="m_maxTicket" id="m_maxTicket">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
					</select></td>
				</tr>
				<tr>
					<th>단독 판매 여부</th>
					<td colspan="3"></td>
					<td>
					<label> 사용 <input type="radio" name="m_single" value="1">
					</label></td>
					<td colspan="3"><label> 사용안함<input type="radio" value="0"
							name="m_single">
						</label>
					</td>
				</tr>
				<tr>
					<th>캐스트 보드 사용 유무</th>
					<td colspan="3"></td>
					<td><label> 사용 <input type="radio" name="m_calender" value="1">
					</label></td>
					<td  colspan="3"><label> 사용안함 <input type="radio" name="m_calender" value="0">
					</label></td>
				</tr>


				<tr>
					<th>포스터 정보</th>
					<td colspan="5" style="width: 60%"></td>
					<td colspan="2"><input type="file" name="m_posterfile" accept="image/*"></td>
				</tr>
				<tr>
					<th>상세 이미지</th>
					<td colspan="5" style="text-align: center;"></td>
					<td colspan="2"><input type="file" name="m_detailImgfile" accept="image/*"></td>
				</tr>
				<tr>
					<th>공연 정보</th>
						<td colspan="6"><textarea class="textarea-style" name="m_notice" placeholder="공연 정보를 입력해주세요"></textarea></td>
					</tr>
				
			</table>
			<%@include file="partnerInfo.jsp" %>
			<div class="buttondiv">
				<input type="submit" value="신청" onclick="insertCast()"> <input
					type="reset" value="취소">
					
			</div>
		</div>
	</form>
	</div>
</body>
<script>
//var count = 0;
var gradeList = [];
/* function addGrade(){
	 count++;
	 const table = document.getElementById("gradeTable");
	 const gradePrice = document.getElementById("gradePrice").value;
	 const gradeColor = document.getElementById("gradeColor").value;
} 

function addClickList(evnet){
	
}
*/
</script>
</html>