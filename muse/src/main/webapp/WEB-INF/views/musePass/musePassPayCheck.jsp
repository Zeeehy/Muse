<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUSEPASS</title>
<style>
.musepass {
   max-width: 800px;
   margin: 0 auto;
   padding: 40px 20px;
}
.musepass ul {
	max-width: 800px;
    margin: 0 auto;
   display: flex;
   justify-content: space-between;
   list-style: none;
   padding: 0;
   margin-bottom: 50px;
   position: relative;
}

.musepass ul:after {
   content: '';
   position: absolute;
   top: 25px;
   left: 10%;
   right: 10%;
   height: 2px;
   background: #eee;
   z-index: 1;
}

.musepass ul li {
   text-align: center;
   position: relative;
   z-index: 2;
   background: white;
   padding: 0 20px;
}

.musepass h5 {
   color: #ff3e32;
   margin: 0;
   font-size: 14px;
}

.musepass h3 {
   margin: 10px 0;
   color: #333;
   font-size: 18px;
}
.contents {
   background: white;
   border-radius: 10px;
   box-shadow: 0 2px 10px rgba(0,0,0,0.1);
   padding: 30px;
}

.notification {
   background: #f8f8f8;
   padding: 30px;
   border-radius: 8px;
   margin-bottom: 30px;
   text-align: center;
}

.notification h2 {
   color: #333;
   margin-bottom: 20px;
   font-size: 24px;
}

.notification {
   font-size: 28px;
   color: #ff3e32;
   font-weight: bold;
}

.joinClause {
   padding: 40px;
   background: #fff;
   border-radius: 8px;
   border: 1px solid #eee;
   text-align: center;
}

.joinClause h3 {
   margin-bottom: 30px;
   color: #333;
   font-size: 20px;
}

#range {
   color: #666;
   font-size: 16px;
   display: block;
   margin-top: 10px;
}

h1 {
   color: #333;
   margin: 30px 0;
   font-size: 24px;
   line-height: 1.4;
}

/* 완료 메시지 강조 */
.joinClause h1 {
   padding: 20px;
   background: #f8f8f8;
   border-radius: 8px;
   color: #ff3e32;
}

/* 가입하기 버튼 스타일 */
#join {
   display: block;
   width: 200px;
   margin: 30px auto 0;
   padding: 15px 0;
   background: #ff3e32;
   color: white;
   text-align: center;
   border-radius: 25px;
   text-decoration: none;
   font-weight: bold;
   transition: background-color 0.3s;
}

#join:hover {
   background: #e63529;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
	<div class="content">
		<article class="musepass">
			<h2>MUSEPASS 가입하기</h2>
			
			<div>
				<ul>
					<li>
						<h5>step1.</h5>
						<h3 style="color:#b2b2b2;">이용약관 동의 및 신청</h3>
					</li>
					<li>
						<h5>step2.</h5>
						<h3 style="color:#b2b2b2;">결제하기</h3>
					</li>
					
					<li>
						<h5>step3.</h5>
						<h3>가입완료</h3>
					</li>
				</ul>
				
				<div class="contents">
					
<!-- 					<div class="notification">
						<h2>가입비</h2>
						30,000원
						
					</div> -->
					
					<div class="joinClause">
						<h3>
							유지기간
							<span id="range"> </span>
						</h3>
						
						<h1>${sessionScope.s_name }님 가입이 완료되었습니다.</h1>
						
						
					</div>
					
				</div>
			</div>
		</article>
	</div>
<%@include file="../footer.jsp" %>
</body>
<script type="text/javascript">

var start = new Date();
var end = new Date(start); // start의 값을 복사하여 end 생성

end.setFullYear(start.getFullYear() + 1);

var s_id = '${s_id}';

function formatDate(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return year+'~'+month+'~'+day;
}

document.querySelector('#range').textContent = formatDate(start)+'~'+formatDate(end);

</script>
</html>