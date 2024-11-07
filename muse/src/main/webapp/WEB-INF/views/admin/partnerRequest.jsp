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

<style>

</style>


</head>
<body>

	<%@include file="header.jsp" %>
  	<%@include file="sidebar.jsp" %>
  	
    <!-- 메인 컨텐츠 영역 -->
    <form name="partnerRequest" action="partnerRequestEnd.do">
    <div class="main-content">
    	<div style="width:100%;">
        	<h1 style="text-align: center;">파트너 등록 상세</h1>
        	
        	<hr id="hrLine" style="">
        </div>
        
        <div class="table" style="width: 30%;display: flex;flex-direction: column;align-items: center;">
        	
            <h2>뮤즈 정보</h2>
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" value="${dto.u_id}" readonly></td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text" value="${dto.u_name}" readonly ></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="text" value="${dto.u_pnum}" readonly></td>
                </tr>
                <tr>
                    <th>이메일 주소</th>
                    <td><input type="text" value="${dto.u_email}" readonly></td>
                </tr>
            </table>
            
            <h2 style="margin-top:30px;">파트너 정보</h2>
            <table>
                <tr>
                    <th>파트너 명</th>
                    <td><input type="text" value="${dto.pr_name}" readonly ></td>
                </tr>
                <tr>
                    <th>사업자 번호</th>
                    <td><input type="text" value="${dto.pr_num}" readonly ></td>
                </tr>
                <tr>
                    <th>사업자 연락처</th>
                    <td><input type="text" value="${dto.pr_pnum}" readonly></td>
                </tr>
                <tr>
                    <th>사업자 이메일</th>
                    <td><input type="text" value="${dto.pr_email}" readonly></td>
                </tr>
            </table>
            <div class="buttondiv" style="padding-top: 20px;display: flex;gap: 10px;">
                <input type="button" class="blueButton" value="승인" onclick="window.location.href='partnerRequestEnd.do?rs_code=1&pr_code=${dto.pr_code}'">
                <input type="button" class="redButton" value="거절" onclick="window.location.href='partnerRequestEnd.do?rs_code=2&pr_code=${dto.pr_code}'">
                <input type="button" class="grayButton" value="뒤로가기" onclick="window.location.href='partnerRequestList.do'">
            </div>
        </div>
        
        
    </div>
    </form>

</body>
</html>