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
ul {list-style-type: none; padding: 0; width: 100%; display: flex; flex-direction: column; margin-bottom: 11px;}
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
    // 1. 아이디 입력 필드에 이벤트 리스너 추가
    $("input[name='u_id']").on("input", function() {
        var uId = $(this).val();
    	// 정규식을 통해 아이디가 형식에 맞는지 체크 (영어 4자 이상, 숫자 2개 이상, 전체 길이 6~15자)
        var idRegex = /^(?=(.*[a-zA-Z]){4,})(?=(.*\d){2,})[a-zA-Z\d]{6,15}$/;
        // ^: 문자열의 시작, $: 문자열의 끝, (?= ... ): 해당 조건이 일치하는지 확인, 
        // .*: 0개 이상의 문자 (영어가 하나라도 나오기 전에 어떤 문자가 와도 괜찮다),
        // [a-zA-Z]: 영어 알파벳이 하나 이상, {4,}: 영어 알파벳이 최소 4번 이상
        // \d: 숫자(0-9) 1개, {2,}: 숫자가 최소 2개 이상, 
        // [a-zA-Z\d]: 영어 알파벳 대소문자와 숫자(0-9) 집합
        var isValid = idRegex.test(uId);  

        // 형식이 맞는지 검사 후
        if (!isValid) {
            $("li.join_ajax1 label").text("아이디는 6~15자로, 영문 4자 이상, 숫자 2개 이상이 포함되어야 합니다.")
            	.css("color", "orange");
            $("li.join_ajax1").show();
            return;
        }
        
        // 형식이 맞으면 Ajax로 서버에 아이디 중복 검사를 요청
        $.ajax({
            url: "checkIdDuplicate.do",
            type: "GET",
            data: { u_id: uId },
            dataType: "json",  // JSON 형식으로 응답을 요청
            success: function(response) {
                if (response.exists == 1) {
                    $("li.join_ajax1 label").text("이미 존재하는 아이디입니다.")
                    								.css("color", "red");
                } else if (response.exists == 0) {
                    $("li.join_ajax1 label").text("사용 가능한 아이디입니다.")
                    								.css("color", "blue");
                } else {
                    $("li.join_ajax1 label").text("아이디 검사 중 오류가 발생했습니다.")
                   								    .css("color", "black");
                }
                $("li.join_ajax1").show();
            },
            error: function(xhr, status, error) {
                console.log("AJAX 요청 실패:", status, error);
                $("li.join_ajax1 label").text("아이디 검사 중 오류가 발생했습니다.")
												.css("color", "black");
                $("li.join_ajax1").show();
            }
        });       
    });


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
		
				
		// 4. 이름 입력 필드에 이벤트 리스너 추가
		$("input[name='u_name']").on("input", function() {
	        var uName = $(this).val();
	        // 이름에 대한 정규표현식 (영어는 자음+모음 패턴, 한글은 2자 이상)
	        var nameRegex = /^(?:(?:[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z][aeiouAEIOU])+(?:[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z])*)$|^[가-힣]{2,}$/;
			// (?:[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z][aeiouAEIOU]) - 자음(소문자 b-df-hj-np-tv-z, 대문자 B-DF-HJ-NP-TV-Z)과 모음(소문자 및 대문자 aeiouAEIOU)이 번갈아 나오는 패턴을 하나 이상 반복
			// ^[가-힣]{2,}$: 음절(자음과 모음이 결합된 문자)이 2자 이상인 경우만 유효함
			var isValid =nameRegex.test(uName);
			
	        if (!isValid) {
	            $("li.join_ajax4 label").text("올바르지 않은 이름 형식입니다.")
	                .css("color", "red");
	            $("li.join_ajax4").show();
	        } else {
	            $("li.join_ajax4 label").text("올바른 이름 형식입니다.")
	                .css("color", "blue");
	            $("li.join_ajax4").show();
	        }
	    });		
				
		
		// 5. 이메일 입력 필드에 이벤트 리스너 추가
		$("input[name='u_email']").on("input", function() {
		    var uEmail = $(this).val();		    
		    // 이메일 형식 검사를 위한 정규표현식
		    var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		    // 아이디 부분: 영문자, 숫자, 점(.), 하이픈(-), 밑줄(_) 등을 사용할 수 있으며, 첫 문자와 마지막 문자는 영문자나 숫자임
		    // [a-zA-Z0-9._%+-] : 이메일의 아이디 부분으로 대소문자, 숫자, 특수문자(., _, %, +, -)를 포함할 수 있으며 최소 1자 이상
		    // @ 기호: 이메일 주소에서 반드시 한 번 등장해야 함
		    // [a-zA-Z0-9.-] : 도메인 부분으로 알파벳, 숫자, 하이픈(-)을 포함할 수 있으며, 끝에는 최소 두 자 이상의 도메인이 필요함
		    // \.[a-zA-Z]{2,} : 최소 한 개의 도메인 확장자 (예: .com, .net, .org, .co.kr 등)
		    var isValid = emailRegex.test(uEmail);

		    if (!isValid) {
		        $("li.join_ajax5 label").text("유효하지 않은 이메일 형식입니다.")
		        	.css("color", "red");
		        $("li.join_ajax5").show();
		    } else {
		        $("li.join_ajax5 label").text("유효한 이메일 형식입니다.")
		        	.css("color", "blue");
		        $("li.join_ajax5").show();
		    }
		});
		
		
		// 6. 휴대폰 입력 필드에 이벤트 리스너 추가
		$("input[name='u_pnum']").on("input", function() {
			    var phone = $(this).val();
		        // 입력값에서 숫자만 추출 (하이픈을 제외한 숫자만 처리)
		        // 숫자가 아닌 문자(즉, 숫자 이외의 모든 문자를) 제거하는 역할
		        var numbers = phone.replace(/[^\d]/g, '');
		        // 010, 011, 016, 017, 018, 019로 시작하는지 체크
		        var prefixRegex = /^(010|011|016|017|018|019)/;

		        // 유효한 접두사로 시작하는지 확인
		        if (!prefixRegex.test(numbers)) {
		            $("li.join_ajax6 label").text("올바른 번호(010, 011, 016 등 으로 시작해야 합니다.").css("color", "orange");
		            $("li.join_ajax6").show();
		            return;
		        }

		        // 숫자가 3자리 이상이면 첫 번째 하이픈 추가
		        if (numbers.length > 3 && numbers.length <= 7) {
		            numbers = numbers.replace(/(\d{3})(\d{1,4})/, '$1-$2');
		            // 첫 3자리를 (\d{3})로 묶고, 나머지 숫자들(\d{1,4})을 두 번째 부분으로 묶어 -로 구분
		        }
		        // 숫자가 8자리 이상이면 두 번째 하이픈 추가
		        else if (numbers.length > 7) {
		            numbers = numbers.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1-$2-$3');
		            // 첫 3자리, 4자리, 4자리로 나누어 하이픈을 추가
		        }

		        // 입력 필드에 변환된 값을 다시 설정
		        $(this).val(numbers);
		        // 휴대폰 번호 형식 검증 (010-1234-5678)
		        var phoneRegex = /^(010|011|016|017|018|019)-(\d{4})-(\d{4})$/;
		        var isValid = phoneRegex.test(numbers);

		        // 번호가 완전히 입력되었으면 더 이상 입력되지 않도록 처리
		        if (numbers.length === 13) {
		            $(this).prop('readonly', true);  // 입력을 잠그기 (readonly)		    
		            // .prop() : 속성(attribute)을 설정하거나 가져오는 jQuery 메서드
		        }

		        if (!isValid) {
		            $("li.join_ajax6 label").text("유효하지 않은 휴대폰 형식입니다.")
		                .css("color", "red");
		            $("li.join_ajax6").show();
		        } else {
		            $("li.join_ajax6 label").text("유효한 휴대폰 형식입니다.")
		                .css("color", "blue");
		            $("li.join_ajax6").show();
		        }
		   });
		  
		            
		// 7. 폼 제출 이벤트
		$("form").on("submit", function(event) {
		    var isValid = true; // 유효성 검사 상태
		    var missingFields = []; // 비어있는 필드를 저장할 배열
		    var errorMessages = ""; // 오류 메시지를 저장할 변수
		    
		 	// '14세 미만' 체크박스 상태 확인
		    var isUnder14 = $("input[name='u_age']").prop("checked");  // 체크박스 상태 확인
	    	$("input[name='u_age']").val(isUnder14 ? 0 : 1);  // 체크되면 0, 아니면 1으로 설정

		    // 아이디 유효성 검사 (입력값 확인 + 기존 검사를 통한 오류 처리)
		    var uId = $("input[name='u_id']").val().trim();
		    var idRegex = /^(?=(.*[a-zA-Z]){4,})(?=(.*\d){2,})[a-zA-Z\d]{6,15}$/;
		    if (uId === "") {
		        missingFields.push("아이디");
		        isValid = false;
		    } else if (!idRegex.test(uId)) {
		        errorMessages += "아이디는 6~15자로, 영문 4자 이상, 숫자 2개 이상이 포함되어야 합니다.\n";
		        isValid = false;
		    }

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

		    // 이름 유효성 검사
		    var uName = $("input[name='u_name']").val().trim();
		    var nameRegex = /^(?:(?:[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z][aeiouAEIOU])+(?:[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z])*)$|^[가-힣]{2,}$/;
		    if (uName === "") {
		        missingFields.push("이름");
		        isValid = false;
		    } else if (!nameRegex.test(uName)) {
		        errorMessages += "이름은 2자 이상 한글 또는 영문이 포함되어야 합니다.\n";
		        isValid = false;
		    }

		    // 이메일 유효성 검사
		    var uEmail = $("input[name='u_email']").val().trim();
		    var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		    if (uEmail === "") {
		        missingFields.push("이메일");
		        isValid = false;
		    } else if (!emailRegex.test(uEmail)) {
		        errorMessages += "유효하지 않은 이메일 형식입니다.\n";
		        isValid = false;
		    }

		    // 휴대폰 번호 유효성 검사
		    var uPhone = $("input[name='u_pnum']").val().trim();
		    var phoneRegex = /^(010|011|016|017|018|019)-(\d{4})-(\d{4})$/;
		    if (uPhone === "") {
		        missingFields.push("휴대폰 번호");
		        isValid = false;
		    } else if (!phoneRegex.test(uPhone)) {
		        errorMessages += "유효하지 않은 휴대폰 형식입니다. (예: 010-1234-5678)\n";
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
            <h2>회원정보수정</h2>


	<div>
		<div class="join_div2">			
				<form action="memberJoin.do" method="post">      
	                  <article>
	                     <ul>
	                     <li class="join_input-container">
	                     	<img src="/muse/resources/img/member/id.png">
	                     	<label>아이디</label>
	                        <input class="padding_label1" type="text" name="u_id" placeholder="6~15자 영문, 숫자">
	                     </li>
	                     <li class="join_ajax1"><label></label></li>
	                     
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
	                     
	                     <li class="join_input-container">
	                     	<img src="/muse/resources/img/member/name.png">
	                     	<label>이름</label>
	                        <input class="padding_label0" type="text" name="u_name" placeholder="[예시] 홍길동">
	                     </li>
	                     <li class="join_ajax4"><label></label></li> 
	                     
	                     <li class="join_input-container">
	                     	<img src="/muse/resources/img/member/email.png">
	                     	<label>이메일</label>
	                        <input class="padding_label1" type="text" name="u_email" placeholder="[예시] hello@naver.com">
	                     </li>
	                     <li class="join_ajax5"><label></label></li> 
	                     
	                     <li class="join_input-container">
	                     	<img src="/muse/resources/img/member/tel.png">
	                     	<label>휴대폰</label>
	                        <input class="padding_label1" type="text" name="u_pnum" placeholder="010-1234-5678">
	                     </li>
	                     <li class="join_ajax6"><label></label></li> 
	                     
	                     <li class="join_input-container-check">
	                     	<input type="checkbox" name="u_age">
	                     	<label>14세 미만입니다.</label>
	                     </li>
	                     
	                      <li class="join_input-container-btn">  
	                     	<input class="join_btn" type="submit" value="로그인">         
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
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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


footer {
    background: #212121;
    position: absolute;
    bottom: 0;
    width: 100%;
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

</style>
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
            <h2>회원정보수정</h2>
            <form name="myPageInfoUpdate" action="myPageInfoUpdate.do" method="post">
				<ul>
					<li>
						<label>아이디</label>
						<input type="text" name="u_id" value="${user.u_id}" readonly="readonly">
					</li>
					<li>
						<label>이름</label>${user.u_name}
					</li>
					<li>
						<label>e-mail</label>
						<input type="text" name="u_email" value="${user.u_email}">
					</li>
					<li>
						<label>전화번호</label>
						<input type="text" name="u_pnum" value="${user.u_pnum}">
					</li>
					<li>
						<label>가입일자</label>${user.u_date}
					</li>
				</ul>
				<div>
					<input type="submit" value="수정">
					<input type="reset" value="취소">
				</div>
			</form>
        </div>
   </div> 
    <%@include file="../footer.jsp" %>
</body>

</html> --%>