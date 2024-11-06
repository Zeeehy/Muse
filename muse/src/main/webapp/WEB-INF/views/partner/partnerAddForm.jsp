<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너 등록</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
</head>
<body>
	<%@include file="header.jsp" %>
  	<%@include file="sidebar.jsp" %>
    <!-- 메인 컨텐츠 영역 -->
    <form name="partnerAddForm.do" action="#">
    <div class="main-content">
    	<div class="main-contenttop">
        	<h1>파트너 등록</h1>
        	
        	<hr>
        </div>
        
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
            <div class="buttondiv">
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
