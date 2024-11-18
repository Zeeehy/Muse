<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* Sidebar */
.sidebar {
    width: 250px;
    background-color: #DFF0FF;
    color: #000;
    position: fixed;
    top: 60px; /* Below header */
    left: 0;
    height: calc(100% - 60px);
    padding-top: 20px;
}

/* 공통 스타일 */
.sidebar a, .dropdown-btn {
    padding: 10px;
    text-decoration: none;
    font-size: 18px;
    color: #000;
    display: block;
    text-align: center;
}

.sidebar a:hover, .dropdown-btn:hover {
    background-color: #BFD9E0;
    color:white;
}

.sidebar .dropdown-btn:hover {
    background-color: #B0DFFF;
}

/* 드롭다운 버튼 */
.sidebar .dropdown-btn {
    border: none;
    background: none;
    width: 100%;
    outline: none;
    transition: background-color 0.3s; /* 배경색 전환 효과 */
}

.dropdown-container.show {
  display: block; /* 블록으로 표시 */
  opacity: 1; /* 완전한 불투명도 */
  max-height: 300px; /* 최대 높이 설정 (필요에 따라 조정) */
}

.dropdown-btn.active {
  color: white; /* 텍스트 색상 변경 */
}

/* 드롭다운 메뉴 컨테이너 */
.dropdown-container {
    display: none;
    background-color: #add9ff;
    padding-left: 10px;
    opacity: 0; /* 초기 투명도 설정 */
    transition: opacity 0.3s ease; /* 부드러운 전환 효과 */
    max-height: 0; /* 초기 높이 설정 */
    overflow: hidden; /* 내용이 넘칠 경우 숨김 */
}

.dropdown-container a {
    color: #000000;
    padding: 10px 15px;
    text-decoration: none;
    display: block;
    text-align: center;
}

.dropdown-container a:hover {
    background-color: #add9ff;
    color: white;
}

</style>

</head>
<body>

<div class="sidebar">
        
        <!-- 드롭다운 버튼과 하위 메뉴들 -->
        <button class="dropdown-btn">공연관리
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="addRequestList.do">공연 등록 승인</a>
    		<a href="openRequestList.do">오픈공지 승인</a>
    		<a href="#">연장신청 승인</a>
        </div>
        
        <button class="dropdown-btn">반영
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="addApplyList.do">공연 등록 반영</a>
		    <a href="#">공연수정반영</a>
		    <a href="openApplyList.do">오픈공지 반영</a>
		    <a href="#">연장신청반영</a>
		    <a href="bannerList.do">배너등록</a>
        </div>
        
        <button class="dropdown-btn">리뷰
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="adminReviewList.do">불량 리뷰 관리</a>
		    <a href="pReviewList.do">파트너 리뷰 관리</a>
		    <a href="pQnAList.do">파트너 QnA 관리</a>
        </div>
        
        <button class="dropdown-btn">통계
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="musePassStats.do">일반 / 회원 멤버쉽 통계</a>
		    <a href="memberStats.do">회원증가량</a>
		    <a href="#">공연 랭킹</a>
		    <a href="#">파트너 랭킹</a>
        </div>
        
        <button class="dropdown-btn">제작사 회원
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="partnerRequestList.do">제작사 회원 승인</a>
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