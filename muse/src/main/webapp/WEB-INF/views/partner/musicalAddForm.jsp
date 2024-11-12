<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

</style>
<body>
	<div class="main-content">
		<div class="main-contenttop">
			<h1>뮤지컬 등록</h1>
			<hr>
		</div>
		<div class="table-content">
			<table>
				<tr>
					<th style="width: 20%;">뮤지컬명</th>
					<td colspan="3" style="width: 40%;"></td>
					<td colspan="4"><input type="text" name="m_title"></td>
				</tr>

				<tr>
					<th>접수번호 / 상태</th>
					<td colspan="3"></td>
					<td colspan="4"><input type="text"></td>

				</tr>
				<tr>
					<th>관람 등급</th>
					<td colspan="3"></td>
					<td colspan="4"><input type="text" name="m_age"></td>
				</tr>
				<tr>
					<th>공연장</th>
					<td colspan="3"></td>
					<td colspan="4"><input type="text" ></td>
				</tr>
				<tr>
					<th>공연 스케줄</th>
					<td colspan="3"></td>
					<td><input type="date" id="startDate" name="m_startdate"></td>
					<td style="text-align:center">~</td>
					<td colspan="3"><input type="date" id="endDate" name="m_enddate"></td>
				</tr>
				<tr>
					<th>판매 오픈 시간</th>
					<td colspan="3"></td>
					<td colspan="2"><input type="date" name="m_opendate"></td>
					<td><input type="time" name="m_opentime"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;"></td>
					<th colspan="2" style="text-align: center;">공연 시간(인터미션 포함)</th>
					<td><input type="text" name="m_time"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;"></td>
					<th colspan="2" style="text-align: center;">인터 미션 시간</th>
					<td><input type="text" name="m_intime"></td>
				</tr>
				<tr>
					<th>매수 제한</th>
					<td colspan="3" style="text-align: center;"></td>
					<td colspan="3" style="text-align: center;"><label>최대 매수</label><select name="m_maxticket">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
					</select></td>
				</tr>
				<tr>
					<th>단독 판매 여부</th>
					<td colspan="3"></td>
						<td>
							<label> 사용
								<input type="radio" name="m_single">
							</label>
					</td>
					<td colspan="3">
						<label> 사용안함<input type="radio" name="m_single">
						</label>
					</td>
				</tr>
				<tr>
					<th>캐스트 보드 사용 유무</th>
					<td colspan="3"></td>
					<td>
						<label> 사용
							<input type="radio" name="m_calender">
						</label>
					</td>
					<td>
						<label> 사용안함
							<input type="radio" name="m_calender">
						</label>
					</td>
				</tr>


				<tr>
					<th>포스터 정보</th>
					<td colspan="5" style="width:60%"></td>
					<td colspan="2"><input type="file"></td>
				</tr>
				<tr>
					<th>상세 이미지</th>
					<td colspan="5" style="text-align: center;"></td>
					<td colspan="2"><input type="file"></td>
				</tr>

			</table>
			<!-- 좌석 -->
			<table>
				<tr>

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
				<input type="button" value="저장" onclick="insertCast()"> <input
					type="reset" value="취소">
			</div>
		</div>

	</div>
</body>
</html>