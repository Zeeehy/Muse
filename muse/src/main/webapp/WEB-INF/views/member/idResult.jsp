<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href= '/muse/resources/css/Yel.css' rel='stylesheet' type='text/css'>
<title>ID Result</title>
<style>
ul {list-style-type: none; padding: 0; width: 100%; display: flex; flex-direction: column; margin-bottom: 11px;}
.find_input-container{display: flex; align-items: center; justify-content: center; font-family:'Pretendard-Regular', sans-serif; margin-top: 20px; margin-bottom:3px; width: 420px;}
.padding_label3 {width: 100%; max-width: 250px; height:50px; flex-grow: 1; font-size: 16px; padding: 7px; border: none; border-radius:10px; box-sizing: border-box; background-color:rgb(52 83 112 / 0%); }
.padding_label2 {width: 100%; max-width: 280px; height:50px; flex-grow: 1; font-size: 16px; padding: 7px; border: none; border-radius:10px; box-sizing: border-box; background-color:rgb(52 83 112 / 0%); }
.padding_label1 {width: 100%; max-width: 300px; height:50px; flex-grow: 1; font-size: 16px; padding: 7px; border: none; border-radius:10px; box-sizing: border-box; background-color:rgb(52 83 112 / 0%); }
.padding_label0{width: 100%; max-width: 310px; height:50px; flex-grow: 1; font-size: 16px; padding: 7px; border: none;  border-radius:10px; box-sizing: border-box; background-color:rgb(52 83 112 / 0%); }
ul li input[type="text"]:focus, ul li input[type="password"]:focus{outline: none; }
ul li input[type="text"]::placeholder, ul li input[type="password"]::placeholder {font-size:15px; font-family: 'Pretendard'; color: #a0a0a0; opacity: 1; }   
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//메인페이지로 이동 버튼 클릭 시 세션에서 idfind_s_id 값 제거
function removeSessionAndRedirect() {
    // 세션에서 idfind_s_id를 제거하는 Ajax 요청
    $.ajax({
        url: "removeFindIdSession.do",  // 세션에서 find_s_id를 제거하는 URL
        method: "POST",
        contentType: "application/json",
        dataType: "json",
        success: function(response) {
        	alert("세션에서 idfind_s_id 제거 성공");
            // 세션 제거 성공 시, 메인 페이지로 이동
            window.location.href = '/muse/index.do';
        },
        error: function() {
            alert("세션에서 idfind_s_id 제거 실패");
            // 실패 시에도 메인 페이지로 이동
            window.location.href = '/muse/index.do';
        }
    });
}
</script>
</head>
<body>
	<div class="find_div1">
		<div class="find_logo">
			<a href="index.do"><img class="find_logoimg" alt="" src="/muse/resources/img/member/logo.png"></a>
		</div>
		<div class="find_title_pwd_reset2">
			<span>아이디 결과</span>
		</div>
	</div>

	<div>
		<div class="find_div2">					 	                   
			<!-- 아이디 결과 Form -->	 	                     
			<article id="find_pwd_article">
			<div class="find_id_result" style="display: flex; justify-content: center; align-items: center; padding: 30px; padding-top: 150px;">
				<span > 아이디는 " ${idfind_s_id} " 입니다.</span>
			</div>
			<div style="padding-top: 70px;">
				<div class="find_input-container-btn">
	                <input class="find_btn" type="button" value="메인페이지로 이동"  onclick="removeSessionAndRedirect();">
	            </div>
	         </div>
			</article>    
		</div>
	</div>	
</body>
</html>
