<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
   <div class="sidebar">
    <div class="sidebartop">
      <a href="#">파트너 등록</a> | 
      <span class="popup-container" style="position: relative;"> <!-- 팝업 위치를 상대적으로 설정 -->
        <a href="#" onclick="showPopup()">요청 현황</a>
        <!-- 레이어 팝업 -->
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
      </span>
    </div>
    

    <!-- 드롭다운 버튼과 하위 메뉴들 -->
    <button class="dropdown-btn">
      신규 등록 <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a href="#">파트너 신청</a>
      <a href="#">사업자 등록</a>
    </div>

    <button class="dropdown-btn">
      뮤지컬 관리 <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a href="#">공연 등록</a>
      <a href="#">공연 수정</a>
    </div>

    <button class="dropdown-btn">
      수정 요청 <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a href="#">회원 정보 수정</a>
      <a href="#">비밀번호 변경</a>
    </div>

    <button class="dropdown-btn">
      판매 현황 <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a href="#">티켓 판매</a>
      <a href="#">수익 현황</a>
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
</script>
</html>
