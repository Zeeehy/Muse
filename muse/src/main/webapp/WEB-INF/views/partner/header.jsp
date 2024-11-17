<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body><!--  onload="onloadSession()" -->
	<div class="header">
	<div class="left-section">
        <input type="image" src="/muse/resources/img/museimage.png" class="header-image" onclick="window.location.href='partnerMainForm.do?pr_code='${s_pr_code};">
         <select>
         	<option selected>기획사</option>
         	<option>2</option>
         	<option>3</option>
         </select>
         <p>를 선택해주세요</p>
         </div>
          <div class="right-section">
         	<a>박형주님</a>|<a>로그아웃</a>
         	<input type="text" value="${s_pr_code}" name="pr_code">
         	<!-- <input type="hidden" value="${pr_code}" name="pr_code"> -->
          </div>
    </div>
</body>
<script>

/* function onloadSession(){
	var pr_code= "${s_pr_code}";
	var u_id = "${u_id}";
	
	if(pr_code=="no"||pr_code==null||pr_code==""){
		alert("파트너 등록 먼저 해주세요");
		window.location.href='partnerAddForm.do?u_id='+u_id+"&pr_code="+pr_code;
		}
} */
</script>
</html>