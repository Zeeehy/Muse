<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header.jsp"%>



<div class="board">
	<div class="detail_top">
		<h2>티켓 공지</h2>
		<div class="btn_top"> <a>목록보기</a> </div>
	</div>
	<div class="info">
		<span class="poster bgMusical">
			<img src="resources/img/musical/${ondto.m_poster }" alt="${ondto.m_title } 포스터" style="width:130px; height:175px;">
		</span>
		<div>
			<h3>${ondto.m_title }</h3>
			<ul>
				<li class="open"><strong>티켓오픈일</strong>${ondto.on_open }  <!--2013년 6월 12일(수) 오후 8시--></li>
				<li class="tiki">
					<strong>뮤즈패스 선예매</strong>${ondto.on_muse_open } 
						<span>
							<a href="http://ticket.interpark.com/Contents/Toping/TopingPreBook"><img src="//ticketimage.interpark.com/TicketImage/subDir/notice/v2013/img/btn_tiki2.gif" alt="선예매란?"></a>
							<a href="http://ticket.interpark.com/Contents/Toping/JoinGrade"><img src="//ticketimage.interpark.com/TicketImage/subDir/notice/v2013/img/btn_tiki1_new.gif" alt="TiKi 가입"></a>
						</span>
				</li>
			</ul>
			<div class="btn">
				<span class="count">조회 : <span>${ondto.on_readnum }</span></span>
				<a href="http://tickets.interpark.com/contents/bridge/24016697" class="btn_book">
					<img src="//ticketimage.interpark.com/TicketImage/subDir/notice/v2013/img/btn_book.gif" alt="예매하기">
				</a>
			</div>
		</div>
	</div>
	<div class="desc">
		<div class="comment">
			안녕하세요. 뮤즈입니다. ${ondto.m_title } ${ondto.on_type } 공지입니다.
		</div>
	 	<div class="introduce">
	 		<h2>공연정보</h2>
	 		<p>${ondto.on_info }</p>
	 	</div>
	 	<div class="sale">
	 		<h2>할인정보</h2>
	 		<p>${ondto.on_sale }</p>
	 		
	 	</div>
	 	<div class="">
	 		<h2>공연소개</h2>
	 		<p>${ondto.on_content }</p>
	 	</div>

	 	<div class="casting">
	 		<h2>캐스팅 정보</h2>
	 		<p>[CAST]<br>${ondto.on_casting }</p>
	 	</div>
	 	
	 	<div class="moreInfoContainer">
							<h4 class="moreInfoTitle">판매자 정보</h4>
							<table class="moreInfoTable">
								<colgroup>
									<col class="col1">
									<col class="col2">
									<col class="col3">
									<col class="col4">
								</colgroup>
								<tbody>
 									<tr>
<!-- 										<th>상호</th>
										<td>클립서비스주식회사</td> -->
										<th>대표자명</th>
										<td>${pdto.pr_name }aaaa</td>
									</tr>
									<tr>
										<th>사업자등록번호</th>
										<td>${pdto.pr_num }11111111111</td>
									</tr>
									<tr>
										<th>E-mail</th>
										<td>${pdto.pr_email }aaaaa@naver.com</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td colspan="3">${pdto.pr_pnum }010-0001-1000</td>
									</tr>
								</tbody>
							</table>
						</div>
	</div>
	<div class="txt_guide">
		<p>티켓오픈일정은 인터파크 또는 기획사의 사정에 의해 사전예고 없이 변경 또는 취소 될 수 있습니다.</p>
	</div>
</div>

<%@include file="../footer.jsp"%>
</body>
</html>