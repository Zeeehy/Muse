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
ul {list-style-type: none; padding: 0; width: 100%; display: flex; flex-direction: column; margin-bottom: 11px; margin-top: 50px;}
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
    // 이름 입력 필드에 이벤트 리스너 추가
    $("input[name='u_name']").on("input", function() {
        var uName = $(this).val();
        var nameRegex = /^(?:(?:[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z][aeiouAEIOU])+(?:[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z])*)$|^[가-힣]{2,}$/;
        var isValid = nameRegex.test(uName);
        
        if (!isValid) {
            $("li.find_ajax4 label").text("올바르지 않은 이름 형식입니다.")
                .css("color", "red");
            $("li.find_ajax4").show();
        } else {
            $("li.find_ajax4 label").text("올바른 이름 형식입니다.")
                .css("color", "blue");
            $("li.find_ajax4").show();
        }
    });

    // 이메일 입력 필드에 이벤트 리스너 추가
    $("input[name='u_email']").on("input", function() {
        var uEmail = $(this).val();		    
        var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var isValid = emailRegex.test(uEmail);

        if (!isValid) {
            $("li.find_ajax5 label").text("유효하지 않은 이메일 형식입니다.")
	        	.css("color", "red");
	        $("li.find_ajax5").show();
        } else {
            $("li.find_ajax5 label").text("유효한 이메일 형식입니다.")
	        	.css("color", "blue");
	        $("li.find_ajax5").show();
        }
    });

    // 인증번호 받기 버튼 클릭 시
    $("#get-auth-btn").click(function(event) {
        event.preventDefault(); // 폼 제출 방지

        var uName = $("input[name='u_name']").val().trim();
        var uEmail = $("input[name='u_email']").val().trim();
        var nameRegex = /^(?:(?:[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z][aeiouAEIOU])+(?:[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z])*)$|^[가-힣]{2,}$/;
        var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

        if (!nameRegex.test(uName) || !emailRegex.test(uEmail)) {
            alert("이름과 이메일을 올바르게 입력해주세요.");
            return;
        }

        // 서버로 AJAX 요청 보내기
        $.ajax({
            url: "pwdcheckNameAndEmail.do",  // 서버의 이름과 이메일을 확인하는 URL
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                u_name: uName,
                u_email: uEmail
            }),
            dataType: "json",
            success: function(response) {
                if (response.exists == 1) {
                    // 이메일이 일치하면, 인증번호 발송 페이지로 이동
                    $.ajax({
                        url: "find_email.do",  // 서버로 이메일을 보내는 URL
                        method: "POST",
                        contentType: "application/json",
                        data: JSON.stringify({
                            u_email: uEmail  // 이메일을 서버로 전송
                        }),
                        success: function() {
                            alert("인증번호가 발송되었습니다!");
                         	// 인증번호 입력창을 readonly로 설정
                            $("input[name='u_name']").prop("readonly", true);  // readonly 속성 추가
                            $("input[name='u_email']").prop("readonly", true);  // readonly 속성 추가
                            
                            // 인증번호 입력창 표시
                            $("#auth-number-container").show();
                            $("#get-auth-btn").hide();
                            $("#auth-btn").show();
                        },
                        error: function() {
                            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
                        }
                    });
                } else {
                    alert("해당 아이디의 이름과 이메일이 일치하지 않습니다.");
                }
            },
            error: function() {
                alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    });
    
 // 인증번호 입력 후 인증하기 버튼 클릭 시
    $("#auth-btn").click(function(event) {
        event.preventDefault(); // 폼 제출 방지

        var uEmailnumber = $("input[name='u_emailnumber']").val().trim();

        if (!uEmailnumber) {  // 인증번호가 입력되지 않았을 경우
            alert("인증번호를 입력해주세요.");
            return;
        }

        // 인증번호 비교를 위한 서버로 요청 보내기
        $.ajax({
            url: "findPwd_emailcheck.do",  // 인증번호 비교를 위한 URL
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({ u_emailnumber: uEmailnumber }),  // 입력된 인증번호
            success: function(response) {
                if (response.exists == 1) {
                    alert("인증 성공!");
                    window.location.href = "/muse/pwdReset.do";  // 비밀번호 재설정 페이지로 이동
                } else {
                    alert("인증번호가 틀렸습니다.");
                }
            },
            error: function() {
                alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    });
    
    
});
</script>
<script>
// 페이지를 벗어날 때 세션에서 pwdfind_s_id 값 제거
window.onbeforeunload = function() {
    // 세션에서 pwdfind_s_id 제거하는 Ajax 요청
    $.ajax({
        url: "/removeFindPwdSession.do", // 세션에서 find_s_id를 제거하는 URL
        method: "POST",
        contentType: "application/json",
        dataType: "json",
        success: function(response) {
            console.log("세션에서 pwdfind_s_id 제거 성공");
        },
        error: function() {
            console.error("세션에서 pwdfind_s_id 제거 실패");
        }
    });
};
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
				 
				 	  <!-- 이메일 인증 Form -->
				 	  <form action="" method="">  
	                  <article id="find_id_article">
	                     <ul>	                     
	                     <li class="find_input-container" style="margin-top:30px;">
	                     	<img src="/muse/resources/img/member/name.png">
	                     	<label>이름</label>
	                        <input class="padding_label0" type="text" name="u_name" placeholder="[예시] 홍길동">
	                     </li>
	                     <li class="find_ajax4"><label></label></li> 
	                     
	                     <li class="find_input-container"  style="margin-top:30px;">
	                     	<img src="/muse/resources/img/member/email.png">
	                     	<label>이메일</label>
	                        <input class="padding_label1" type="text" name="u_email" placeholder="[예시] hello@naver.com">
	                     </li>
	                     <li class="find_ajax5"><label></label></li> 
	                     
	                     <li class="find_input-container"  style="margin-top:30px; display: none;" id="auth-number-container">
						    <img src="/muse/resources/img/member/email.png">
						    <label>인증번호</label>
						    <input class="padding_label2" type="text" name="u_emailnumber">
						</li>
						<li class="find_ajax00"><label></label></li> 
						<li class="find_input-container-btn">
						    <!-- 인증번호 받기 버튼 초기 상태로 보여짐 -->
						    <input class="find_btn" type="button" value="인증번호 받기" id="get-auth-btn">         
						</li>
						<li class="find_input-container-btn">
						    <!-- 인증하기 버튼, 처음에는 숨겨짐 -->
						    <input class="find_btn" type="button" value="인증하기" id="auth-btn" style="display: none;">         
						</li>
	                    </ul>
	                  </article>
	                  </form>  
	                  <!-- 아이디 찾기 Form -->   
	           
		</div>
	</div>	
</body>
</html>