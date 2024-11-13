<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 기본 초기화 */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif; /* 원하는 폰트로 변경 가능 */
    color: #333;
    background-color: #f8f8f8;
}

/* 레이아웃 스타일 */
.container {
    display: flex;
    max-width: 1200px;
    margin: 20px auto;
}

/* 사이드바 스타일 */
.sidebar {
    width: 200px;
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 20px;
    margin-right: 20px;
}

.sidebar h2 {
    font-size: 18px;
    color: #d2322d; /* 빨간색 텍스트 */
    margin-bottom: 10px;
}

.sidebar ul {
    list-style: none;
}

.sidebar ul li {
    margin-bottom: 10px;
    font-size: 14px;
    color: #333;
}

.sidebar ul li a {
    color: #333;
    text-decoration: none;
}

/* 메인 콘텐츠 스타일 */
.main-content {
    flex: 1;
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 20px;
}

/* 제목 스타일 */
.main-content h2 {
    font-size: 16px;
    color: #d2322d; /* 빨간색 텍스트 */
    border-bottom: 2px solid #d2322d;
    padding-bottom: 5px;
    margin-bottom: 20px;
}

.news-section {
    background-color: #f7f7f7;
    padding: 15px;
    margin-bottom: 20px;
    border: 1px solid #ddd;
    font-size: 0.9em;
    color: #777;
}

.interest-section h4 {
    font-size: 1.2em;
    margin-bottom: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.register-btn {
    background-color: #d9534f;
    color: #fff;
    padding: 8px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 0.9em;
}

.interest-list {
    border: 1px solid #ddd;
    padding: 15px;
    background-color: #f9f9f9;
}

.interest-category {
    margin-bottom: 15px;
}

.interest-category h5 {
    font-size: 1em;
    color: #555;
    margin-bottom: 10px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 5px;
}

.item {
    display: flex;
    align-items: center;
    padding: 10px;
    background-color: #fff;
    border: 1px solid #ddd;
    margin-bottom: 10px;
    border-radius: 4px;
}

.item-info {
    margin-left: 10px;
}

.item-info p {
    margin: 2px 0;
    font-size: 0.85em;
    color: #333;
}

footer {
	position: absolute;
	bottom: 0;
	width: 100%;
}
</style>
<script>
function openMuseCasting() {
	window.open('museCasting.do','museCasting','width=650,height=350');
}
</script>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="container">
    <!-- 사이드바 -->
    <div class="sidebar">
        <h2>마이페이지</h2>
        <ul>
            <li><a href="#">예약/취소내역</a></li>
            <li><a href="#">나의 뮤즈캐스트</a></li>
            <li><a href="#">나의 MUSEPASS</a></li>
            <li><a href="#">나의 후기</a></li>
            <li><a href="#">뮤즈캘린더</a></li>
            <li><a href="#">1:1 문의</a></li>
        </ul>
    </div>

    <!-- 메인 콘텐츠 -->
    <div class="main-content">
        <h2>나의 뮤즈캐스트</h2>
        <div class="news-section">
            <p>뮤즈캐스트에 등록된 공연/인물의 최근 업데이트 소식이 없습니다</p>
        </div>

        <div class="interest-section">
            <h4>뮤즈캐스트 등록 / 수정</h4>
            <button class="register-btn" onclick="openMuseCasting()">뮤즈캐스트 등록하기</button>
           
            <div class="interest-list">
                <div class="interest-category">
                    <h5>관심배우 (1명)</h5>
                    <div class="item">
                        <input type="checkbox">
                        <div class="item-info">
                            <p>최재림</p>
                            <p>뮤지컬 배우</p>
                            <p>2024.10.13 등록</p>
                        </div>
                    </div>
                </div>
               
                <div class="interest-category">
                    <h5>관심공연 (5개)</h5>
                    <div class="item">
                        <input type="checkbox">
                        <div class="item-info">
                            <p>뮤지컬 &lt;시카고&gt;</p>
                            <p>2024.05.22 ~ 2024.06.22</p>
                            <p>2024.10.28 등록</p>
                        </div>
                    </div>
                    <!-- 관심 공연 항목을 반복해서 추가 -->
                </div>
            </div>
        </div>
        
       
        
    </div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>