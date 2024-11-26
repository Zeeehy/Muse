<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href= '/muse/resources/css/Yel.css' rel='stylesheet' type='text/css'>
    <title>마이 페이지</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif; /* 원하는 폰트로 변경 가능 */
    color: #333;
    background-color: #f8f8f8;
}

/* 레이아웃 스타일 */
.container {
    display: flex;
    max-width: 1200px;
    margin: 100px auto;
    height: 100%;
    min-height: 500px;
}

/* 사이드바 스타일 */
.sidebar {
    width: 200px;
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 20px;
    margin-right: 20px;
}

.sidebar h2 {
    font-size: 18px;
    color: #d2322d; /* 빨간색 텍스트 */
    margin-bottom: 10px;
}

.sidebar ul {
    list-style: none;
}

.sidebar ul li {
    margin-bottom: 10px;
    font-size: 14px;
    color: #333;
}

.sidebar ul li a {
    color: #333;
    text-decoration: none;
}

/* 메인 콘텐츠 스타일 */
.main-content {
    flex: 1;
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 20px;
}

/* 제목 스타일 */
.main-content h2 {
    font-size: 16px;
    color: #d2322d; /* 빨간색 텍스트 */
    border-bottom: 2px solid #d2322d;
    padding-bottom: 5px;
    margin-bottom: 20px;
}


button {
    display: inline-block;
    padding: 8px 16px;
    background-color: #d2322d;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    text-align: center;
    font-size: 14px;
    margin-top: 10px;
}
/**/
/* ul {list-style-type: none; padding: 0; width: 100%; display: flex; flex-direction: column; margin-bottom: 11px;} */
.join_input-container{display: flex; align-items: center; justify-content: center; font-family:'Pretendard-Regular', sans-serif; margin-top: 20px; margin-bottom:3px; width: 420px;}
.join_input-container-check{display: flex; font-family:'Pretendard-Regular', sans-serif; margin-top: 20px; margin-bottom:3px; width: 420px;}
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
            $("li.join_ajax2 label").text("비밀번호는 8~12자, 영문, 숫자, 특수문자를 각각 1개 이상 포함해야 합니다.")
            	.css("color", "orange");
            $("li.join_ajax2").show();
            return;
        }
        
        // 비밀번호 확인란을 검사 (비밀번호가 유효하면 비교 시작)
        var uPwd2 = $("input[name='u_pwd2']").val();
        if (uPwd2) { // 비밀번호 확인란이 비어 있지 않다면 비교
            if (uPwd !== uPwd2) {
                $("li.join_ajax3 label").text("비밀번호가 일치하지 않습니다!").css("color", "red");
                $("li.join_ajax3").show();
            } else {
                $("li.join_ajax3 label").text("비밀번호가 일치합니다.").css("color", "blue");
                $("li.join_ajax3").show();
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
                    $("li.join_ajax2 label").text("비밀번호 형식이 올바르지 않습니다.")
                        .css("color", "red");
                } else if (response.exists == 0) {
                    $("li.join_ajax2 label").text("사용 가능한 비밀번호입니다.")
                        .css("color", "blue");
                } else {
                    $("li.join_ajax2 label").text("비밀번호 검사 중 오류가 발생했습니다.")
                        .css("color", "black");
                }
                $("li.join_ajax2").show();
            },
            error: function(xhr, status, error) {
                console.log("AJAX 요청 실패:", status, error);
                $("li.join_ajax2 label").text("비밀번호 검사 중 오류가 발생했습니다.")
                    .css("color", "black");
                $("li.join_ajax2").show();
            }
        });       
    });


		// 3. 비밀번호 확인 입력 필드에 이벤트 리스너 추가
		$("input[name='u_pwd2']").on("input", function() {
		    var uPwd = $("input[name='u_pwd']").val(); // 위의 비밀번호
		    var uPwd2 = $(this).val(); // 비밀번호 확인
		
		    // 비밀번호가 비어 있으면 경고 메시지
		    if (uPwd === "") {
		        $("li.join_ajax3 label").text("비밀번호부터 먼저 입력해주세요.").css("color", "orange");
		        $("li.join_ajax3").show();
		        return;
		    }
		
		    // 비밀번호와 비밀번호 확인이 일치하는지 비교
		    if (uPwd !== uPwd2) {
		        $("li.join_ajax3 label").text("비밀번호가 일치하지 않습니다!").css("color", "red");
		        $("li.join_ajax3").show();
		    } else {
		        $("li.join_ajax3 label").text("비밀번호가 일치합니다.").css("color", "blue");
		        $("li.join_ajax3").show();
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
</head>
<body>
    <%@include file="../header.jsp" %>
	<div class="container">
    <!-- 사이드바 -->
	    <div class="sidebar">
	        <h2>마이페이지</h2>
	        <ul>
	        	<li><a href="myPageInfoUpdate.do">회원정보수정</a></li>
	        	<li><a href="myPagePwdUpdate.do">비밀번호수정</a></li>
	        	<li><a href="myPagePoint.do">나의 포인트</a></li>
	            <li><a href="myPageBooking.do">예약/취소내역</a></li>
	            <li><a href="myPageMuseCast.do">나의 뮤즈캐스트</a></li>
	            <li><a href="myPageMusePass.do">나의 MUSEPASS</a></li>
	            <li><a href="myPageReview.do">나의 후기</a></li>
	            <li><a href="myPageMuseCalendar.do">뮤즈캘린더</a></li>
	        </ul>
	    </div>
	
	    <div class="main-content">
	    	 <h2>비밀번호수정</h2>
	<div>
		<div class="join_div2">			
				<form name="myPagePwdUpdate" action="myPagePwdUpdate.do" method="post">      
	                  <article>
	                     <ul>
	                      <li class="join_input-container">
	                        <img src="/muse/resources/img/member/pwd.png">
	                        <label>비밀번호</label>
	                        <input class="padding_label2" type="password" name="u_pwd" placeholder="8~12자 영문, 숫자, 특수문자">	                       
	                      </li>     
	                      <li class="join_ajax2"><label></label></li>   
	                       
	                      <li class="join_input-container">
	                     	<img src="/muse/resources/img/member/pwd.png">
	                     	<label>비밀번호 확인</label>
	                        <input class="padding_label3" type="password" name="u_pwd2" placeholder="8~12자 영문, 숫자, 특수문자">
	                     </li>
	                       
	                     <li class="join_ajax3"><label></label></li> 
	                     <li class="join_input-container-btn">  
	                     	<input class="join_btn" type="submit" value="비밀번호 수정">         
	                     </li>
	                     </ul>
	                  </article>
	            </form>
		</div>
	</div>	
	   </div>
   </div> 
    <%@include file="../footer.jsp" %>
</body>

</html>