<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body onload="onloadSession()" >
	<div class="header">
	<div class="left-section">
        <input type="image" src="/muse/resources/img/museimage.png" class="header-image" onclick="window.location.href='partnerMainForm.do?pr_code=${s_pr_code}'">
         <select>
         	<option selected>기획사</option>
         	<option>2</option>
         	<option>3</option>
         </select>
         <p>를 선택해주세요</p>
         </div>
          <div class="right-section">
         	<a>${sessionScope.pr_name}</a>|<a href="memberLogout.do">로그아웃</a>
         	<input type="text" value="${s_pr_code}" name="pr_code">
         	<!-- <input type="hidden" value="${pr_code}" name="pr_code"> -->
          </div>
    </div>
</body>
<script>

var check = sessionStorage.getItem("check") || 0;

 function onloadSession(){

	var pr_code= "${s_pr_code}";
	var u_id = "${s_id}";
	var s_rs_code = "${s_rs_code}";
	
	/* alert("pr_code:"+pr_code);
	alert("u_id:"+u_id);
	alert("s_rs_code:"+s_rs_code); */
	
	//pr_code 파트너신청을 했을 때, 아예 안했을 떄 >>
	
	if(u_id==""||u_id==null){
		alert("뮤즈 로그인을 해주세요");
		window.location.href='memberLogin.do';
		return;
	}else if(pr_code=="no"){
		alert("파트너 등록을 먼저 해주세요");
		window.location.href='partnerAddForm.do?u_id='+u_id+"&pr_code="+pr_code;
		return;
	}else if(s_rs_code=="2"){
		alert("파트너신청이 반려당했습니다. 관리자에게 문의하세요");
		window.location.href='index.do';
		return;
	}else if(s_rs_code=="0"){
		alert("파트너신청이 대기중입니다.");
		window.location.href='index.do';
		return;
	}else if(s_rs_code=="1" && check==0){
		check++;
		console.log(check);
		sessionStorage.setItem("check", check);

		console.log(check+"@@@@@@@@@@@@@@@@@@@");
		alert(u_id+" 님 환영합니다.");
		window.location.href='partnerAddForm.do?pr_code='+pr_code;
	}
	
} 
</script>
</html>