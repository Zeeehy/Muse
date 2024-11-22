<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<style>
.right-section{
display:flex;
}
.right-section a{
width:100%;
text-align: center;
font-size:20px;
}
</style>
<body onload="onloadSession()">
	<div class="header">
		<div class="left-section">
			<input type="image" src="/muse/resources/img/museimage.png"
				class="header-image"
				onclick="window.location.href='partnerMainForm.do?pr_code=${s_pr_code}&u_id=${u_id }&getMusicalList=${getMusicalList }&isFutureDate=${isFutureDate }'">

		</div>
		<c:if test="${!empty pr_name }">
		
		<div class="right-section">
			<a>${pr_name}</a>|<a href="memberLogout.do">로그아웃</a>
			<input type="text" value="${s_pr_code}" name="pr_code">
			 <input type="hidden" value="${pr_code}" name="pr_code"> 
	</div>
	</c:if>
	<c:if test="${empty pr_name }">
		
		<div class="right-section">
			<a href="partnerLogin.do">로그인</a>
			<input type="text" value="${s_pr_code}" name="pr_code">
			<!-- <input type="hidden" value="${pr_code}" name="pr_code"> -->
	</div>
	</c:if>
	
	</div>
</body>
<script>
        var check = sessionStorage.getItem("check") || 0;

        function onloadSession(){
            var pr_code = "${s_pr_code}";
            var u_id = "${s_id}";
            var s_rs_code = "${s_rs_code}";
			var pr_name = '${pr_name}';
           // alert("pr_code:" + pr_code);
           // alert("u_id:" + u_id);
          //  alert("s_rs_code:" + s_rs_code); 

            // 로그인 상태 및 파트너 신청 상태 체크
             
            if (s_rs_code == "4") {
            	window.location.href = 'partnerAddForm.do?u_id='+u_id;
                return;
            } else if (s_rs_code == "2") {
                alert("파트너신청이 반려당했습니다. 관리자에게 문의하세요");
                window.location.href = 'index.do';
                return;
            } else if (s_rs_code == "0") {
                alert("파트너신청이 대기중입니다.");
                window.location.href = 'index.do';
                return;
            } else if (pr_code == "no"&&u_id!="") {
                alert("다시 로그인해주세요");
                window.location.href = 'memberLogout.do';
                return;
            }else if (pr_name == "" || pr_name == null) {
                alert("승인되지 않은 아이디입니다.");
                window.location.href = 'partnerLogin.do';
                return;
            }
            // rs_code가 1이고, 처음 접속 시에만 알림을 띄우기
            else if (s_rs_code == "1") {
                var check = sessionStorage.getItem("check") || 0;  // 새로고침 후에는 check 값 초기화
                if (check == 0) {
                    alert(u_id + " 님 환영합니다.");
                    sessionStorage.setItem("check", 1);  // check 값을 1로 설정하여 이후에는 알림이 뜨지 않도록 함
                    window.location.href = 'partnerAddForm.do?pr_code=' + pr_code;
                }
            }
        }
    </script>
</html>