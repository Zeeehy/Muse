<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너 등록</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css" type="text/css">

<style>
/* 개인 레이아웃 */
.main-content {
    display: flex;
    flex-direction: column;
    margin-left: 250px;
    margin-top: 60px;
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
	<%@include file="header.jsp" %>
  	<%@include file="sidebar.jsp" %>
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
                    <td><input type="text" required></td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text" required></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="text" required></td>
                </tr>
                <tr>
                    <th>이메일 주소</th>
                    <td><input type="text" required></td>
                </tr>
            </table>
            <h2>파트너 정보</h2>
            <table>
                <tr>
                    <th>파트너 명</th>
                    <td><input type="text" required></td>
                </tr>
                <tr>
                    <th>사업자 번호</th>
                    <td><input type="text" required></td>
                </tr>
                <tr>
                    <th>사업자 명</th>
                    <td><input type="text" required></td>
                </tr>
                <tr>
                    <th>대표자 이름</th>
                    <td><input type="text" required></td>
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
