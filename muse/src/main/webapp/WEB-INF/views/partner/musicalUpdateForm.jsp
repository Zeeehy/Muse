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

.table-content input[value="신청"] {
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
			<h1>뮤지컬 수정</h1>
			<hr>
		</div>
		<form name="updateMusical" action="updateMusicalInfo.do" method="post"
			enctype="multipart/form-data">
			<div class="table-content">
				<table>
					<tr>
						<th style="width: 20%;">뮤지컬명</th>
						<td colspan="3" style="width: 40%;"></td>
						<td colspan="4"><input type="text" name="m_title"
							placeholder="ex)뮤지컬 ***" value="${updatedto.m_title}" readonly></td>
						<td><input type="hidden" value="${sessionScope.s_pr_code }"
							name="pr_code"><input type="hidden" value="${updatedto.m_code }"
							name="m_code"></td>
					</tr>

					<tr>
						<th>등록 유형</th>
						<td colspan="5"></td>
						<td class="radio-container" style="width: 25%; text-align: right">
							<label> <input type="radio" name="registration_type"
								class="radio-btn" disabled> 신규 등록
						</label>
						</td>
						<td class="radio-container" colspan="2"
							style="width: 25%; text-align: left;"><label> <input
								type="radio" name="registration_type" value="update"
								class="radio-btn"  checked> 수정
						</label></td>
					</tr>
					<tr>
						<th>관람 등급</th>
						<td colspan="3"></td>
						<td colspan="4"><input type="text" name="m_age"
							value="${updatedto.m_age}" placeholder="ex)15세"></td>
					</tr>
					<tr>
						<th>공연장</th>
						<td colspan="3"></td>
						<td colspan="4"><select name="mh_code">
								<c:forEach var="hall" items="${list}">
									<option value="${hall.mh_code}"
										${updatedto.mh_code == hall.mh_code ? 'selected' : ''}>${hall.mh_name}</option>
								</c:forEach>
						</select></td>

					</tr>
					<tr>
						<th>공연 스케줄</th>
						<td colspan="3"></td>
						<td><input type="date" id="m_startDate" name="m_startDate"
							value="${updatedto.m_startDate }"></td>
						<td style="text-align: center">~</td>
						<td colspan="3"><input type="date" id="m_endDate"
							name="m_endDate" value="${updatedto.m_endDate }"></td>
					</tr>
					<tr>
						<th>판매 오픈 시간</th>
						<td colspan="3"></td>
						<td colspan="2"><input type="date" name="m_openDate"
							value="${updatedto.m_openDate }"></td>
						<td><input type="time" name="m_openTime"
							value="${updatedto.m_openTime }"></td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center;"></td>
						<th colspan="2" style="text-align: center;">공연 시간(인터미션 포함)</th>
						<td><input type="number" name="m_time" placeholder="150"
							value="${updatedto.m_time }"></td>
						<th><a>분</a></th>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center;"></td>
						<th colspan="2" style="text-align: center;">인터 미션 시간</th>
						<td><input type="number" name="m_inTime" placeholder="30"
							value="${updatedto.m_inTime }"></td>
						<th><a>분</a></th>
					</tr>
					<tr>
						<th>매수 제한</th>
						<td colspan="3" style="text-align: center;"></td>
						<td colspan="3" style="text-align: center;"><label>최대
								매수</label>
								<select name="m_maxTicket" id="m_maxTicket">
    <option value="1" ${updatedto.m_maxTicket == 1 ? 'selected' : ''}>1</option>
    <option value="2" ${updatedto.m_maxTicket == 2 ? 'selected' : ''}>2</option>
    <option value="3" ${updatedto.m_maxTicket == 3 ? 'selected' : ''}>3</option>
    <option value="4" ${updatedto.m_maxTicket == 4 ? 'selected' : ''}>4</option>
</select>
</td>
					</tr>
					<tr>
						<th>단독 판매 여부</th>
						<td colspan="3"></td>
						<td><label> 사용 <input type="radio" name="m_single"
								value="1" ${updatedto.m_single == 1 ? 'checked' : ''}></label></td>
						<td colspan="3"><label> 사용안함 <input type="radio"
								value="0" name="m_single" ${updatedto.m_single == 0 ? 'checked' : ''}></label>
						</td>
					</tr>
					<tr>
						<th>캐스트 보드 사용 유무</th>
						<td colspan="3"></td>
						<td><label> 사용 <input type="radio" name="m_calender"
								value="1" ${updatedto.m_calendar == 1 ? 'checked' : ''}></label></td>
						<td colspan="3"><label> 사용안함 <input type="radio"
								name="m_calender" value="0"
								${updatedto.m_calendar == 0 ? 'checked' : ''}></label></td>
					</tr>


					<tr>
						<th>포스터 정보</th>
						<td colspan="5" style="width: 60%"></td>
						<td colspan="2"><input type="file" name="m_posterfile1" 
							accept="image/*"></td>
					</tr>
					<tr>
						<th>상세 이미지</th>
						<td colspan="5" style="text-align: center;"></td>
						<td colspan="2"><input type="file" name="m_detailImgfile1"
							accept="image/*" ></td>
					</tr>
					<tr>
						<th>공연 정보</th>
						<td colspan="6"><textarea class="textarea-style"
								name="m_notice" placeholder="공연 정보를 입력해주세요">${updatedto.m_notice}</textarea></td>
					</tr>

				</table>
				<%@include file="partnerInfo.jsp"%>
				<div class="buttondiv">
					<input type="submit" value="신청"> <input type="reset"
						value="취소">

				</div>
			</div>
		</form>
	</div>
</body>
<script>
	//var count = 0;
	var gradeList = [];
	
	document.getElementById("updateMusical").onsubmit = function(event) {
        var noticeValue = document.getElementById("m_notice").value;

        // 개행 문자를 <br>로 변환
        noticeValue = noticeValue.replace(/\n/g, "<br>");

        // textarea에 변환된 값을 다시 설정 (필요한 경우)
        document.getElementById("m_notice").value = noticeValue;
	}
</script>
</html>