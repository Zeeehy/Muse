<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchResult</title>
<link href="/muse/resources/css/Yel.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
	<div class="search-content">
	<c:if test="${not empty search_ma or not empty search_mh}">
	<div class="search-word">"<span>&nbsp;${param.searchWord}&nbsp;</span>"&nbsp;&nbsp;에 대한 결과입니다.</div>
	</c:if>
	<c:if test="${empty search_ma and empty search_mh}">
	<div class="search-word2">"<span>&nbsp;${param.searchWord}&nbsp;</span>"&nbsp;&nbsp;에 대한 결과입니다.</div>
	</c:if>
		<!-- 검색 결과가 없으면 이 메시지를 출력 -->
	    <c:if test="${empty search_ma and empty search_mh and empty search_m}">
	        <div class="no-result"> 검색 결과가 없습니다.</div>
	    </c:if>
	
		<!-- 배우 검색 결과 -->		
		<c:if test="${not empty search_ma}">
   		<c:forEach var="musicalActor" items="${search_ma}">
		<div class="search-actor">
        	<div class="search-actor-img"><img src="resources/img/actor/${musicalActor.ma_img}" alt="배우 사진" width="180px" height="230px" style="border-radius: 15px;"></div>
        	<div class="search-actor-info">
        		<div class="search-actor-name"><span>${musicalActor.ma_name}</span>&nbsp;&nbsp;&nbsp;뮤지컬배우</div>
        		<div class="search-actor-birth">생년월일&nbsp;:&nbsp;${musicalActor.ma_birth}</div>
        		<div class="search-actor-cast">출연&nbsp;:&nbsp;$   {musicalActor.ma_musicalList}</div>
        	</div>
    	</div>
    	</c:forEach>
		</c:if>	
    	
    	<!-- 장소 검색 결과 -->
    	<c:if test="${not empty search_mh}">
   		<c:forEach var="musicalHall" items="${search_mh}">
    	<div class="search-place">
        	<div class="search-place-img"><img src="resources/img/musicial_hall/${musicalHall.mh_img}" alt="장소 사진" width="230px" height="230px" style="border-radius: 15px;"></div>
        	<div class="search-place-info">
        		<div class="search-place-name"><span>${musicalHall.mh_name}</span>&nbsp;&nbsp;&nbsp; 장소</div>
        		<div class="search-place-addr">주소&nbsp;:&nbsp;${musicalHall.mh_addr}</div>
        		<div class="search-place-cast">공연중&nbsp;:&nbsp;${musicalHall.mh_musicalList}</div>
        	</div>
    	</div>
    	</c:forEach>
		</c:if>	
    	
    	<!-- 뮤지컬 제목 검색 결과 (공통) -->
    	<c:if test="${not empty search_m}">
    	<div class="search-tickets-title">티켓(${count})</div>    	
    	<div class="search-tickets">
   		<c:forEach var="musicals" items="${search_m}">
        	<div class="search-ticket">                     
                  <div class="search-ticket-info">
                        <div class="search-ticket-poster"><img src="resources/img/musical/${musicals.m_poster}" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
                        <div class="search-ticket-subtitle"><a href="musicalDetail.do?m_code=${musicals.m_code}">뮤지컬 &lt;&nbsp;${musicals.m_title}&nbsp;&gt;</a></div>
                        <div class="search-ticket-place">${musicals.mh_name}</div>
                        <div class="search-ticket-date">${musicals.m_startdate} ~ ${musicals.m_enddate}</div>
                  </div>
            </div>
        </c:forEach>	                       
    	</div>
    	</c:if> 
	</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
