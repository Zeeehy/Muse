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
    
    
    
.buttonContainer{
align-self: flex-start;
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
    margin-left: 66px;
   }    
   
.tabButton{
    width: 100px;
    height: 40px;
    border-radius: 10px;
    border: 0px;
    background: lightblue;
}   
.tabButton:hover{
background:#5794bf;
cursor: pointer;
color:white;
}

.clickedButton{
background:#5794bf;
}
</style>

<style>
    /* 추가된 콘텐츠 행의 스타일 */
    .content-detail {
        padding: 10px;
        background-color: #f9f9f9;
        border-top: 1px solid #ddd;
    }
    .content-row td {
        padding-top: 0;
        padding-bottom: 0;
    }
</style>
</head>
<body>

<%@include file="header.jsp" %>
<%@include file="sidebar.jsp" %>


	<div class="main-content">
	
		<h1 style="margin-top: 21px; margin-bottom: 21px;"> 불량 단어 리뷰 관리</h1>
		<hr id="hrLine">
		
		<div class="buttonContainer ">
			<input type="button" class="tabButton" value="전체보기" onclick="window.location.href='adminReviewList.do'">
			<input type="button" class="tabButton clickedButton" value="불량단어" onclick="window.location.href='adminBadReviewList.do'">
		</div>
		
		<table id="bannerListTable" border="1" cellspacing="0">
			<tr >
				<th>제목</th>
				<th>뮤지컬이름</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>별점</th>
				<th>차단 / 되돌리기</th>
			</tr>
			   <!--  mr_code, mr_score, mr_title,mr_content, mr_date, m_title,u_id -->
			<c:forEach var="dto" items="${lists}" varStatus="status">
			     <tr class="review-row" data-content="${dto.mr_content}">
			        <td><a href="javascript:void(0)" onclick="toggleContent(this)">${dto.mr_title}</a></td> <!-- 반복문 돌린 횟수 -->
			        <td><a href="javascript:void(0)" onclick="toggleContent(this)">${dto.m_title}</a></td> 
			        <td><a href="javascript:void(0)" onclick="toggleContent(this)">${dto.u_id}</a></td>
			        <td><a href="javascript:void(0)" onclick="toggleContent(this)">${dto.mr_date}</a></td>
			        <td><a href="javascript:void(0)" onclick="toggleContent(this)">${dto.mr_score}</a></td>
			        
			        <c:if test="${dto.mr_state == 2}">
			        	<td><input type="button" class="blueButton" value="되돌하기" onclick="window.location.href='adminDeleteReview.do?mr_code=${dto.mr_code}&mr_state=${dto.mr_state}'"></td>
			        </c:if>
			        <c:if test="${dto.mr_state == 0 or dto.mr_state == 1}">
			        	<td><input type="button" class="redButton" value="차단하기" onclick="window.location.href='adminDeleteReview.do?mr_code=${dto.mr_code}&mr_state=${dto.mr_state}'"></td>
			        </c:if>
			       
			    </tr>
			</c:forEach>
			
			<c:if test="${empty lists}">
				<tr>
					<td colspan="5" align="center">등록된 공연리뷰가 없습니다.</td>
				</tr>
			</c:if>
			
		</table>
	</div>
	

</body>


  <script>
        // 선택한 행 아래에 콘텐츠를 토글로 보여주는 함수
        function toggleContent(mr_content) {
            const row = mr_content.closest("tr");
            const content = row.getAttribute("data-content");
            const nextRow = row.nextElementSibling;
            

            // 이미 열려 있는지 확인
            if (nextRow && nextRow.classList.contains("content-row")) {
                nextRow.remove(); // 이미 열려 있다면 제거
            } else {
            	 // content가 비어있을 경우, 'No content available' 출력
                const contentToDisplay = content && content.trim() !== '' ? content : 'No content available';
                
                
                // 새로운 행을 삽입해 내용 표시
                const newRow = document.createElement("tr");
                newRow.classList.add("content-row");

                newRow.innerHTML = `
                    <td colspan="6">
                        <div class="content-detail">
                        </div>
                    </td>
                `;
                
				const contentDiv = newRow.querySelector(".content-detail");
				contentDiv.textContent = contentToDisplay;  // 텍스트만 삽입, HTML은 처리되지 않음

                row.after(newRow);
                
            }
        }
    </script>


</html>