<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Ljh.css" type="text/css">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>

/* 특정 테이블 스타일 */

/* 특정 테이블 스타일 */
#bannerListTable {
    width: 100%;
    border-collapse: collapse;
}

/* 테이블 헤더 스타일 */
#bannerListTable th {
    background-color: #a5cfe3;
    color: white;
    padding: 10px;
    text-align: center;
    font-weight: bold;
    border-bottom: 2px solid #ddd;
}

/* 테이블 데이터 셀 스타일 */
#bannerListTable td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    height:30px;
}

/* 테이블에 호버 효과 추가 */
#bannerListTable tr:hover {
    background-color: #f9f9f9;
}

/* 버튼 스타일 삭제 */
.redButton  {
    background-color: #ff6666;
    color: white;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    border-radius: 5px;
}

/* 버튼 호버 효과 삭제 */
.redButton:hover {
    background-color: #ff3333;
}

/* 버튼 스타일 삭제 */
.blueButton  {
    background-color: #66b7ff;
    color: white;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    border-radius: 5px;
}

/* 버튼 호버 효과 삭제 */
.blueButton:hover {
    background-color: #335dff;
}

/*배너 이미지*/
.bannerImg{
	width: 100px;
    height: 100px;
    border-radius: 5px;}
    
tbody tr {
  border-bottom: 1px solid #ddd;
}   
</style>


</head>
<body>

<%@include file="header.jsp" %>
<%@include file="sidebar.jsp" %>


	<div class="main-content">
	
		<h1 style="margin-top: 40px; margin-bottom:50px;"> 배너 등록 / 삭제</h1>
		<table id="bannerListTable" >
			<tr >
				<th>순서</th>
				<th>포스터</th>
				<th>공연 이름</th>
				<th>제작사 이름</th>
				<th>배너 등록일</th>
				<th>등록 / 삭제</th>
			</tr>
			
			<c:forEach var="dto" items="${lists}" varStatus="status">
			    <tr>
			        <td>${status.index + 1}</td> <!-- 반복문 돌린 횟수 -->
			        <td><img src="/muse/resources/img/musical/${dto.m_poster}" class="bannerImg"></td>
			        <td>${dto.m_title}</td> 
			        <td>${dto.pr_name}</td>
			        <td>${dto.b_date}</td>
			        <td>
			            <input type="button" value="삭제" class="redButton" onclick="window.location.href='deleteBanner.do?m_code=${dto.m_code}'">
			        </td>
			    </tr>
			</c:forEach>
			
			<!-- 빈 행을 추가하여 총 8행을 맞춤 -->
			<c:forEach begin="${fn:length(lists) + 1}" end="8" var="i">
			    <tr>
			        <td>${i}</td> <!-- 빈 행의 순서 -->
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td><input type="button" value="등록" class="blueButton" onclick="openAddBanner()"></td>
			    </tr>
			</c:forEach>


		
			
		</table>
	</div>
	




</body>

<script>
function openAddBanner(){
    window.open("addBannerList.do","배너 등록", "width=1000,height=600" );
}
</script>


</html>