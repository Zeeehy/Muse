<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="sidebar">
        
        <!-- 드롭다운 버튼과 하위 메뉴들 -->
        <button class="dropdown-btn">공연관리
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">공연 등록 승인</a>
    		<a href="#">오픈공지 승인</a>
    		<a href="#">연장신청 승인</a>
        </div>
        
        <button class="dropdown-btn">반영
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">공연 등록 반영</a>
		    <a href="#">공연수정반영</a>
		    <a href="#">오픈공지 반영</a>
		    <a href="#">연장신청반영</a>
		    <a href="bannerList.do">배너등록</a>
        </div>
        
        <button class="dropdown-btn">리뷰
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">불량 리뷰 관리</a>
		    <a href="#">파트너 리뷰 관리</a>
		    <a href="#">파트너 QnA 관리</a>
        </div>
        
        <button class="dropdown-btn">통계
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">일반 / 회원 멤버쉽 통계</a>
		    <a href="#">회원증가량</a>
		    <a href="#">공연 랭킹</a>
		    <a href="#">파트너 랭킹</a>
        </div>
        
        <button class="dropdown-btn">제작사 회원
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">제작사 회원 승인</a>
        </div>
    </div>
</body>


<script>
// 드롭다운 버튼을 클릭하여 하위 메뉴를 표시/숨김
var dropdown = document.getElementsByClassName("dropdown-btn");
for (var i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    // 현재 클릭된 드롭다운의 하위 메뉴 표시/숨김 처리
    var dropdownContent = this.nextElementSibling;
    //var isAlreadyOpen = dropdownContent.style.display === "block";
    var isAlreadyOpen = dropdownContent.classList.contains("show");
    
    
    // 모든 드롭다운 메뉴를 닫기
    closeAllDropdowns();

    // 현재 클릭된 드롭다운이 열려 있지 않았다면, 열기
    if (!isAlreadyOpen) {
      //dropdownContent.style.display = "block";
      dropdownContent.classList.add("show"); // 애니메이션을 위한 클래스 추가
      
      this.classList.add("active"); // 활성화 클래스 추가
      this.style.backgroundColor = "#2196F3"; // 현재 열려 있는 드롭다운 버튼 색상 변경
    }
  });
}

// 모든 드롭다운 메뉴를 닫는 함수
function closeAllDropdowns() {
  for (var j = 0; j < dropdown.length; j++) {
    //dropdown[j].nextElementSibling.style.display = "none";
    dropdown[j].nextElementSibling.classList.remove("show");
    
    dropdown[j].classList.remove("active");
    dropdown[j].style.backgroundColor = ""; // 버튼 색상 초기화
  }
}
</script>
</html>