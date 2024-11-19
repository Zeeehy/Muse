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
	<div class="search-word">'<span>&nbsp;조정은&nbsp;</span>' 에 대한 결과입니다.</div>
		<!-- 배우 검색 결과 -->		
		<div class="search-actor">
        	<div class="search-actor-img"><img src="resources/img/actor/ChoJungEun.jpg" alt="배우 사진" width="180px" height="230px" style="border-radius: 15px;"></div>
        	<div class="search-actor-info">
        		<div class="search-actor-name"><span>조정은</span>&nbsp;&nbsp;&nbsp;뮤지컬배우</div>
        		<div class="search-actor-birth">생년월일&nbsp;:&nbsp;1979-07-17</div>
        		<div class="search-actor-cast">출연&nbsp;:&nbsp;리지(2024), 벤자민 버튼(2024)</div>
        	</div>
    	</div>
    	
    	<!-- 장소 검색 결과 -->
    	<div class="search-place">
        	<div class="search-place-img"><img src="resources/img/musicial_hall/bluesquare.PNG" alt="장소 사진" width="230px" height="230px" style="border-radius: 15px;"></div>
        	<div class="search-place-info">
        		<div class="search-place-name"><span>블루스퀘어</span></div>
        		<div class="search-place-addr">주소&nbsp;:&nbsp;서울 용산구 이태원로 294</div>
        		<div class="search-place-cast">공연중&nbsp;:&nbsp;리지(2024), 벤자민 버튼(2024)</div>
        	</div>
    	</div>
    	
    	<!-- 뮤지컬 제목 검색 결과 (공통) -->
    	<div class="search-tickets-title">티켓&nbsp;(6)</div>
    	<div class="search-tickets">
        	<div class="search-ticket">                     
                  <div class="search-ticket-info">
                        <div class="search-ticket-poster"><img src="resources/img/musical/aladinPoster.PNG" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
                        <div class="search-ticket-subtitle"><a href="musicalDetail.do?m_code=">뮤지컬 &lt;&nbsp;알라딘&nbsp;&gt;</a></div>
                        <div class="search-ticket-place">샤롯데씨어터</div>
                        <div class="search-ticket-date">2024-11-22 ~ 2025-06-22</div>
                  </div>
            </div>
            <div class="search-ticket">                     
                  <div class="search-ticket-info">
                        <div class="search-ticket-poster"><img src="resources/img/musical/aladinPoster.PNG" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
                        <div class="search-ticket-subtitle"><a href="musicalDetail.do?m_code=">뮤지컬 &lt;&nbsp;알라딘&nbsp;&gt;</a></div>
                        <div class="search-ticket-place">샤롯데씨어터</div>
                        <div class="search-ticket-date">2024-11-22 ~ 2025-06-22</div>
                  </div>
            </div>
            <div class="search-ticket">                     
                  <div class="search-ticket-info">
                        <div class="search-ticket-poster"><img src="resources/img/musical/aladinPoster.PNG" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
                        <div class="search-ticket-subtitle"><a href="musicalDetail.do?m_code=">뮤지컬 &lt;&nbsp;알라딘&nbsp;&gt;</a></div>
                        <div class="search-ticket-place">샤롯데씨어터</div>
                        <div class="search-ticket-date">2024-11-22 ~ 2025-06-22</div>
                  </div>
            </div>
            <div class="search-ticket">                     
                  <div class="search-ticket-info">
                        <div class="search-ticket-poster"><img src="resources/img/musical/aladinPoster.PNG" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
                        <div class="search-ticket-subtitle"><a href="musicalDetail.do?m_code=">뮤지컬 &lt;&nbsp;알라딘&nbsp;&gt;</a></div>
                        <div class="search-ticket-place">샤롯데씨어터</div>
                        <div class="search-ticket-date">2024-11-22 ~ 2025-06-22</div>
                  </div>
            </div>
            <div class="search-ticket">                     
                  <div class="search-ticket-info">
                        <div class="search-ticket-poster"><img src="resources/img/musical/aladinPoster.PNG" alt="공연 포스터" width="260px" height="330px" style="border-radius: 15px;"></div>
                        <div class="search-ticket-subtitle"><a href="musicalDetail.do?m_code=">뮤지컬 &lt;&nbsp;알라딘&nbsp;&gt;</a></div>
                        <div class="search-ticket-place">샤롯데씨어터</div>
                        <div class="search-ticket-date">2024-11-22 ~ 2025-06-22</div>
                  </div>
            </div>           
    	</div>
	</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
