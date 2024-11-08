<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<style>
/* 전체 컨테이너 */
.search-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 100px auto;
    width: 800px;
 
}

/* 공연명과 공연장의 구분 */
.search-container > div:first-child {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
}

.search-container span {
    font-size: 20pt;
    margin: 0 15px;
}

/* hr 스타일 */
hr {
    width: 100%;
    border: 1px solid #ff3d32;
    margin: 10px 0;
}

/* 킹키부츠 검색결과 설명 */
.search-result {
    text-align: center;
    font-size: 17pt;
    margin-bottom: 100px;
    /* color: #555; */
    margin-top:35px;
}

/* 뮤지컬 항목 */
.musical-item {
	display: flex;
    align-items: flex-start;
    width: 100%;
    margin-bottom: 30px;
    justify-content: center;
    margin-left:18px;
    margin-top:15px;
}

/* 이미지 스타일 */
.musical-item img {
    width: 140px;
    margin-right: 20px;
    border-radius: 8px;
}

/* 텍스트 영역 */
.musical-item div {
    font-size: 14pt;
    line-height: 1.6;
    color: #333;
}

.musical-item p {
    margin: 5px 0;
}

.spanColor{
	color:#ff3d32;
}
</style>

</head>
<body>
<%@ include file="../header.jsp" %>

<div class="search-container">
    <!-- 공연명 / 공연장 -->
    <div>
    	<c:if test="${searchTag eq 'mh_name'}">
    		<span style="margin-right:200px;color:#555; " >공연명</span>
        	<span style="margin-left:200px;" class="spanColor">공연장</span>
    	</c:if>
    	
    	<c:if test="${searchTag eq 'm_title'}">
    		<span style="margin-right:200px; "class="spanColor" >공연명</span>
        	<span style="margin-left:200px;color:#555;" >공연장</span>
    	</c:if>
        
    </div>
    
   
    <hr>
    
    <!-- 검색 결과 설명 -->
    <div class="search-result">
        <p><span style="color :red">${searchWord}</span> 에 대한 검색결과입니다.</p>
    </div>
    
    
    <!-- 공연명 -->
    <c:if test="${searchTag eq 'm_title'}">
    	<c:forEach var="dto" items="${list}">
    		 <div class="musical-item" onclick="location.href='/muse/musical/detail/${dto.m_code}'" style="cursor: pointer;">

	    		<img src="/muse/resources/img/musical/${dto.m_poster}" alt="${dto.m_title}">
		        <div style="margin-left:40px;">
		        	<div style="display: flex;flex-direction: column;gap: 64px;">
			        	<p><strong>${dto.m_title}</strong></p>
			            <p>${dto.mh_name}</p>
		        	</div>
		            
		            <p style="color:#555;">${dto.m_startdate} ~ ${dto.m_enddate}</p>
		        </div>
	    	</div>
    	</c:forEach>
    </c:if>
    
    <c:if test="${searchTag eq 'mh_name'}">
    	<c:forEach var="dto" items="${list}">
    		 <div class="musical-item" onclick="location.href='/muse/musical/detail/${dto.mh_code}'" style="cursor: pointer;margin-top: 30px;align-items: center; gap: 25px;">

	    		<img src="/muse/resources/img/seatReview.PNG" style="width:150px;" >
	    			<p style="font-size:14pt;"><strong>${dto.mh_name}</strong></p>
	    		</div>
    	</c:forEach>
    </c:if>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>
