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
</style>

<style>
    /* 추가된 콘텐츠 행의 스타일 */
    
    .content-detail, .content-reason {
        padding: 10px;

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
	
		<h1 style="margin-top: 21px; margin-bottom: 21px;"> 파트너 리뷰 관리</h1>
		<hr id="hrLine">
		
		
		<table id="bannerListTable" border="1" cellspacing="0">
			<tr >
				<th>리뷰 제목</th>
				<th>뮤지컬이름</th>
				<th>요청자</th>
				<th>작성일</th>
				<th>별점</th>
				<th>승인 / 거부</th>
			</tr>
			   
			<c:forEach var="dto" items="${lists}" varStatus="status">
			     <tr class="review-row" data-content="${dto.mr_content}" data-reason="${dto.bdr_reason}">
			        <td><a href="javascript:void(0)" onclick="toggleContent(this)">${dto.mr_title}</a></td> <!-- 반복문 돌린 횟수 -->
			        <td><a href="javascript:void(0)" onclick="toggleContent(this)">${dto.m_title}</a></td> 
			        <td><a href="javascript:void(0)" onclick="toggleContent(this)">${dto.pr_name}</a></td>
			        <td><a href="javascript:void(0)" onclick="toggleContent(this)">${dto.mr_date}</a></td>
			        <td><a href="javascript:void(0)" onclick="toggleContent(this)">${dto.mr_score}</a></td>
			        <td>
			        	<input type="button" class="redButton" value="삭제하기" onclick="window.location.href='pReview.do?bdr_code=${dto.bdr_code}&bdr_state=1'">
			        	<input type="button" class="blueButton" value="거절하기" onclick="window.location.href='pReview.do?bdr_code=${dto.bdr_code}&bdr_state=2'">
			        </td>
			        
			    </tr>
			</c:forEach>
			
			<c:if test="${empty lists}">
				<tr>
					<td colspan="5" align="center">리뷰삭제 요청이 없습니다.</td>
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
            const reason = row.getAttribute("data-reason");
            const nextRow = row.nextElementSibling;
            

            // 이미 열려 있는지 확인
            if (nextRow && nextRow.classList.contains("content-row")) {
                nextRow.remove(); // 이미 열려 있다면 제거
            } else {
               
                // 새로운 행을 삽입해 내용 표시
                const newRow = document.createElement("tr");
                newRow.classList.add("content-row");

                newRow.innerHTML = `
                    <td colspan="6">
                        <div class="">
                            <p class="content-detail" style="border-bottom: 1px solid #ddd;">리뷰 내용: ${contentToDisplay}</p>
                            <p class="content-reason" style="margin-top: 10px;">요청 사유: ${reason || '사유 없음'}</p>
                        </div>
                    </td>
                `;

                const contentDiv = newRow.querySelector(".content-detail");
                const reasonDiv = newRow.querySelector(".content-reason");
				
				contentDiv.textContent = "리뷰 내용 : "+content ; 
				reasonDiv.textContent = "요청 사유 :"+reason; 
                
				row.after(newRow);
                
            }
        }
    </script>


</html>