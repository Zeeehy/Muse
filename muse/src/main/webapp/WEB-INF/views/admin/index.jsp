<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>

body {
  font-family: "Lato", sans-serif;
}

/* Fixed sidenav, full height */
.sidenav {
/*   height: 100%; */
  width: 300px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #DFF0FF;
  overflow-x: hidden;
  padding-top: 20px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 30px;
  color: #000000;;
  display: block;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
  color: #868A8D;
}

/* Main content */
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  font-size: 20px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

/* Add an active class to the active dropdown button */
.active {
  background-color: #80bfff;
  color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
  display: none;
  background-color: #add9ff;
  padding-left: 8px;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
  float: right;
  padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

</style>


</head>
<body>



<div class="sidenav">

  <button class="dropdown-btn"><i class="fa-solid fa-music"></i>&nbsp;&nbsp;공연관리
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">공연 등록 승인</a>
    <a href="#">오픈공지 승인</a>
    <a href="#">연장신청 승인</a>
  </div> 
    
  <button class="dropdown-btn"><i class="fa-solid fa-circle-arrow-up"></i>&nbsp;&nbsp;반영
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">공연 등록 반영</a>
    <a href="#">공연수정반영</a>
    <a href="#">오픈공지 반영</a>
    <a href="#">연장신청반영</a>
    <a href="#">배너등록</a>
  </div>  


  <button class="dropdown-btn"><i class="fa-solid fa-pen-nib"></i>&nbsp;&nbsp;리뷰
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">불량 리뷰 관리</a>
    <a href="#">파트너 리뷰 관리</a>
    <a href="#">파트너 QnA 관리</a>
  </div>
  
  <button class="dropdown-btn"><i class="fa-solid fa-chart-pie"></i>&nbsp;&nbsp;통계
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">일반 / 회원 멤버쉽 통계</a>
    <a href="#">회원증가량</a>
    <a href="#">공연 랭킹</a>
    <a href="#">파트너 랭킹</a>
  </div>
  <a href="#contact"> <i class="fa fa-fw fa-user"></i>&nbsp;&nbsp;제작사 회원</a>
</div>




</body>

<script>
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
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


</html>