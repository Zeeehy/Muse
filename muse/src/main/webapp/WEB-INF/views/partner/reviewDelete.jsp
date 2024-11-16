<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/muse/resources/css/Phj.css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<title>Insert title here</title>
</head>
	<%@include file="header.jsp" %>
  	<%@include file="sidebar.jsp" %>
 	<%@include file="musicalNamePopup.jsp"%>
<body>
<div class="main-content">
		<div class="main-contenttop">
			<h1>리뷰 삭제</h1>
			<hr>
		</div>

		<div class="table-content">
				<table style="border-collapse: collapse; margin-bottom: 20px;">
				
			<form name="seachReviewMusical" action="serchMusical">
					<tr>
						<th>뮤지컬명</th>
						<td colspan="3"><input type="text" name="m_title"
							placeholder="뮤지컬을 선택하세요" readonly> <input type="hidden"
							name="m_code"></td>
						<td class="button-container" style="text-align: right;"><input
							type="button" value="찾기" onclick="showMusicalNamePopup(event)">
						</td>
						<td><input type="submit" value="검색"></td>
					</tr>
			</form>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<td>상태</td>
						<td>삭제 요청</td>
						
					</tr>
					<c:forEach var="dto" items="${list}">
					<form name="deleteReview" action="deleteReviewAction.do">
					<tr>
						<td><input type="hidden" value="${dto.mr_code}"></td>
						<td>${dto.mr_code}</td>
						<td>${dto.mr_title}</td>
						<td>${dto.u_id}</td>
						<td>${dto.mr_date}</td>
						<td>삭제 대기</td>
						<td><input type="submit" value="삭제"></td>
	                </tr>
	                </form>
	           	</c:forEach>
					
					
				</table>
				<%@include file="partnerInfo.jsp" %>
				<div class="buttondiv">
					<input type="button" value="신청" onclick="insertTicketOpen()">
					<input type="reset" value="취소">
				</div>

		</div>
	</div>
</body>
</html>