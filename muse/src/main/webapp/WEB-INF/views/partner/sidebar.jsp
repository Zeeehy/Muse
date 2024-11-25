<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<body>
   <div class="sidebar">
    <div class="sidebartop">
      <a href='partnerMainForm.do?pr_code=${s_pr_code}&u_id=${u_id }&getMusicalList=${getMusicalList }'>메인</a><a> | </a>
      <span class="popup-container" style="position: relative;"> <!-- 팝업 위치를 상대적으로 설정 -->
        <a href="#" onclick="showPopup()">요청 현황</a>
        <!-- 레이어 팝업 -->
        </span>
        <div id="popup" class="popup">
          		<div class="popupWrap">
          		<button class="close-btn" onclick="closePopup()">X</button>
          		<table>
          			<tr>
          				<th colspan="2">요청 현황</th>
          			</tr>
          			<tr>
          				<th>뮤지컬 등록 요청</th>
          				<th>상품 등록 관리</th>
          			</tr>
          			<tr>
          				<td>뮤지컬 신규 등록(0)</td>
          				<td>오픈 공지 등록(0)</td>
          			</tr>
          			<tr>
          				<td></td>
          				<td>수정 요청(0)</td>
          			</tr>
          			<tr>
          				<td></td>
          				<td>연장 요청(0)</td>
          			</tr>
          			<tr>
          				<td></td>
          				<td>캐스팅 관리(0)</td>
          			</tr>
          			<tr>
          				<td></td>
          				<td>티켓 오픈 공지(0)</td>
          			</tr>
          			<tr>
          				<td></td>
          				<td>커뮤니티(0)</td>
          			</tr>
          		</table>
          		</div>
        </div>
    </div>
    

    <!-- 드롭다운 버튼과 하위 메뉴들 -->
    <button class="dropdown-btn">
      신규 등록
    </button>
    <div class="dropdown-container">
      <a href="musicalOpenForm.do?pr_code=${s_pr_code}">뮤지컬 등록 요청</a>
      <a href="ticetOpenForm.do?pr_code=${s_pr_code}">티켓 오픈 공지 등록 요청</a>
    </div>

    <button class="dropdown-btn">
      뮤지컬 관리
    </button>
    <div class="dropdown-container">
      <a href="musicalSeatAddForm.do">시트 등록</a>
      <a href="castAddForm.do">캐스팅 등록</a>
      <a href="reviewDeleteForm.do?pr_code=${s_pr_code }">리뷰 관리</a>
    </div>

    <button class="dropdown-btn">
      수정 요청
    </button>
    <div class="dropdown-container">
   	  <a href="musicalUpdate.do">뮤지컬 등록 수정</a>
      
    </div>

    
  </div>
</body>
<script>
  function showPopup() {
    document.getElementById("popup").style.display = "flex"; // 팝업 보이기
  }

  function closePopup() {
    document.getElementById("popup").style.display = "none"; // 팝업 숨기기
  }
//드롭다운 버튼을 클릭하여 하위 메뉴를 표시/숨김
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
</html>