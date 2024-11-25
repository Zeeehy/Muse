<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUSEPASS</title>
</head>
<body>
<%@include file="header.jsp" %>
	<div class="content">
		<article class="musepass">
			<h2>MUSEPASS BENEFIT
			<span>다양한 혜택이 가득한 뮤즈패스를 즐겨보세요!</span>
			</h2>
			
			<div class="bene_bk">
				<ul>
					<li>
						<div>
							<div class="imgbox"><img src="resources/img/main/musebene_icon01.png"></div>
							<p class="bene_p01">단 돈, 연 3만원</p>
							<p class="bene_p02">뮤지컬을 사랑하는 모두를 위해<br>착한 단일 가격으로 제공</p>
						</div>
					</li>
					<li>
						<div>
							<div class="imgbox"><img src="resources/img/main/musebene_icon02.png"></div>
							<p class="bene_p01">선예매 무제한</p>
							<p class="bene_p02">인기 공연도 누구보다 먼저<br>좋은자리 예약하세요 !</p>
						</div>
					</li>
					<li>
						<div>
							<div class="imgbox"><img src="resources/img/main/musebene_icon03.png"></div>
							<p class="bene_p01">리뷰 작성 2배 포인트</p>
							<p class="bene_p02">공연을 보고 나누는 즐거움에<br>보너스를 더해드려요</p>
						</div>
					</li>
					<li>
						<div>
							<div class="imgbox"><img src="resources/img/main/musebene_icon04.png"></div>
							<p class="bene_p01">선 지급 포인트, 15000P</p>
							<p class="bene_p02">지금 뮤즈패스 가입시,<br>즉시 15000P 지급 !</p>
						</div>
					</li> 
				</ul>
			</div>
			<div class="bene_res">
				<h2 style="color: #000;">MUSEPASS 선예매</h2>
				<div class="bene_list"> 
				<c:forEach var="ms" items="${musepass}">
					<div class="bene_res_inf">
						<a href="openNoticeView.do?on_code=${ms.on_code}" class="ref_inf_img"><img src="resources/img/musical/${ms.m_poster}" width="300px" height="412.22px"></a>
						<div class="pos_inf">
							<a href="openNoticeView.do?on_code=${ms.on_code}" class="ref_inf_txt">
								<p class="name">[${ms.m_title}]</p>
								<img src="resources/img/main/muselogo.png">
								<p class="musename">뮤즈패스</p>
								<p class="muse_day">${ms.on_muse_open} OPEN</p>
								<p class="origin">일반</p>
								<p class="origin_day">${ms.on_open} OPEN</p>
							</a>
						</div>
					</div>
					</c:forEach>  
				</div>
				
				 <div class="bt musepass">
				 	
					<a href="musePassPayment.do">뮤즈패스 가입하기<i class="fa-solid fa-angle-right"></i></a>
		         </div> 
			</div>
		</article>
	</div>
<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
var s_id = ${sessionScope.s_id != null ? 'true' : 'false'};
var s_mpass = ${sessionScope.s_mpass != null ? sessionScope.s_mpass : 0};



var tagA = document.querySelector('.bt.musepass a');
tagA.addEventListener("click", function(event) {
    // 기본 동작을 막기 위해 preventDefault 사용
    event.preventDefault();

    // 세션 정보 확인
    if (s_id && s_mpass == 0) {
        // 세션에 s_id가 존재하고 s_mpass가 0일 때
        window.location.href = 'musePassTermForm.do';
    } else if(s_mpass == 1){
       alert('이미 MusePass에 가입하셨습니다');
    } else {
        window.location.href = 'memberLogin.do';
    }
});
</script>
</html>