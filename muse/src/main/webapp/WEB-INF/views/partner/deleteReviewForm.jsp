<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/muse/resources/css/Phj2.css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<title>Insert title here</title>
</head>
<Style>
.textarea-style {
	width: 100%;
	height: 80px;
	border-radius: 8px; /* 둥근 모서리 */
	font-size: 17px;
	background-color: #f9f9f9;
	resize: none; /* 크기 조절 아이콘 제거 */
}
 select[name="bdr_reason"] {
            width: 100%; /* 너비 설정 */
            padding: 10px; /* 내부 여백 */
            border: 2px solid #000000; /* 테두리 색상 */
            border-radius: 5px; /* 둥근 테두리 */
            background-color: #f9f9f9; /* 배경색 */
            font-size: 16px; /* 글꼴 크기 */
            color: #333; /* 글자 색 */
            appearance: none; /* 기본 브라우저 스타일 제거 */
            cursor: pointer; /* 커서 모양 변경 */
        }

        /* option 태그 스타일 */
        select[name="bdr_reason"] option {
            font-size: 14px; /* 글꼴 크기 */
            color: #555; /* 글자 색 */
            padding: 5px; /* 내부 여백 */
        }

        /* 선택된 항목 스타일 */
        select[name="bdr_reason"] option:checked {
            background-color: #007BFF; /* 선택된 항목 배경색 */
            color: #fff; /* 선택된 항목 글자색 */
        }

        /* 포커스 스타일 */
        select[name="bdr_reason"]:focus {
            outline: 2px solid #80bdff; /* 포커스 테두리 색 */
            background-color: #ffffff; /* 포커스 시 배경색 */
        }
</Style>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
<body>
	<div class="main-content">
		<div class="main-contenttop">
			<h1>리뷰 삭제</h1>
			<hr>
		</div>
		<div class="table-content">
			<form name="insertBBSreview" action="deleteReviewRe.do">
				<table>

					<tr>
						<th>댓글 제목</th>
						<td colspan="3"><input type="hidden" name="pr_code" value="${s_pr_code}"><input
							type="text" name="mr_title" value="${dto.mr_title }" readonly></td>
							<td><input type="hidden" name="mr_code" value="${dto.mr_code}"></td>
					</tr>
					<tr>
						<th>댓글 작성일</th>
						<td><input type="text" value="${dto.mr_date }" readonly></td>
						<th>작성자</th>
						<td><input type="text" value="${dto.u_id }" readonly></td>
					</tr>
					<tr>
						<th>본문</th>
						<td colspan="4"><textarea class="textarea-style">${dto.mr_content }</textarea></td>
					</tr>
					<tr>
						<th>사유 입력</th>
						<td colspan="3"><select name="bdr_reason">
								<option value="">선택해주세요</option>
								<option value="inappropriate">부적절한 내용</option>
								<option value="spam">스팸</option>
								<option value="userRequest">사용자 요청</option>
								<option value="other">기타</option>
						</select></td>

					</tr>
					<tr>
						<td style="text-align:center;"><input type="submit" value="신청"><input
							type="reset" value="취소"></td>
					</tr>
				</table>

			</form>
		</div>
	</div>
</body>
</html>