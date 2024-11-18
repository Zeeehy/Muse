<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너 등록</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
</head>
<style>

</style>
<body>
<!-- 세션 있을떄 -->
<c:if test="${s_pr_code == 'no' || s_pr_code == null}">
    <div class="header">
        <div class="left-section">
            <input type="image" src="/muse/resources/img/museimage.png" class="header-image" onclick="window.location.href='partnerMainForm.do';">
            
        </div>
    </div>
    <div class="sidebar">
        <div class="sidebartop">
            <a href="partnerAddForm.do">파트너 등록</a> | 
            <span class="popup-container" style="position: relative;">
                <a href="#" onclick="showPopup()">요청 현황</a>
                <div id="popup" class="popup">
                    <div class="popupWrap">
                        <button class="close-btn" onclick="closePopup()">X</button>
                        <table>
                        	<tr><td>
                        		<a>${msg }</a>
                        	</td><tr>
                        </table>
                    </div>
                </div>
            </span>
        </div>
    </div>
    <form name="partnerAddForm" action="partnerInsert.do">
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
                        <td><input type="text" required name="u_id" value="${dto.u_id} }"></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" required value="${dto.pr_name}"></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><input type="text" required value="${dto.p_pnum}"></td>
                    </tr>
                    <tr>
                        <th>이메일 주소</th>
                        <td><input type="text" required value="${dto.pr_ }"></td>
                    </tr>
                </table>
                <h2>파트너 정보</h2>
                <table>
                    <tr>
                        <th>파트너 명</th>
                        <td><input type="text" required name="pr_name"></td>
                    </tr>
                    <tr>
                        <th>사업자 번호</th>
                        <td><input type="text" required name="pr_num"></td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td><input type="text" required name="pr_pnum"></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><input type="text" required name="pr_email"></td>
                    </tr>
                </table>
                <div class="buttondiv">
                    <input type="submit" value="신청">
                    <input type="reset" value="취소">
                </div>
            </div>
        </div>
    </form>
</c:if>

<!-- 승인 되었을떄 -->
<c:if test="${s_pr_code != 'no' && s_pr_code != null}">
    <!-- s_pr_code가 'no'가 아니고 null도 아닐 때 실행되는 블록 -->
    <jsp:include page="header.jsp" />
    <jsp:include page="sidebar.jsp" />
</c:if>


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
