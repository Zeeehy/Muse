<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href= '/muse/resources/css/Yel.css' rel='stylesheet' type='text/css'>
<!-- AOS 라이브러리 불러오기-->
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<style>
body{margin: 0px;}
ul {list-style-type: none; padding: 0; width: 100%; display: flex; flex-direction: column; align-items: center; margin-bottom: 11px;}
ul li {display: flex; align-items: center; justify-content: center; font-family:'Pretendard-Regular', sans-serif; margin: 10px 0; width: 330px;}
ul li input[type="text"]{width: 100%; max-width: 300px; height:50px; flex-grow: 1; font-family: 'Pretendard-Regular', sans-serif; font-size: 16px; padding: 7px; border: none; border-radius:10px; box-sizing: border-box; background-color: rgb(52 83 112 / 0%);}
ul li input[type="password"]{width: 100%; max-width: 300px; height:50px; flex-grow: 1; font-size: 16px; padding: 7px; border: none; border-radius:10px; box-sizing: border-box; background-color:rgb(52 83 112 / 0%);}
ul li input[type="text"]:focus, ul li input[type="password"]:focus{outline: none;}
ul li input[type="text"]::placeholder, ul li input[type="password"]::placeholder {font-size:15px; font-family: 'Pretendard'; color: #a0a0a0; opacity: 1;}
</style>
</head>
<body>
   <div class="login_flex1">
         <div class="login_child1" data-aos="fade-right" data-aos-duration="1500">
         	<img class="login_img" alt="" src="/muse/resources/img/member/login.jpg">
         </div>        
         <div class="login_child2" >
            <div data-aos="zoom-in-down" data-aos-duration="1500">
				<div class="login_logodiv1" style=" padding-bottom: 0px;">
				    <div class="login_logodiv2" style="display: flex; flex-direction: column; align-items: center; ">
				        <a href="index.do"><img class="login_logoimg" alt="" src="/muse/resources/img/member/logo.png"></a>
				        <h3 style="margin-top: 20px;">관리자 로그인</h3>
				    </div>
				</div>
        
	            <div>
	               <form action="adminLogin.do" method="post">      
	                  <article>
	                     <ul>
	                     <li class="input-container">
	                     	<img src="/muse/resources/img/member/id.png">
	                        <input type="text" name="a_id" placeholder="아이디">
	                     </li>
	                      <li class="input-container">
	                        <img src="/muse/resources/img/member/pwd.png">
	                        <input type="password" name="a_pwd" placeholder="비밀번호">	                       
	                      </li>         
	                      <li class="input-container-btn">  
	                     	<input class="login_btn" type="submit" value="로그인">         
	                     </li>
	                     </ul>
	                  </article>
	               </form>
	            </div>
            </div>
            
            <!-- AOS 스크립트 시작 -->
           <script> 
               AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
           </script>

         </div>
   </div>   
</body>
</html>