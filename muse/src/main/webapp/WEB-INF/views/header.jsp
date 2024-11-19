<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
<style>
	<!-- 로그인 했을 때 -->
	.loginNow {color: #fff;}
	.loginNow span {color: #00FFFF; font-size: 17px;}
	.loginNow a {margin-left: 100px; opacity: 0.7;}
</style>
</head>
<body>
    <div class="wrap"> <!-- wrapper 시작 -->
        <div class="top">
        	<c:if test="${empty sessionScope.s_name}">
	            <a href="memberJoin.do">JOIN</a>
	            <a href="memberLogin.do">LOGIN</a>
           	</c:if>
           	<c:if test="${!empty sessionScope.s_name}">
	            <div class="loginNow" style="color: #fff;"><span>${sessionScope.s_name}</span> 님 로그인 중 <a href="memberLogout.do">LOGOUT</a></div>
	            <a href="myPageMain.do" class="topmusepass">My page <img src="resources/img/main/topicon.png"></a>
           	</c:if>
        </div>
        <div class="header">
            <h1 id="logo"><a href="index.do"><img src="resources/img/main/muselogo.png"></a></h1>
            <ul>
                <li><a href="#">오픈공지</a></li>
                <li><a href="srIndex.do">좌석리뷰</a></li>
                <li><a href="rank.do">랭킹</a></li>
                <li><a href="musepass.do">뮤즈패스</a></li>
            </ul>
            <form action="mainSearch.do">
            <div class="search">           
                <input name="searchWord" type="text" placeholder="검색어를 입력해주세요.">
                <button type="submit">검색</button>
            </div>
            </form>
      	</div>
</body>
</html>