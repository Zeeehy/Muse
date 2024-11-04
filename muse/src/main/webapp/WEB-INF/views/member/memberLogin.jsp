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
body{
   margin: 0px;
}

ul {
        list-style-type: none;
        padding: 0;
        width: 100%;
}

ul li {
   display: flex;
   align-items: center; 
   justify-content: center; 
    font-family:'Pretendard-Regular', sans-serif;     
    margin: 10px 0;
}

 ul li input[type="text"]{
   width: 100%; 
   max-width: 300px;
   height:50px;
   flex-grow: 1;
   font-family: 'Pretendard-Regular', sans-serif;
   font-size: 23px;
   padding: 7px;
   border: none; 
   border-radius:10px;
   box-sizing: border-box; 
   background-color: rgba(52, 83, 112, 0.05);
}
   
 ul li input[type="password"]{
    width: 100%; 
   max-width: 300px;
   height:50px;
   flex-grow: 1;
   font-size: 23px;
   padding: 7px;
   border: none; 
   border-radius:10px;
   box-sizing: border-box; 
   background-color: rgba(52, 83, 112, 0.05);
}

 ul li input[type="text"]:focus, 
 ul li input[type="password"]:focus{
   border: 2px solid black; 
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
   <div class="login_flex1">
         <div class="login_child1" data-aos="fade-right" data-aos-duration="1500">
         	<img class="login_img" alt="" src="/muse/resources/img/member/login.jpg">
         </div>        
         <div class="login_child2" >
            <div data-aos="zoom-in-down" data-aos-duration="1500">
            	<div class="login_logodiv1">
                  <div class="login_logodiv2">
                        <img class="login_logoimg" alt=""  src="/muse/resources/img/member/logo.png">
                  </div>        
                </div>         
            <div>
               <form>      
                  <article>
                     <ul>
                     <li>
                       <input type="text" placeholder="아이디">
                     </li>
                      <li>
                       <input type="password" placeholder="비밀번호">
                      </li>         
                     <li>   
                     <input class="login_btn" type="submit" value="로그인">      
                     </li>      
                     </ul>
                  </article>
               </form>
            </div>
            <div class="pwdforget">
                <a href="#" style="color:rgb(142, 150, 157); font-size:14px;">아이디/비밀번호를 잊으셨나요?</a>
            </div>
            <div class="join">
                <span style="color:rgb(142, 150, 157); font-size:14px;">회원이 아니신가요?지금 가입하세요!</span>
                <a href="#" style="color:rgb(142, 150, 157); font-size:14px;"> 지금 가입하세요.</a>
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