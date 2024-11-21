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
      
		// 비밀번호 유효성 검사
	    var uPwd = $("input[name='u_pwd']").val().trim();
	    var passwordRegex = /^(?=(.*[a-zA-Z]))(?=(.*\d))(?=(.*[\W_]))[a-zA-Z\d\W_]{8,12}$/;
	    if (uPwd === "") {
	        missingFields.push("비밀번호");
	        isValid = false;
	    } else if (!passwordRegex.test(uPwd)) {
	        errorMessages += "비밀번호는 8~12자, 영문, 숫자, 특수문자를 각각 1개 이상 포함해야 합니다.\n";
	        isValid = false;
	    }
	
	    // 비밀번호 확인 유효성 검사
	    var uPwd2 = $("input[name='u_pwd2']").val().trim();
	    if (uPwd2 === "") {
	        missingFields.push("비밀번호 확인");
	        isValid = false;
	    } else if (uPwd !== uPwd2) {
	        errorMessages += "비밀번호가 일치하지 않습니다!\n";
	        isValid = false;
	    }

	 	// 7. 폼 제출 이벤트
		$("form").on("submit", function(event) {
		    var isValid = true; // 유효성 검사 상태
		    var missingFields = []; // 비어있는 필드를 저장할 배열
		    var errorMessages = ""; // 오류 메시지를 저장할 변수		   	

		    // 비밀번호 유효성 검사
		    var uPwd = $("input[name='u_pwd']").val().trim();
		    var passwordRegex = /^(?=(.*[a-zA-Z]))(?=(.*\d))(?=(.*[\W_]))[a-zA-Z\d\W_]{8,12}$/;
		    if (uPwd === "") {
		        missingFields.push("비밀번호");
		        isValid = false;
		    } else if (!passwordRegex.test(uPwd)) {
		        errorMessages += "비밀번호는 8~12자, 영문, 숫자, 특수문자를 각각 1개 이상 포함해야 합니다.\n";
		        isValid = false;
		    }

		    // 비밀번호 확인 유효성 검사
		    var uPwd2 = $("input[name='u_pwd2']").val().trim();
		    if (uPwd2 === "") {
		        missingFields.push("비밀번호 확인");
		        isValid = false;
		    } else if (uPwd !== uPwd2) {
		        errorMessages += "비밀번호가 일치하지 않습니다!\n";
		        isValid = false;
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
		<div class="find_title_pwd_reset">
			<span>비밀번호 재설정</span>
		</div>
	</div>
	
	<div>
		<div class="find_div2">					 	                  
	                  <!-- 비밀번호 재설정 Form -->	 
	                  <form action="findPwd_idcheck" method="post">         
	                  <article id="find_pwd_article">
	                    <ul>
	                    	<li class="find_input-container">
	                        <img src="/muse/resources/img/member/pwd.png">
	                        <label>비밀번호</label>
	                        <input class="padding_label2" type="password" name="u_pwd" placeholder="8~12자 영문, 숫자, 특수문자">	                       
	                      </li>     
	                      <li class="find_ajax2"><label></label></li>   
	                       
	                      <li class="find_input-container">
	                     	<img src="/muse/resources/img/member/pwd.png">
	                     	<label>비밀번호 확인</label>
	                        <input class="padding_label3" type="password" name="u_pwd2" placeholder="8~12자 영문, 숫자, 특수문자">
	                     </li>
	                     <li class="find_ajax3"><label></label></li> 

	                        <li class="find_input-container-btn">
	                            <input class="find_btn" type="submit" value="비밀번호 설정">
	                        </li>
	                    </ul>
	                </article>
	                </form>   
	                <!-- 비밀번호 찾기 Form -->
	                  
	           
		</div>
	</div>	
</body>
</html>