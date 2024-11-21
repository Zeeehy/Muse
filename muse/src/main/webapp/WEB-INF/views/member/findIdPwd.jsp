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
    // 기본적으로 아이디 찾기 폼을 활성화
    if (!$("#find_id").hasClass("active") && !$("#find_pwd").hasClass("active")) {
        $("#find_id").addClass("active");
        $("#find_id_article").css("display", "block");  // Display 아이디 찾기 폼
        $("#find_pwd_article").css("display", "none");  // Hide 비밀번호 찾기 폼
    }

    // 아이디 찾기 클릭 시
    $("#find_id").click(function(event) {
        event.preventDefault(); // 기본 동작 방지 (페이지 리로드 방지)
        $("#find_pwd").removeClass("active"); // 비밀번호 찾기 탭에서 active 제거
        $(this).addClass("active"); // 아이디 찾기 탭에 active 추가
        $("#find_id_article").css("display", "block");  // Display 아이디 찾기 폼
        $("#find_pwd_article").css("display", "none");  // Hide 비밀번호 찾기 폼
        $("#find_id_article input[type='text']").val(''); // 아이디 찾기 폼 초기화
        $("li.find_ajax4").hide(); // 오류 메시지 숨기기
        $("li.find_ajax5").hide(); // 오류 메시지 숨기기
    });

    // 비밀번호 찾기 클릭 시
    $("#find_pwd").click(function(event) {
        event.preventDefault(); // 기본 동작 방지 (페이지 리로드 방지)
        $("#find_id").removeClass("active"); // 아이디 찾기 탭에서 active 제거
        $(this).addClass("active"); // 비밀번호 찾기 탭에 active 추가
        $("#find_id_article").css("display", "none"); // Hide 아이디 찾기 폼
        $("#find_pwd_article").css("display", "block"); // Show 비밀번호 찾기 폼
        $("#find_pwd_article input[type='text']").val(''); // 비밀번호 찾기 폼 초기화
        $("li.find_ajax1").hide(); // 오류 메시지 숨기기
    });

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

        // `active` 클래스가 있는 폼만 유효성 검사 진행
        if ($("#find_pwd").hasClass("active") && formId === "find_pwd_article") {
            // 비밀번호 찾기 폼 유효성 검사
            var uId = $("input[name='u_id']").val().trim();
            var idRegex = /^(?=(.*[a-zA-Z]){4,})(?=(.*\d){2,})[a-zA-Z\d]{6,15}$/;
            if (uId === "") {
                missingFields.push("아이디");
                isValid = false;
            } else if (!idRegex.test(uId)) {
                errorMessages += "아이디는 6~15자로, 영문 4자 이상, 숫자 2개 이상이 포함되어야 합니다.\n";
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
		<div class="find_title">
			<span>계정 찾기</span>
		</div>
	</div>
	
	<div>
		<div class="find_div2">			
				   
					<div class="find_sub_title">
						<div class="find_id" id="find_id"><a href="">아이디 찾기</a></div>
						<div class="find_pwd" id="find_pwd"><a href="">비밀번호 찾기</a></div>
					</div>
				 
				 	  <!-- 아이디 찾기 Form -->
				 	  <form action="" method="post">  
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
	                  
	                  <!-- 비밀번호 찾기 Form -->	 
	                  <form action="findPwd_idcheck.do" method="post">         
	                  <article id="find_pwd_article" style="display: none;">
	                    <ul>
	                    	<li class="find-pwd-msg">아이디 확인 후 <br>비밀번호를 재설정 할 수 있어요</li>
	                        <li class="find_input-container">
		                     	<img src="/muse/resources/img/member/id.png">
		                     	<label>아이디</label>
		                        <input class="padding_label1" type="text" name="u_id" placeholder="6~15자 영문, 숫자">
		                     </li>
		                     <li class="find_ajax1"><label></label></li>
	                        <li class="find_input-container-btn">
	                            <input class="find_btn" type="submit" value="아이디 확인">
	                        </li>
	                    </ul>
	                </article>
	                </form>   
	                <!-- 비밀번호 찾기 Form -->
	                  
	           
		</div>
	</div>	
</body>
</html>