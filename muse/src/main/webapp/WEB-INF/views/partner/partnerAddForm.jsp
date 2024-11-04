<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 전체 레이아웃 설정 */
body {
	margin: 0;
	font-family: Arial, sans-serif;
	display: flex;
}

/* 사이드바 스타일 */
.sidebar {
	width: 250px;
	background-color: #DFF0FF;
	color: #000000;
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	padding-top: 20px;
	text-align:center;
}

/* 사이드바 메뉴 스타일 */
.sidebar a {
	display: block;
	color: #000000;
	padding: 15px;
	text-decoration: none;
}

.sidebar a:hover {
	background-color: #575757;
}


.main-content {
	text-align:center;
}

.main-content hr {
	background-color: green; 
	border: none;
	margin: 20px auto; 
}
.main-content table {
    border-spacing: 5px;
}
</style>
</head>
<body>
  <div class="sidebar">
        <h3>파트너 등록  | 요청 현황</h3>
        <a href="#">신규 등록</a>
        <a href="#">뮤지컬 관리</a>
        <a href="#">수정 요청</a>
        <a href="#">판매 현황</a>
    </div>

    <!-- 메인 컨텐츠 영역 -->
    <form name="partnerAddForm.do" action="#">
    <div class="main-content">
        <h1>파트너 등록</h1>
        <hr>
        	<h2>뮤즈 정보</h2>
        	<table >
        		<tr>
        			<th>아이디</th>
        			<td><input type="text"></td>
        		</tr>
        		<tr>
        			<th>이름</th>
        			<td><input type="text"></td>
        		</tr>
        		<tr>
        			<th>전화번호</th>
        			<td><input type="text"></td>
        		</tr>
        		<tr>
        			<th>이메일 주소</th>
        			<td><input type="text"></td>
        		</tr>
        	</table>
        	<h2>파트너 정보</h2>
        	<table>
        		<tr>
        			<th>파트너 명</th>
        			<td><input type="text"></td>
        		</tr>
        		<tr>
        			<th>사업자 번호</th>
        			<td><input type="text"></td>
        		</tr>
        		<tr>
        			<th>사업자 명</th>
        			<td><input type="text"></td>
        		</tr>
        		<tr>
        			<th>대표자 이름</th>
        			<td><input type="text"></td>
        		</tr>
        	</table>
        	<input type="submit" value="신청">
        	<input type="reset" value="취소">
    </div>
    </form>
</body>
</html>