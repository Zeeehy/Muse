<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<link rel="stylesheet" type="text/css" href="resources/css/Jinu.css">
</head>
<body>
<%@include file="../header.jsp"%>



<div class="board">
	<div class="content">
	<div class="detail_top">
		<h2>티켓 공지</h2>
		<div class="btn_top"> <a href="openNotice.do?crpage=${crpage} ">목록보기</a> </div>
	</div>
	<div class="info">
		<span class="poster bgMusical">
			<img src="resources/img/musical/${ondto.m_poster }" alt="${ondto.m_title } 포스터">
		</span>
		<div class="infTxt"style="width:100%; position: relative;">
			<div>
				<h3>${ondto.m_title }</h3>
				<ul>
					<li class="open"><strong>티켓오픈일</strong>${ondto.on_open }  <!--2013년 6월 12일(수) 오후 8시--></li>
					<c:if test="${!empty ondto.on_muse_open }">
					<li class="tiki">
						<strong>뮤즈패스 선예매</strong>${ondto.on_muse_open } 
							<span>
								<a href="musepass.do">뮤즈패스 가입</a>
							</span>
					</li>
					</c:if>
				</ul>
			</div>
			<span class="count">조회수 : <span>${ondto.on_readnum }</span></span>
			<div class="Pbtn">
				
				<a href="musicalDetail.do?m_code=${ondto.m_code }" class="btn_book">예매하기</a>
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
										<td>${pdto.pr_name }</td>
									</tr>
									<tr>
										<th>사업자등록번호</th>
										<td>${pdto.pr_num }</td>
									</tr>
									<tr>
										<th>E-mail</th>
										<td>${pdto.pr_email }</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td colspan="3">${pdto.pr_pnum }</td>
									</tr>
								</tbody>
							</table>
						</div>
	</div>
	<div class="txt_guide">
		<p>티켓오픈일정은 인터파크 또는 기획사의 사정에 의해 사전예고 없이 변경 또는 취소 될 수 있습니다.</p>
	</div>
	</div>
</div>

<%@include file="../footer.jsp"%>
</body>
</html>