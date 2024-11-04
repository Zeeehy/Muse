<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너 등록</title>
<link rel="stylesheet" href="/muse/partner/header.css">
<style>
/* 전체 레이아웃 설정 */
body {
    margin: 0;
    font-family: Arial, sans-serif;
}

/* 사이드바 스타일 */
.sidebar {
    width: 250px;
    background-color: #DFF0FF;
    color: #000000;
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    padding-top: 20px;
}

/* 사이드바 메뉴 및 드롭다운 버튼 스타일 */
.sidebar h3, .sidebar .dropdown-btn {
    display: block;
    color: #000000;
    padding: 15px;
    text-decoration: none;
    text-align: center;
    cursor: pointer;
    font-size: 18px;
}

.sidebar .dropdown-btn {
    border: none;
    background: none;
    width: 100%;
    outline: none;
}

.sidebar .dropdown-btn:hover {
    background-color: #B0DFFF;
}

/* 드롭다운 메뉴 컨테이너 */
.dropdown-container {
    display: none;
    background-color: #add9ff;
    padding-left: 10px;
}

.dropdown-container a {
    color: #000000;
    padding: 10px 15px;
    text-decoration: none;
    display: block;
    text-align: right;
}

.dropdown-container a:hover {
    background-color: #575757;
}

/* 메인 컨텐츠 스타일 */
.main-content {
    display: flex;
    flex-direction: column;
    margin-left: 250px;
    padding: 20px;
    align-items: center;
}

.main-content hr {
    height: 1px;
    width: 90%;
    background-color: green;
    border: none;
    margin: 20px auto;
}

.table-content {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.table-content table {
    border-collapse: collapse;
    width: 100%;
    max-width: 600px;
    margin: 10px 0;
}

.table-content th, .table-content td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

.table-content th {
    background-color: #f2f2f2;
    font-weight: bold;
}

.table-content td input {
    width: 95%;
    padding: 5px;
}

.table-content div {
    margin-top: 20px;
    display: flex;
    gap: 10px;
}

.table-content input[type="submit"], .table-content input[type="reset"] {
    padding: 8px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
}

.table-content input[type="reset"] {
    background-color: #f44336;
}

.table-content input[type="submit"]:hover, .table-content input[type="reset"]:hover {
    opacity: 0.8;
}
</style>
</head>
<body>

	<div class="header">
        Your Header
    </div>
  <div class="sidebar">
        <h3>파트너 등록 | 요청 현황</h3>
        
        <!-- 드롭다운 버튼과 하위 메뉴들 -->
        <button class="dropdown-btn">신규 등록
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">파트너 신청</a>
            <a href="#">사업자 등록</a>
        </div>
        
        <button class="dropdown-btn">뮤지컬 관리
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">공연 등록</a>
            <a href="#">공연 수정</a>
        </div>
        
        <button class="dropdown-btn">수정 요청
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">회원 정보 수정</a>
            <a href="#">비밀번호 변경</a>
        </div>
        
        <button class="dropdown-btn">판매 현황
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">티켓 판매</a>
            <a href="#">수익 현황</a>
        </div>
    </div>

    <!-- 메인 컨텐츠 영역 -->
    <form name="partnerAddForm.do" action="#">
    <div class="main-content">
        <h1>파트너 등록</h1>
        <hr>
        <div class="table-content">
            <h2>뮤즈 정보</h2>
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>이메일 주소</th>
                    <td><input type="text"></td>
                </tr>
            </table>
            <h2>파트너 정보</h2>
            <table>
                <tr>
                    <th>파트너 명</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>사업자 번호</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>사업자 명</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>대표자 이름</th>
                    <td><input type="text"></td>
                </tr>
            </table>
            <div>
                <input type="submit" value="신청">
                <input type="reset" value="취소">
            </div>
        </div>
    </div>
    </form>

<script>
// 드롭다운 버튼을 클릭하여 하위 메뉴를 표시/숨김
var dropdown = document.getElementsByClassName("dropdown-btn");
for (var i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}
</script>
</body>
</html>
