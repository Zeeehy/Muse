<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<link rel="stylesheet" type="text/css" href="resources/css/Jinu.css">
<script src="/muse/resources/js/httpRequest.js"></script>
</head>
<body>
<%@include file="../header.jsp"%>

<div class="section_notice">
	<div class="board">
		<div class="top">
			<h2 style="color:red;">티켓 공지</h2>
		</div>
		<div class="list">
			<div class="table">
				<table>
					<tr> <td>제목</td><td>오픈일시</td><td>조회수</td> </tr>
				</table>
			</div>
		</div>
	</div>
</div>

<%@include file="../footer.jsp"%>
</body>
<script type="text/javascript">
</script>
</html>