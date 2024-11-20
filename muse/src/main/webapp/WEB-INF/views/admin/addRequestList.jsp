<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Ljh.css" type="text/css">
<link rel="stylesheet" href="/muse/resources/css/Phj.css" type="text/css">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<style>
/* 특정 테이블 스타일 */
#bannerListTable {
    width: 100%;
    border-collapse: collapse;
    font-family: Arial, sans-serif;
}

/* 테이블 헤더 스타일 */
#bannerListTable th {
    background-color: #f2f2f2;
    color: #333;
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
</style>


</head>
<body>

<%@include file="header.jsp" %>
<%@include file="sidebar.jsp" %>


	<div class="main-content">
	
		<h1 style="margin-top: 21px; margin-bottom: 21px;"> 공연 등록 승인</h1>
		<hr id="hrLine">
		<table id="bannerListTable" border="1" cellspacing="0">
			<tr >
				<th>공연명</th>
				<th>파트너명</th>
				<th>공연스케쥴</th>
				<th>단독판매여부</th>
				<th>공연 오픈 희망 날짜</th>
			</tr>
			
			<c:forEach var="dto" items="${lists}" varStatus="status">
			    <tr>
			        <td><a href="addRequest.do?sr_code=${dto.sr_code}">${dto.m_title}</a></td> 
			        <td><a href="addRequest.do?sr_code=${dto.sr_code}">${dto.pr_name}</a></td> 
			        <td><a href="addRequest.do?sr_code=${dto.sr_code}">${dto.m_startdate} ~ ${dto.m_enddate}</a></td>
			        <td><a href="addRequest.do?sr_code=${dto.sr_code}"> 
			        	<c:if test="${dto.m_single == 1}">
			        		단독 판매
			        	</c:if>
			        	<c:if test="${dto.m_single != 1}">
			        		단독 판매 X
			        	</c:if>
			        </a></td>
			        <td><a href="addRequest.do?sr_code=${dto.sr_code}">${dto.m_opendate}</a></td>
			    </tr>
			</c:forEach>
			
			<c:if test="${empty lists}">
				<tr>
					<td colspan="5" align="center">공연등록 신청이 없습니다.</td>
				</tr>
			</c:if>
			
		</table>
	</div>
	




</body>
</html>