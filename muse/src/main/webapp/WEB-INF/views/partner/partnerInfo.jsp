<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="partnerInfo">
				<h2 style="text-align: center;">파트너 정보</h2>
				<table>
					<tr>
						<th>파트너 명</th>
						<td><input type="text" value="${dto.u_id}"  required></td>
					</tr>
					<tr>
						<th>사업자 번호</th>
						<td><input type="text" value="${dto.pr_num}" required></td>
					</tr>
					<tr>
						<th>사업자 연락처</th>
						<td><input type="text" value="${dto.pr_pnum}" required></td>
					</tr>
					<tr>
						<th>사업자 이메일</th>
						<td><input type="text" value="${dto.pr_email}" required></td>
					</tr>

				</table>
			</div>
</body>
</html>