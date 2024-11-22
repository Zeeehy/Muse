<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 현황</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css"
	type="text/css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<style type="text/css">
.category-legend {
	display: flex;
	gap: 10px;
	font-weight: bold;
}

.category {
	background-color: #f0f0f0;
	padding: 5px;
}

#filedsetdiv {
	margin: 20px;
	padding: 20px;
	width: 90%;
}

.viewtable {
	margin: 20px;
	padding: 20px;
}
/* 필드셋 스타일 */
#product-fieldset {
	border: 2px solid #ccc;
	padding: 15px;
	margin: 20px 0;
	background-color: #f9f9f9;
	border-radius: 8px;
}

.category-legend {
	display: flex;
	justify-content: space-between;
	font-weight: bold;
	padding-bottom: 10px;
	border-bottom: 2px solid #ddd;
	margin-bottom: 15px;
}

.category {
	background-color: #e0e0e0;
	padding: 8px 15px;
	border-radius: 5px;
	font-size: 14px;
}

#viewtable {
	width: 100%;
	border-collapse: collapse;
}

#viewtable th, #viewtable td {
	padding: 12px 15px;
	/*  text-align: left; */
	border: 1px solid #ddd;
}

#viewtable th {
	background-color: #f4f4f4;
	font-size: 16px;
	font-weight: bold;
}

#viewtable td {
	font-size: 14px;
	text-align: center;
}

#viewtable td input[type="image"] {
	width: 100px; /* 이미지 크기 조정 */
	height: auto;
}

#viewtable tr:nth-child(even) {
	background-color: #f9f9f9;
}

#viewtable tr:hover {
	background-color: #f1f1f1;
}

/* 일시와 공연장 셀 통합 스타일 */
#viewtable td[colspan="3"] {
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	background-color: #fafafa;
}

#main-contenttop-title {
	width: 100%;
	margin-top: 35px;
	padding-left: 20px;
}

#main-contenttop-title h1 {
	padding-left: 40px;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="sidebar.jsp"%>
	<div class="main-content">
		<div class="main-contenttop">
			<h1>공연 현황</h1>
			<hr>
		</div>
		<div id="filedsetdiv">
			<fieldset id="product-fieldset">
				<legend class="category-legend">
					<span class="category"
						onclick="location.href='partnerMainForm.do?pr_code=${s_pr_code}&u_id=${u_id}&getMusicalList=0'">공연중</span>
					<span class="category"
						onclick="location.href='partnerMainForm.do?pr_code=${s_pr_code}&u_id=${u_id}&getMusicalList=2'">공연
						예정</span> <span class="category"
						onclick="location.href='partnerMainForm.do?pr_code=${s_pr_code}&u_id=${u_id}&getMusicalList=1'">공연
						완료</span>

				</legend>
				<table id="viewtable">
					<tr>
						<th colspan="4">상품 정보</th>
						<th>일시</th>
						<th>공연장</th>
					</tr>
					<c:if test="${empty list }">
						<tr>
							<th colspan="6" style="text-align: center">등록된 공연이 없습니다.</th>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${list }">
						<tr>
							<td><input type="image" alt="상품 이미지"
								src="resources/img/musical/${dto.m_poster}"></td>
							<td>제목 : ${dto.m_title } <br>러닝 타임 : ${dto.m_time } 분 <br>(인터미션
								포함) <br>관람 등급 : ${dto.m_age } <br>
							</td>
							<td>출연 배우 : <br>${dto.ma_name }</td>
							<td>${dto.m_notice}</td>
							<td>${dto.m_startDate}<br> ~ <br>${dto.m_endDate }</td>
							<td>${dto.mh_name }</td>
						</tr>
					</c:forEach>
				</table>
			</fieldset>

			<div class="main-contenttop-title">
				<h1>요청 내역</h1>
			</div>
			<fieldset id="product-fieldset">
				<legend class="category-legend">
					<span class="category"
						onclick="window.location.href='partnerMainForm.do?pr_code=${s_pr_code}&u_id=${u_id }&getMusicalList=${getMusicalList }&isFutureDate=0'">진행중</span>
					<span class="category"
						onclick="window.location.href='partnerMainForm.do?pr_code=${s_pr_code}&u_id=${u_id }&getMusicalList=${getMusicalList }&isFutureDate=1'">완료</span>
				</legend>
				<table id="viewtable">
					<tr>
						<th>번호</th>
						<th>요청 유형</th>
						<th>요청 명</th>
						<th>요청일</th>
						<th>상태</th>
					</tr>

					<c:if test="${empty statelist}">
						<tr>
							<td colspan="5" style="text-align: center">등록된 공연이 없습니다.</td>
						</tr>
					</c:if>

					<c:forEach var="dto2" items="${statelist}">
						<tr>
							<td>${dto2.m_code}</td>
							<td>${dto2.rt_name}</td>
							<td>${dto2.m_title}</td>
							<td>${dto2.rs_date}</td>
							<td class="status-cell">${dto2.rs_status}</td>
						</tr>
					</c:forEach>
				</table>
			</fieldset>
		</div>
	</div>
</body>
<script>
function chageColor() {
    const statusCells = document.querySelectorAll('.status-cell'); // 클래스 선택
    statusCells.forEach(cell => {
        const status = cell.textContent.trim(); // 텍스트 가져오기
        if (status === '승인') {
            cell.style.color = 'green'; // 글씨 색 초록색
            cell.style.fontWeight = 'bold'; // 글씨 굵게
        } else if (status === '반려') {
            cell.style.color = 'red'; // 글씨 색 파란색
            cell.style.fontWeight = 'bold';
        } else {
            cell.style.color = 'gray'; // 기본값 회색
            cell.style.fontWeight = 'bold';
        }
    });
}

window.onload = chageColor;

</script>
</html>
