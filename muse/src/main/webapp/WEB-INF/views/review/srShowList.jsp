<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<style>
.ystarHalf, .gstarHalf {
    width: 12px; /* 원본 사이즈/2 */
    height: 24px;
    display: inline-block; /* 나란히 배치 */
    background-repeat: no-repeat;
    background-size: 24px 24px; /* 이미지 크기를 24px로 설정 */
    margin-left: -4px;
}

.ystarHalf {
    background-image: url("/muse/resources/img/ystar.svg");
    background-position: left; /* 왼쪽 반만 채워지게 */
}

.gstarHalf {
    background-image: url("/muse/resources/img/gstar.svg");
    background-position: right; /* 오른쪽 반만 빈 별로 */
}

</style>


<style>
/* 리뷰 목록 컨테이너 */
.reviews-container {
    width: 80%;  /* 부모 div의 80%로 설정, 필요에 따라 조정 */
    max-width: 1000px;
    margin: 0 auto;  /* 부모 div 내부에서 중앙 정렬 */
    padding: 20px;
    background-color: #f8f8f8;
}

/* 각 리뷰 아이템 */
.review {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    width: 1000px;
}

/* 리뷰 hover 시 효과 */
.review:hover {
    transform: translateY(-5px); /* 위로 살짝 이동 */
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}

/* 리뷰 제목 */
.review_title {
    font-size: 18px;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
}

/* 별점 표시 */
.review-stars {
    margin-top: 5px;
    margin-bottom: 10px;
}

/* 채운 별과 빈 별을 나란히 배치 */
.ystarHalf, .gstarHalf {
    width: 12px;
    height: 24px;
    display: inline-block;
    background-repeat: no-repeat;
    background-size: 24px 24px;
}

/* 채워진 별 */
.ystarHalf {
    background-image: url("/muse/resources/img/ystar.svg");
    background-position: left;
}

/* 빈 별 */
.gstarHalf {
    background-image: url("/muse/resources/img/gstar.svg");
    background-position: right;
}

/* 별 이미지 */
.review-stars img {
    width: 24px;
    height: 24px;
    margin-right: 4px;
}

/* 리뷰 날짜 */
.review_date {
    font-size: 14px;
    color: #777;
    margin-top: 10px;
}

/* 리뷰 내용 */
.review_content {
    font-size: 15px;
    color: #555;
    line-height: 1.6;
    margin-top: 10px;
}


</style>

</head>
<body>

<%@include file="../header.jsp" %>
             
	         
<div style="margin-left: 400px; margin-top: 100px; margin-bottom: 50px;">

	<div >
		<h1 style="margin-bottom: 20px;">${mh_name}</h1>		
		<div>${sl_floor}층  ${sl_section}구역 ${sl_row}열 ${s_position}번</div>
		<div style="margin-bottom: 70px;">
			평균평점 : 
			<span>
				<c:forEach begin="1" end="5" var="i">
					<c:choose>
			            <%-- 완전한 별 --%>
			            <c:when test="${i <= Math.floor(avg_score)}">
			                <img src="/muse/resources/img/ystar.svg" >
			            </c:when>
			            
			            <%-- 반 별 --%>
			            <c:when test="${i == Math.ceil(avg_score) && avg_score % 1 >= 0.5}">
			                <span class="ystarHalf"></span>
			                <span class="gstarHalf"></span>
			            </c:when>
			            
			            <%-- 빈 별 --%>
			            <c:otherwise>
			                <img src="/muse/resources/img/gstar.svg" >
			            </c:otherwise>
			        </c:choose>
			   </c:forEach>
			     
			</span>    
			(${avg_score}) 
		</div>
		 
		
	</div>

    
    <c:forEach var="dto" items="${lists}" varStatus="status">
        <div class="review">
            <div class="review_title">${dto.m_title}</div>
            
            <!-- 별 -->
            <div class="review-stars">
			    <c:forEach begin="1" end="5" var="i">
			        <c:choose>
			            <%-- 완전한 별 --%>
			            <c:when test="${i <= Math.floor(dto.sr_score)}">
			                <img src="/muse/resources/img/ystar.svg" >
			            </c:when>
			            
			            <%-- 반 별 --%>
			            <c:when test="${i == Math.ceil(dto.sr_score) && dto.sr_score % 1 >= 0.5}">
			                <span class="ystarHalf"></span>
			                <span class="gstarHalf"></span>
			            </c:when>
			            
			            <%-- 빈 별 --%>
			            <c:otherwise>
			                <img src="/muse/resources/img/gstar.svg" >
			            </c:otherwise>
			        </c:choose>
			        
			    </c:forEach>
			    (${dto.sr_score})
			</div>

            
            <div class="review_date">${dto.sr_date}</div>
            
            <div class="review_content">${dto.sr_content}</div>
        </div>
    </c:forEach>
	
</div>
<%@include file="../footer.jsp" %>

</body>
</html>