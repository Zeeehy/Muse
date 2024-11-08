<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href= '/muse/resources/css/Yel.css' rel='stylesheet' type='text/css'>
<title>Insert title here</title>
<style>
ul {
        list-style-type: none;
        padding: 0;
        width: 100%;
        display: flex;             
	    flex-direction: column;    
	    align-items: center;      
	    margin-bottom: 11px;
}

ul li {
   display: flex;
   align-items: center; 
   justify-content: center; 
   font-family:'Pretendard-Regular', sans-serif;     
   margin-top: 15px;
   margin-bottom:3px;
   width: 420px;
}

.padding_label3 {
   width: 100%; 
   max-width: 250px;
   height:50px;
   flex-grow: 1;
   font-size: 16px;
   padding: 7px;
   border: none; 
   border-radius:10px;
   box-sizing: border-box; 
   background-color:rgb(52 83 112 / 0%);
}

.padding_label2 {
   width: 100%; 
   max-width: 280px;
   height:50px;
   flex-grow: 1;
   font-size: 16px;
   padding: 7px;
   border: none; 
   border-radius:10px;
   box-sizing: border-box; 
   background-color:rgb(52 83 112 / 0%);
}

.padding_label1 {
   width: 100%; 
   max-width: 300px;
   height:50px;
   flex-grow: 1;
   font-size: 16px;
   padding: 7px;
   border: none; 
   border-radius:10px;
   box-sizing: border-box; 
   background-color:rgb(52 83 112 / 0%);
}

.padding_label0{
   width: 100%; 
   max-width: 310px;
   height:50px;
   flex-grow: 1;
   font-size: 16px;
   padding: 7px;
   border: none; 
   border-radius:10px;
   box-sizing: border-box; 
   background-color:rgb(52 83 112 / 0%);
}

 ul li input[type="text"]:focus, 
 ul li input[type="password"]:focus{
   outline: none; 
}

ul li input[type="text"]::placeholder,
ul li input[type="password"]::placeholder {
   font-size:15px;
   font-family: 'Pretendard';
   color: #a0a0a0; 
   opacity: 1; 
}   
</style>
</head>
<body>
	<div class="join_div1">
		<div class="join_logo">
			 <a href="index.do"><img class="join_logoimg" alt=""  src="/muse/resources/img/member/logo.png"></a>
		</div>
		<div class="join_title">
			<span>정보입력</span>
		</div>
	</div>

	<div>
		<div class="join_div2">			
				<form action="memberJoin.do" method="post">      
	                  <article>
	                     <ul>
	                     <li class="join_input-container">
	                     	<img src="/muse/resources/img/member/id.png">
	                     	<label>아이디</label>
	                        <input  class="padding_label1" type="text" name="u_id" placeholder="6~20자 영문, 숫자">
	                     </li>
	                     <li class="join_ajax"><label>아이디가 중복됩니다!</label></li>
	                      <li class="join_input-container">
	                        <img src="/muse/resources/img/member/pwd.png">
	                        <label>비밀번호</label>
	                        <input class="padding_label2" type="password" name="u_pwd" placeholder="8~12자 영문, 숫자, 특수문자">	                       
	                      </li>     
	                      <li class="join_ajax"><label>비밀번호 형식이 올바르지 않습니다!</label></li>    
	                      <li class="join_input-container">
	                     	<img src="/muse/resources/img/member/pwd.png">
	                     	<label>비밀번호 확인</label>
	                        <input class="padding_label3" type="password" name="u_pwd2" placeholder="8~12자 영문, 숫자, 특수문자">
	                     </li>
	                     <li class="join_ajax"><label>비밀번호가 일치하지 않습니다!</label></li> 
	                     <li class="join_input-container">
	                     	<img src="/muse/resources/img/member/name.png">
	                     	<label>이름</label>
	                        <input class="padding_label0" type="text" name="u_name" placeholder="[예시] 홍길동">
	                     </li>
	                     <li class="join_ajax"><label>이름 형식이 올바르지 않습니다!</label></li> 
	                     <li class="join_input-container">
	                     	<img src="/muse/resources/img/member/email.png">
	                     	<label>이메일</label>
	                        <input class="padding_label1" type="text" name="u_email" placeholder="[예시] hello@naver.com">
	                     </li>
	                     <li class="join_ajax"><label>이메일 형식이 올바르지 않습니다!</label></li> 
	                     <li class="join_input-container">
	                     	<img src="/muse/resources/img/member/tel.png">
	                     	<label>휴대폰</label>
	                        <input class="padding_label1" type="text" name="u_pnum" placeholder="010-1234-5678">
	                     </li>
	                     <li class="join_ajax"><label>휴대폰 형식이 올바르지 않습니다!</label></li> 
	                      <li class="join_input-container-btn">  
	                     	<input class="join_btn" type="submit" value="로그인">         
	                     </li>
	                     </ul>
	                  </article>
	               </form>

		</div>
	</div>	
</body>
</html>