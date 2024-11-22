<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUSEPASS</title>
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
						<h3>이용약관 동의 및 신청</h3>
					</li>
					<li>
						<h5>step2.</h5>
						<h3>결제하기</h3>
					</li>
					
					<li>
						<h5>step3.</h5>
						<h3>가입완료</h3>
					</li>
				</ul>
				
				<div class="contents">
					
					<div class="notification">
						<h2>가입비</h2>
						30,000원
						
					</div>
					
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

document.querySelector('range').textContent = start+'~'+end

</script>
</html>