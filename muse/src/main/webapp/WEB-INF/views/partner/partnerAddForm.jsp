<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        /* 전체 레이아웃 설정 */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
        }

        /* 사이드바 스타일 */
        .sidebar {
            width: 250px;
            background-color: #333;
            color: #fff;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            padding-top: 20px;
        }

        /* 사이드바 메뉴 스타일 */
        .sidebar a {
            display: block;
            color: #fff;
            padding: 15px;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: #575757;
        }

        /* 메인 컨텐츠 스타일 */
        .main-content {
            margin-left: 250px; /* 사이드바 넓이만큼 여백 */
            padding: 20px;
            flex-grow: 1;
        }
    </style>
</head>
<body>
  <div class="sidebar">
        <h2>메뉴</h2>
        <a href="#">홈</a>
        <a href="#">게시판</a>
        <a href="#">문의사항</a>
        <a href="#">설정</a>
        <a href="#">로그아웃</a>
    </div>

    <!-- 메인 컨텐츠 영역 -->
    <div class="main-content">
        <h1>메인 콘텐츠</h1>
        <p>여기에 메인 콘텐츠를 추가하세요.</p>
    </div>




</body>
</html>