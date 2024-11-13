<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/muse/resources/css/Ljh.css" type="text/css">

<style>
.floorSection {
    display: flex;
    justify-content: center;
    gap : 15px;
}
.seating_table_container{
   display: flex;
    justify-content: center;
    align-items: center;
    margin: 40px;
    font-weight: bolder;
}
.first, .second{
   display: flex;
    justify-content: center;
    align-items: center;
    margin: 40px;
    font-weight: bolder;
}
.seat {
    float: left;
    display: flex;
    justify-content: center;
    align-items: center;
    border: none;
    border-radius: 10%;
    margin: 2.5px;
}
.row{
   display: flex;
   flex-wrap: wrap;
   justify-content: center;
}
.row .row_zone p{
   width:5px;
   height:5px;
   margin:0;
   display: flex;
    align-items: center;
    justify-content: center;
    font-size: 10px;
    
}
.seats{
   margin: 2px;
    background: #fff;
    border: 0.5px solid #666;
    cursor: pointer;
}
.seat {
    width: 5px;
    height: 5px;
}
.seat p {   
    /* display: none; */
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    unicode-bidi: isolate;
}
.section_A .row{
     justify-content: flex-end;
}
.section_B .row{
     justify-content: center;
   
}
.section_C .row{
     justify-content: flex-start;
}
#seattable_zone{
   text-align: center;
}

.rowNum{
   margin-top: 21.3px;
   display: flex;
    flex-direction: column;
}
.row_zone {
   margin:5px;}

.VIP{
   background-color: red;
}

</style>

</head>
<body>

<%@include file="../header.jsp" %>

<div style="margin-left: 20px;margin-top: 30px;font-size: 10pt;">
	<h1>공연장 : ${mh_name}</h1>
	<c:if test="${not empty m_title}">
		<h1>공연명 : ${m_title}</h1>
	</c:if>
	
	<div style="margin-top:12px;">
		<c:if test="${empty m_title}">
			<c:if test="${sl_bind==1}">
				<input class="blueButton" type="button" onclick="window.location.href='srShow.do?mh_code=${mh_code}&sl_bind=1'" value="1층">
				<input class="grayButton" type="button" onclick="window.location.href='srShow.do?mh_code=${mh_code}&sl_bind=2'" value="2층 3층">
			</c:if>
			<c:if test="${sl_bind!=1}">
				<input class=grayButton type="button" onclick="window.location.href='srShow.do?mh_code=${mh_code}&sl_bind=1'" value="1층">
				<input class="blueButton" type="button" onclick="window.location.href='srShow.do?mh_code=${mh_code}&sl_bind=2'" value="2층 3층">
			</c:if>
			
		</c:if>
		
		<c:if test="${not empty m_title}">
			<c:if test="${sl_bind==1}">
				<input class="blueButton" type="button" onclick="window.location.href='srShow.do?mh_code=${mh_code}&m_code=${m_code}&sl_bind=1'" value="1층">
				<input class="grayButton" type="button" onclick="window.location.href='srShow.do?mh_code=${mh_code}&m_code=${m_code}&sl_bind=2'" value="2층 3층">
			</c:if>
			<c:if test="${sl_bind!=1}">
				<input class=grayButton type="button" onclick="window.location.href='srShow.do?mh_code=${mh_code}&m_code=${m_code}&sl_bind=1'" value="1층">
				<input class="blueButton" type="button" onclick="window.location.href='srShow.do?mh_code=${mh_code}&m_code=${m_code}&sl_bind=2'" value="2층 3층">
			</c:if>
		</c:if>
	</div>

</div>


<%@ include file="/WEB-INF/views/review/printSeat.jsp" %>
<div style="height:300px;"></div>
<%@include file="../footer.jsp" %>


</body>


<script>

</script>



</html>