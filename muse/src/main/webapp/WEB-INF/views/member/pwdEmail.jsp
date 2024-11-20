<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href= '/muse/resources/css/Yel.css' rel='stylesheet' type='text/css'>
<title>FindID&Pwd</title>
<style>
ul {list-style-type: none; padding: 0; width: 100%; display: flex; flex-direction: column; margin-bottom: 11px;}
.find_input-container{display: flex; align-items: center; justify-content: center; font-family:'Pretendard-Regular', sans-serif; margin-top: 20px; margin-bottom:3px; width: 420px;}
.padding_label3 {width: 100%; max-width: 250px; height:50px; flex-grow: 1; font-size: 16px; padding: 7px; border: none; border-radius:10px; box-sizing: border-box; background-color:rgb(52 83 112 / 0%);}
.padding_label2 {width: 100%; max-width: 280px; height:50px; flex-grow: 1; font-size: 16px; padding: 7px; border: none; border-radius:10px; box-sizing: border-box; background-color:rgb(52 83 112 / 0%);}
.padding_label1 {width: 100%; max-width: 300px; height:50px; flex-grow: 1; font-size: 16px; padding: 7px; border: none; border-radius:10px; box-sizing: border-box; background-color:rgb(52 83 112 / 0%);}
.padding_label0{width: 100%; max-width: 310px; height:50px; flex-grow: 1; font-size: 16px; padding: 7px; border: none;  border-radius:10px; box-sizing: border-box; background-color:rgb(52 83 112 / 0%);}
ul li input[type="text"]:focus, ul li input[type="password"]:focus{outline: none; }
ul li input[type="text"]::placeholder, ul li input[type="password"]::placeholder {font-size:15px; font-family: 'Pretendard'; color: #a0a0a0; opacity: 1; }   
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    // 폼 제출 이벤트
    $("form").on("submit", function(event) {
        var isValid = true; // 유효성 검사 상태
        var missingFields = []; // 비어있는 필드를 저장할 배열
        var errorMessages = ""; // 오류 메시지를 저장할 변수
        var formId = $(this).attr("id"); // 현재 제출되는 폼의 ID를 확인 (아이디 찾기 폼 또는 비밀번호 찾기 폼)

        // `active` 클래스가 있는 폼만 유효성 검사 진행
        if ($("#find_id").hasClass("active") && formId === "find_id_article") {
            // 아이디 찾기 폼 유효성 검사
            var uName = $("input[name='u_name']").val().trim();
            var nameRegex = /^(?:(?:[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z][aeiouAEIOU])+(?:[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z])*)$|^[가-힣]{2,}$/;
            if (uName === "") {
                missingFields.push("이름");
                isValid = false;
            } else if (!nameRegex.test(uName)) {
                errorMessages += "이름은 2자 이상 한글 또는 영문이 포함되어야 합니다.\n";
                isValid = false;
            }

            var uEmail = $("input[name='u_email']").val().trim();
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (uEmail === "") {
                missingFields.push("이메일");
                isValid = false;
            } else if (!emailRegex.test(uEmail)) {
                errorMessages += "유효하지 않은 이메일 형식입니다.\n";
                isValid = false;
            }
        }

        // 오류 메시지 출력
        if (!isValid) {
            // 비어있는 필드가 있다면 표시
            if (missingFields.length > 0) {
                alert(missingFields.join(", ") + "란을 입력해주세요.");
            }
            // 유효성 검사 실패한 필드에 대해 추가적인 오류 메시지 표시
            if (errorMessages) {
                alert(errorMessages);
            }
            event.preventDefault(); // 폼 제출 방지
        }
    });
});

</script>
</head>
<body>
	<div class="find_div1">
		<div class="find_logo">
			 <a href="index.do"><img class="find_logoimg" alt=""  src="/muse/resources/img/member/logo.png"></a>
		</div>
		<div class="find_title_pwd_email">
			<span>이메일 인증</span>
		</div>
	</div>
	
	<div>
		<div class="find_div2">			
				 
				 	  <!-- 아이디 찾기 Form -->
				 	  <form action="findPwd_emailcheck.do" method="post">  
	                  <article id="find_id_article">
	                     <ul>	                     
	                     <li class="find_input-container">
	                     	<img src="/muse/resources/img/member/name.png">
	                     	<label>이름</label>
	                        <input class="padding_label0" type="text" name="u_name" placeholder="[예시] 홍길동">
	                     </li>
	                     <li class="find_ajax4"><label></label></li> 
	                     
	                     <li class="find_input-container">
	                     	<img src="/muse/resources/img/member/email.png">
	                     	<label>이메일</label>
	                        <input class="padding_label1" type="text" name="u_email" placeholder="[예시] hello@naver.com">
	                     </li>
	                     <li class="find_ajax5"><label></label></li> 	                     	          
	                     <li class="find_input-container-btn">  
	                     	<input class="find_btn" type="submit" value="인증번호 받기">         
	                     </li>
	                     </ul>
	                  </article>
	                  </form>  
	                  <!-- 아이디 찾기 Form -->   
	           
		</div>
	</div>	
</body>
</html>