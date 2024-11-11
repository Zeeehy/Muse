<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>

	<!-- 팝업 요소 -->
	<div id="ActorPopup">
		<div class="popupActorWrap">
			<button class="actorClose-btn" onclick="closeActorPopup()">X</button>

			<table>
				<tr>
					<td><input type="text" name="ma_name"></td>
					<td><input type="submit" value="검색" onclick="show()"></td>
					<td><input type="hidden" id="countNum"></td>
				</tr>
				<tr>
					<th>이름</th>
					<th>생년월일</th>
				</tr>
				<tbody id="actorTableBody">
           		</tbody>
			</table>
		</div>
	</div>
</body>
</html>