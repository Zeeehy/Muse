<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>


</style>


</head>
<body>

<div id="header" style="width:100%; height:200px; background:lightblue;"></div>

<div style="display:flex;">
	<div id="sidebar" style="height:2000px; width:300px;background:lightgreen;"></div>
	
	<div>
		<p style=" font-size:50pt; margin-left: 100px;margin-top:84px;font-weight: 600;"> 배너 등록</p>
		
		<table style="border:1px solid black;">
			<tr style="border:1px solid black;">
				<th>순서</th>
				<th>공연 이름</th>
				<th>제작사 이름</th>
				<th>배너 등록일</th>
				<th>등록 / 삭제</th>
			</tr>
			
			<tr style="border:1px solid black;"/>
				<td>1</td>
				<td>알라딘</td>
				<td>EMK</td>
				<td>2024.10.01</td>
				<td><input type="button" value="삭제"></td>
				
			</tr>
		</table>
	</div>
	
</div>

</body>
</html>