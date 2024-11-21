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
      
	 // 2. 비밀번호 입력 필드에 이벤트 리스너 추가
    $("input[name='u_pwd']").on("input", function() {
        var uPwd = $(this).val();
    	// 정규식을 통해 비밀번호가 형식에 맞는지 체크 (영문자, 숫자, 특수문자를 각각 최소 1개씩 포함, 전체 길이 8~12자)
        var passwordRegex = /^(?=(.*[a-zA-Z]))(?=(.*\d))(?=(.*[\W_]))[a-zA-Z\d\W_]{8,12}$/;
        // ^: 문자열의 시작, $: 문자열의 끝, (?= ... ): 해당 조건이 일치하는지 확인, 
        // .*: 0개 이상의 문자 (뒤에나오는 문자가 하나라도 나오기 전에 어떤 문자가 와도 괜찮다),
        // [a-zA-Z]: 영어 알파벳이 하나 이상, \d: 숫자(0-9) 1개, \W: 특수문자, _: 밑줄을 특수문자로 취급,
        // [a-zA-Z\d\W_]: 알파벳, 숫자, 특수문자 집합
        var isValid = passwordRegex.test(uPwd);  

        // 형식이 맞는지 검사 후
        if (!isValid) {
            $("li.find_ajax2 label").text("비밀번호는 8~12자, 영문, 숫자, 특수문자를 각각 1개 이상 포함해야 합니다.")
            	.css("color", "orange");
            $("li.find_ajax2").show();
            return;
        }
        
        // 비밀번호 확인란을 검사 (비밀번호가 유효하면 비교 시작)
        var uPwd2 = $("input[name='u_pwd2']").val();
        if (uPwd2) { // 비밀번호 확인란이 비어 있지 않다면 비교
            if (uPwd !== uPwd2) {
                $("li.find_ajax3 label").text("비밀번호가 일치하지 않습니다!").css("color", "red");
                $("li.find_ajax3").show();
            } else {
                $("li.find_ajax3 label").text("비밀번호가 일치합니다.").css("color", "blue");
                $("li.find_ajax3").show();
       		}   
        }
        
        // 형식이 맞으면 Ajax로 서버에 비밀번호 중복 검사를 요청
        $.ajax({
            url: "checkPwdDuplicate.do",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({ u_pwd: uPwd }),  // JSON 형식으로 비밀번호 전송
            dataType: "json",
            success: function(response) {
                if (response.exists == 1) {
                    $("li.find_ajax2 label").text("비밀번호 형식이 올바르지 않습니다.")
                        .css("color", "red");
                } else if (response.exists == 0) {
                    $("li.find_ajax2 label").text("사용 가능한 비밀번호입니다.")
                        .css("color", "blue");
                } else {
                    $("li.find_ajax2 label").text("비밀번호 검사 중 오류가 발생했습니다.")
                        .css("color", "black");
                }
                $("li.find_ajax2").show();
            },
            error: function(xhr, status, error) {
                console.log("AJAX 요청 실패:", status, error);
                $("li.find_ajax2 label").text("비밀번호 검사 중 오류가 발생했습니다.")
                    .css("color", "black");
                $("li.find_ajax2").show();
            }
        });       
    });


		// 3. 비밀번호 확인 입력 필드에 이벤트 리스너 추가
		$("input[name='u_pwd2']").on("input", function() {
		    var uPwd = $("input[name='u_pwd']").val(); // 위의 비밀번호
		    var uPwd2 = $(this).val(); // 비밀번호 확인
		
		    // 비밀번호가 비어 있으면 경고 메시지
		    if (uPwd === "") {
		        $("li.find_ajax3 label").text("비밀번호부터 먼저 입력해주세요.").css("color", "orange");
		        $("li.find_ajax3").show();
		        return;
		    }
		
		    // 비밀번호와 비밀번호 확인이 일치하는지 비교
		    if (uPwd !== uPwd2) {
		        $("li.find_ajax3 label").text("비밀번호가 일치하지 않습니다!").css("color", "red");
		        $("li.find_ajax3").show();
		    } else {
		        $("li.find_ajax3 label").text("비밀번호가 일치합니다.").css("color", "blue");
		        $("li.find_ajax3").show();
		   	}
		});

		
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
            console.log("세션에서 pwdfind_s_id 제거됨");
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
		<div class="find_title_pwd_reset">
			<span>비밀번호 재설정</span>
		</div>
	</div>
	
	<div>
		<div class="find_div2">					 	                  
	                  <!-- 비밀번호 재설정 Form -->	 
	                  <form action="pwdUpdate.do" method="post">         
	                  <article id="find_pwd_article">
	                    <ul>
	                    	<li class="find_input-container" style="margin-top:90px;">
	                        <img src="/muse/resources/img/member/pwd.png">
	                        <label>비밀번호</label>
	                        <input class="padding_label2" type="password" name="u_pwd" placeholder="8~12자 영문, 숫자, 특수문자">	                       
	                      </li>     
	                      <li class="find_ajax2"><label></label></li>   
	                       
	                      <li class="find_input-container" style="margin-top:30px;">
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