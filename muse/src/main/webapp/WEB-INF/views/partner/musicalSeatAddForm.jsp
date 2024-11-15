<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<script src="/muse/resources/js/httpRequest.js"></script>
</head>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
<%@include file="musicalNamePopup.jsp"%>
<style>
#seatGrade {
	display: flex;
	transform: scale(0.5); /* 예: 80% 크기로 줄이기 */
	transform-origin: center; /* 축소 기준을 좌측 상단으로 */
	width: calc(100%/ 0.8); /* 부모 컨테이너의 가로 크기를 유지 */
	overflow: hidden; /* 내부 내용이 넘치지 않도록 설정 */
}

#gradeTableDiv table {
	font-size: 30px;
	font-weight: bold;
	width: 100%;
	border-collapse: collapse; /* 테이블 셀의 경계선 처리를 설정 */
}

#GradeColor {
	width: 30px;
	height: 30px;
}
    .table-content input[value="저장"]{
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
<!-- 좌석 -->
<div class="main-content">
		<div class="main-contenttop">
			<h1>좌석 지정</h1>
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
					
				</table>
				<div id="seatGrade">
				<div id="gradeTableDiv">
					<table id="gradeTable">
						<tr>
							<td>좌석 이름</td>
							<td>좌석 가격</td>
							<td>좌석 색상</td>
							<td></td>
						</tr>
						<tr id="sg_1">
							<td>VIP석</td>
							<td><input type="text" name="GradePrice"></td>
							<td><div id="GradeColor" style="background-color: #CE3B3B;"></div></td>
							<td><input type="radio" name="selectGrade"></td>
						</tr>
						<tr id="sg_2">
							<td>R석</td>
							<td><input type="text" name="gradePrice"></td>
							<td><div id="GradeColor" style="background-color: #1CA814;"></div></td>
							<td><input type="radio" name="selectGrade"></td>
						</tr>
						<tr id="sg_3">
							<td>S석</td>
							<td><input type="text" name="gradePrice"></td>
							<td><div id="GradeColor" style="background-color: #17B3FF;"></div></td>
							<td><input type="radio" name="selectGrade"></td>
						</tr>
						<tr id="sg_4">
							<td>A석</td>
							<td><input type="text" name="gradePrice"></td>
							<td><div id="GradeColor" style="background-color: #F2EA1C;"></div></td>
							<td><input type="radio" name="selectGrade"></td>
						</tr>
					</table>
				</div>
				<%@include file="musicalSeatInsert.jsp"%>
				<input type="button" value="좌석입력" onclick="makeDummy();">
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
function inputMusicalName(element) {
    var MusicalName = element.textContent || element.innerText;  // 클릭된 항목의 텍스트 가져오기
    
    document.getElementsByName('m_title')[0].value = MusicalName;
    
    closeMusicalNamePopup();

    var MusicalM_code= element.id;
    musical_code = MusicalM_code; //선택한 뮤지컬 idx값
} 
</script>
</html>