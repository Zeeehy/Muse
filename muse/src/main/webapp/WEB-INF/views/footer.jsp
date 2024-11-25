<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.ft04 {
    position: relative;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 55px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 10px;
    text-decoration: none;
    display: block;
    font-size: 12px;
}

.dropdown-content a:hover {
    background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
</head>
<body>
<footer>
    <div class="area">
        <div class="ft_img">
            <img src="resources/img/main/muselogo.png">
            <p>뮤즈</p>
        </div>
        <div class="ft01">
            <ul>
                <li>
                    <span>대표 : 박진우, 박형주, 고유리, 이지현, 정다영, 진예림</span>
                </li>
                <li>
                    <span>주소 : 서울시 마포구 서교동 447-5 풍성빌라 201</span>
                </li>
            </ul>
        </div>
        <div class="ft02">
            <ul>
                <li>
                    <span>E-mail : jip3022@naver.com</span>
                </li>
                <li>
                    <span>고객센터 : 1500-0000</span>
                </li>
            </ul>
        </div>
        <div class="ft03">
            <ul>
                <li>
                    <span>FAX : 1500-0000</span>
                </li>
            </ul>
        </div>
        <div class="ft04">
            <ul>
                <li class="dropdown">
                    <a href="#" style="color: #fff; opacity: 0.7; font-size: 13px;">Admin</a>
                    <div class="dropdown-content">
                        <a href="partnerLogin.do">제작사</a>
                        <a href="adminLogin.do">관리자</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="bottom">
        <p>COPYRIGHT(C) SSANGYONG CENTER FOR THE PROGRAMING. ALL RIGHTS RESERVED</p>
    </div>
</footer>
</div> <!-- wrapper 끝 -->
</body>
</html>