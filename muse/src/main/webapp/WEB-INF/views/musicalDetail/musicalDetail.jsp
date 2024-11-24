<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />

<title>MUSE</title>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<link rel="stylesheet" type="text/css" href="resources/css/Jinu.css">
<script src="/muse/resources/js/httpRequest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2eeedad15b040c264a695f50e1505ff3&libraries=services"></script>

<style>
tr,th,td {
    font-size: 16px;
}
thead th {color:#ddd; background:none; border:none;  font-weight: 400;}
tbody td {
	color:#3a3a3a; 
	background:none; 
    padding:20px;
    }
td.selected {
	color:#fff;
    background: #ff3d32 !important;
    border-radius: 100%;
}
.productMain{
	width:900px;
}
.productSide {
	width: 450px;	
}
.productWrapper .productSide {
    width: auto !important;
}
.productWrapper .productSide .stickyWrap {
    width: 100%;
    margin: 0 !important; 
}
.prdTitle {
	font-size: 30px;
	margin-bottom: 10px;
}
.infoPriceItem {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 5px;
}

.infoPriceItem img {
    width: 15px;
    height: auto;
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>
	<!-- main 시작 -->
	<div id="container">
		<div class="contents">
			<div class="productWrapper">
				<div class="musical_hall_mapper" style="display:none;">
					<div class="popupHead"><strong class="popupTitle">공연장 정보</strong><button class="popupCloseBtn">X</button></div>
					<div class="popupBody">
							<div class="popPlaceWrap">
							<div class="popPlaceTitle">${mhdto.mh_name }</div>
							<div class="popPlaceInfo">
								<img alt="aaa" src="resources/img/musicial_hall/${mhdto.mh_img }" class="hall_img">
								<p>주소 : <span id="addr"></span> </p>
							</div>
							<div id="map" style="width: 500px; height: 400px;"></div>
						</div>
					</div>
				</div>
				<div class="productMain">
					<div class="productMainTop">
						<div class="summary">
							<div class="summaryTop">
								<h2 class="prdTitle">${mddto.m_title }</h2>
								<div class="prdSection">
									<div class="tagText">
										<span>뮤지컬&nbsp;</span>
										<span> <c:if test="${!empty rank }">주간 <b>${rank }</b>위</c:if> <c:if test="${!empty reviews}"> : </c:if> </span>
										<span> 
											<c:if test="${!empty reviews }">
												<div class="reviewStarTotal">
													<div class="prdStar">
														<div class="prdStarBack">
															<c:forEach begin="1" end="5" var="i">
																<c:choose>
														            <%-- 완전한 별 --%>
														            <c:when test="${i <= Math.floor(reviewAVG)}">
														                <img src="/muse/resources/img/ystar.svg" >
														            </c:when>
														            
														            <%-- 반 별 --%>
														            <c:when test="${i == Math.ceil(reviewAVG) && reviewAVG % 1 >= 0.5}">
														                <span class="ystarHalf"></span>
														                <span class="gstarHalf"></span>
														            </c:when>
														            
														            <%-- 빈 별 --%>
														            <c:otherwise>
														                <img src="/muse/resources/img/gstar.svg" >
														            </c:otherwise>
														        </c:choose>
														   </c:forEach>
														</div>
														<div class="prdStarScore">
														<!-- <span class="blind">평점: </span>9.9</div> -->
														<span class="blind">${reviewAVG }</span>
														</div>
													</div>
												</div>
											</c:if>
										</span>
									</div>
									<div class="prdTitleBottom"></div>
								</div>
							</div>
							<div class="summaryBody">
								<div class="posterBox">
									<div class="posterBoxTop">
										<img src="resources/img/musical/${mddto.m_poster}"
											alt="공연 포스터" width="350px" height="450px">
									</div>
									<div class="posterBoxBottom">
										<div class="prdCast">
											<div class="prdCastWrap">
												<a class="prdCastBtn" href="#"> 
													<c:if
														test="${empty sessionScope.s_id}">
														<img class="cast_icon" alt=""
															src="resources/img/muse_cast/empty_heart.png">
													</c:if>
													<c:if test="${!empty sessionScope.s_id}">
														<c:choose>
															<c:when test="${checkLikeMusical == 1}">
																<img class="cast_icon" alt=""
																	src="resources/img/muse_cast/full_heart.png">
															</c:when>
															<c:otherwise>
																<img class="cast_icon" alt=""
																	src="resources/img/muse_cast/empty_heart.png">
															</c:otherwise>
														</c:choose>
													</c:if> 뮤즈캐스트
												</a>
											</div>
											<p class="prdCastNum">${countLike }</p>
										</div>
									</div>
								</div>
								<ul class="info">
									<li class="infoItem"><strong class="infoLabel">장소</strong>
									<div class="infoDesc">
											<a class="infoBtn" data-popup="info-place" role="button"
												href="#">${mhdto.mh_name }<i>(자세히)</i></a>
										</div></li>
									<li class="infoItem"><strong class="infoLabel">공연기간</strong>
									<div class="infoDesc">
											<p class="infoText">${mddto.m_startdate}
												~${mddto.m_enddate}</p>
										</div></li>
									<li class="infoItem"><strong class="infoLabel">공연시간</strong>
									<div class="infoDesc">
											<p class="infoText">${mddto.m_time}분(인터미션
												${mddto.m_intime }분 포함)</p>
										</div></li>
									<li class="infoItem"><strong class="infoLabel">관람연령</strong>
									<div class="infoDesc">
											<p class="infoText">${mddto.m_age }</p>
										</div></li>
									<li class="infoItem infoPrice">
									    <strong class="infoLabel">가격</strong>
									    <div class="infoDesc">
									        <ul class="infoPriceList">
									            <c:forEach items="${priceList}" var="price">
									                <li class="infoPriceItem">
									                    <div class="grade_img" style="display: flex; align-items: center; gap: 10px;">
									                        <c:choose>
									                            <c:when test="${price.SG_NAME eq 'VIP'}">
									                                <img src="resources/img/reserv/seat_vip.png" style="width: 15px; height: auto;">
									                            </c:when>
									                            <c:when test="${price.SG_NAME eq 'R'}">
									                                <img src="resources/img/reserv/seat_r.png" style="width: 15px; height: auto;">
									                            </c:when>
									                            <c:when test="${price.SG_NAME eq 'S'}">
									                                <img src="resources/img/reserv/seat_s.png" style="width: 15px; height: auto;">
									                            </c:when>
									                            <c:when test="${price.SG_NAME eq 'A'}">
									                                <img src="resources/img/reserv/seat_a.png" style="width: 15px; height: auto;">
									                            </c:when>
									                        </c:choose>
									                        ${price.SG_NAME}석
									                    </div>
									                    <span class="price">${price.SP_PRICE}원</span>
									                </li>
									            </c:forEach>
									        </ul>
									    </div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div id="productMainBody" class="productMainBody">
						<nav class="nav">
							<ul class="navList">
								<li class="navItem  is-active"><a class="navLink" href="#"
									data-target="INFO">공연정보</a></li>
								<li class="navItem"><a class="navLink" href="#"
									data-target="CASTING">캐스팅정보</a></li>
								<li class="navItem"><a class="navLink" href="#"
									data-target="ADDITIONAL">판매정보</a></li>
								<li class="navItem"><a class="navLink" href="#"
									data-target="REVIEW">관람후기
									<span class="countNum">
										 <c:if test="${countReview>999 }">
										 	(999+)
										 </c:if>
										 
										 <c:if test="${countReview<=999 }">
										 	(${countReview })
										 </c:if>
									</span></a></li>
<!-- 								<li class="navItem"><a class="navLink" href="#"
									data-target="QNA">Q&amp;A<span class="countNum">9</span></a></li> -->
							</ul>
						</nav>
						<div id="INFO" class="prdContents detail">
							<div class="content casting">
								<h3 class="contentTitle">캐스팅</h3>
								<div class="expandalbeWrap">
									<ul class="castingList">
										<c:forEach items="${castings }" var="casting">
											<li class="castingItem">
												<div class="castingTop">
													<div class="castingProfile">
														<img src="resources/img/actor/${casting.ma_img }" class="castingImage"
															alt="프로필 사진">
													</div>
													<a class="castingHeartBtn"> <c:if
															test="${empty sessionScope.s_id}">
															<!-- 비로그인 상태: 빈 하트 표시 -->
															<img id="${casting.ma_code }" class="cast_icon"
																alt="빈 하트" src="resources/img/muse_cast/empty_heart.png"
																data-liked="${casting.is_liked }">

														</c:if> <c:if test="${!empty sessionScope.s_id}">
															<!-- 로그인 상태 -->
															<c:choose>
																<c:when test="${casting.is_liked eq 'Y'}">
																	<!-- 로그인 상태이고 좋아요인 경우: 채워진 하트 표시 -->
																	<img id="${casting.ma_code }" class="cast_icon"
																		alt="채워진 하트"
																		src="resources/img/muse_cast/full_heart.png"
																		data-liked="${casting.is_liked }">
																</c:when>
																<c:otherwise>
																	<!-- 로그인 상태이지만 좋아요가 아닌 경우: 빈 하트 표시 -->
																	<img id="${casting.ma_code }" class="cast_icon"
																		alt="빈 하트"
																		src="resources/img/muse_cast/empty_heart.png"
																		data-liked="${casting.is_liked }">
																</c:otherwise>
															</c:choose>
														</c:if>

													</a>
												</div>
												<div class="castingInfo">
													<div class="castingActor">${casting.mc_char }</div>
													<div class="castingName">${casting.ma_name }</div>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="content">
								<h3 class="contentTitle">공지사항</h3>
								<p class="contentDetailText">${mddto.m_notice }</p>
							</div>

							<div class="content description">
								<h3 class="contentTitle">공연상세</h3>
								<p>
									<img alt="" src="resources/img/musical/${mddto.m_detailimg}">
								</p>
							</div>
						</div>

						<div id="CASTING" class="prdContents castingDetail"
							style="display: none;">
							<div class="content">
								<div class="castingDetailGuide">
									<div class="castingDetailGuideText">공연일 및 선호하는 배우별 캐스팅일정을
										조회할 수 있습니다.</div>
									<div class="castingDetailGuideText">캐스팅 일정은 배우 및 제작사의 사정에
										따라 사전공지 없이 변경될 수 있습니다.</div>
								</div>

								<div class="castingDetailFilter">
									<div class="filterItem">
										<strong class="filterTitle">공연 기간</strong>
										<div class="filterContent">
											<div class="filterDateWrap">
												<div class="filterDate">
													<input type="date" id="range_start">
												</div>
												<div class="filterDate">
													<input type="date" id="range_end">
												</div>

											</div>
										</div>
										<a class="filterSearchBtn" role="button" href="#"><span
											class="blind" id="filterSearch">검색</span>
										</a>
									</div>
									<div class="filterItem">
										<strong class="filterTitle">요일</strong>
										<div class="filterContent">
											<c:if test="${!empty dow_screen }">
												<c:forEach items="${ dow_screen}" var="dow">
													<a class="filterLabel dow" data-toggle="self"
														aria-checked="false" role="checkbox" href="#">${dow }</a>
												</c:forEach>
											</c:if>
										</div>
									</div>
									<div class="filterItem">
										<strong class="filterTitle">공연 시간</strong>
										<div class="filterContent">
											<c:forEach items="${startTimes }" var="stime">
												<a class="filterLabel startTime" data-toggle="self"
													aria-checked="false" role="checkbox" href="#" >${stime }</a>
											</c:forEach>
										</div>
									</div>
									<div class="filterItem">
										<strong class="filterTitle">캐스팅</strong>
										<div class="filterContent">
											<c:forEach items="${castings }" var="casting">
												<a class="filterLabel castingName" data-toggle="self"
													aria-checked="true" role="checkbox" href="#"  id="${casting.ma_code }">${casting.ma_name }</a>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="castingDetailResult">
									<table class="castingDetailTable">
										<colgroup>
											<col class="col1">
											<col class="col2">
											<col>
											<col>
											<col>
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th><span>관람일</span></th>
												<th><span>시간</span></th>
												<c:forEach items="${allChar }" var="role">
													<th><span>${role }</span></th>
												</c:forEach>
											</tr>
											<c:set var="preDate" value="" />
											<c:set var="preTime" value="" />
											<c:forEach items="${actorByRound }" var="casting" varStatus="a">
											 <c:if test="${previousDate != casting.mo_date || previousTime != casting.mo_time}">
											 	
											 	<c:if test="${a.index!=0 }">
											 		</tr>
											 	</c:if>
											 	
											 	<tr data-dow="${casting.dow}" data-time="${casting.mo_time}" data-cast="${casting.ma_name}">
											 		<td>${ casting.mo_date}(${casting.dow })</td>
											 		<td>${ casting.mo_time}</td>
											 		<td>${casting.ma_name }</td>
											 	   
											 </c:if>
											 <c:if test="${previousDate == casting.mo_date && previousTime == casting.mo_time}">
											 	<td>${casting.ma_name }</td>
											 </c:if>
											 											    
											    <!-- 현재 값을 이전 값으로 저장 -->
											<c:set var="previousDate" value="${casting.mo_date}" />
											<c:set var="previousTime" value="${casting.mo_time}" />
											</c:forEach>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

						</div>



					<div id="ADDITIONAL" class="prdContents prdMoreInfo"
						style="display: none;">
<!-- 						<div class="moreInfoContainer">
							<h4 class="moreInfoTitle">기획사 정보 처리해야함</h4>
							<p>
								주최 알라딘문화산업전문회사, 롯데컬처웍스, 클립서비스 / 제작 S&amp;CO <br>제작투자 대구MBC,
								IBK기업은행, 로간벤처스 / 협찬 메르세데스-벤츠 코리아, 콤텍시스템 <br>공동주관 다날엔터테인먼트 /
								공연문의 1577-3363
							</p>
						</div> -->

						<div class="moreInfoContainer">
							<h3 class="contentTitle">상품관련 정보</h3>
							<table class="moreInfoTable">
								<caption>상품관련정보 안내</caption>
								<colgroup>
									<col class="col1">
									<col class="col2">
									<col class="col3">
									<col class="col4">
								</colgroup>
								<tbody>
									<!-- <tr>
										<th>주최/기획</th>
										<td>클립서비스주식회사</td>
										<th>고객문의</th>
										<td>1577-3363</td>
									</tr> -->
									<tr>
										<th>공연시간</th>
										<td>${mddto.m_time } 분(인터미션 : ${mddto.m_intime }분)</td>
										<th>관람등급</th>
										<td>${mddto.m_age }</td>
									</tr>
									<tr>
										<th>주연</th>
										<td><span class="moreInfoCast">
											<c:forEach items="${ castings}" var="casting">
												${casting.ma_name }
											</c:forEach>
										</span></td>
										<th>공연장소</th>
										<td>${mhdto.mh_name}</td>
									</tr>
									<tr>
										<th>예매수수료</th>
										<td>장당 2,000원</td>
										<th>배송료</th>
										<td>현장수령 무료 (배송불가)</td>
									</tr>
									<tr>
										<th>유효기간<br>/이용조건</th>
										<td colspan="3">${mddto.m_startdate }~${mddto.m_enddate } 예매한 공연 날짜, 회차에 한해
											이용가능</td>
									</tr>
									<tr>
										<th>예매취소조건</th>
										<td colspan="3">취소일자에 따라서 아래와 같이 취소수수료가 부과됩니다. 예매 일 기준보다
											관람일 기준이 우선 적용됩니다. 단, 예매 당일 밤 12시 이전 취소 시에는 취소수수료가 없으며, 예매
											수수료도 환불됩니다.(취소기한 내에 한함)
											<table class="cancleGuide">
												<colgroup>
													<col>
													<col>
												</colgroup>
												<caption>취소일에 따른 취소수수료안내</caption>
												<thead>
													<tr>
														<th>취소일</th>
														<th>취소수수료</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>예매 후 7일 이내</td>
														<td class="right">없음</td>
													</tr>
													<tr>
														<td>예매 후 8일~관람일 10일전까지</td>
														<td class="right">장당 4,000원(티켓금액의 10%한도)</td>
													</tr>
													<tr>
														<td>관람일 9일전~7일전까지</td>
														<td class="right">티켓금액의 10%</td>
													</tr>
													<tr>
														<td>관람일 6일전~3일전까지</td>
														<td class="right">티켓금액의 20%</td>
													</tr>
													<tr>
														<td>관람일 2일전~1일전까지</td>
														<td class="right">티켓금액의 30%</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<th>취소환불방법</th>
										<td colspan="3"><ul class="moreInfoList">
												<li>My티켓 &gt; 예매/취소내역에서 직접 취소 또는 고객센터 (1544-1555)를 통해서
													예매를 취소할 수 있습니다.</li>
												<li>티켓이 배송된 이후에는 인터넷 취소가 안되며, 취소마감 시간 이전에 티켓이 뮤즈
													고객센터로 반송되어야 취소 가능합니다. 취소수수료는 도착일자 기준으로 부과되며, 배송료는 환불되지
													않습니다.</li>
											</ul></td>
									</tr>
									<tr>
										<th>배송티켓 안내</th>
										<td colspan="3"><ul class="moreInfoList">
												<li>티켓 배송 (배송상태 : 배송 준비중 이후) 후에는 주소 변경이 불가합니다.</li>
												<li>부득이하게 주소 변경이 필요하신 경우 각 배송사에 수취 거절 요청 후,<br>고객센터(1544-1555)로
													재배송 신청할 수 있습니다.(배송비 3,200원 추가 부과)
												</li>
											</ul></td>
									</tr>
									<tr>
										<th>모바일티켓 안내</th>
										<td colspan="3"><ul class="moreInfoList">
												<li>티켓수령방법을 모바일티켓으로 선택 시 뮤즈 앱에서 즉시 이용
													가능합니다.</li>
												<li>결제완료(입금완료)후 모바일티켓을 확인할 수 있습니다.</li>
												<li>안드로이드 버전 4.0이상만 사용 가능, iOS 7 이상만 사용 가능합니다.</li>
											</ul></td>
									</tr>
								</tbody>
							</table>
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
										<td colspan="3">${pdto.pr_name }</td>
									</tr>
									<tr>
										<th>사업자등록번호</th>
										<td colspan="3">${pdto.pr_num }</td>
									</tr>
									<tr>
										<th>E-mail</th>
										<td colspan="3">${pdto.pr_email }</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td colspan="3">${pdto.pr_pnum }</td>
									</tr>
									<!-- <tr>
										<th>주소</th>
										<td colspan="3">서울특별시 강남구 강남대로 564(논현동) 지하1층,6층(논현동,원빌딩)</td>
									</tr> -->
								</tbody>
							</table>
<!-- 							<div class="escrowGuide">
								<strong class="escrowTitle">㈜인터파크 안전결제시스템 <span
									class="is-light">(Escrow System, 에스크로)</span> 안내
								</strong>
								<p class="escrowText">
									인터파크의 모든 상품은 판매자 및 결제 수단의 구분 없이 회원님들의 구매안전을 위해 안전결제시스템을 도입하여
									서비스하고 있습니다.<br>결제대금예치업 등록 : 02-006-00064 <a
										href="//www.fss.or.kr/fss/bbs/B0000392/view.do?nttId=63552&amp;viewType=BODY&amp;menuNo=&amp;sd[…]d=1&amp;searchWrd=%EC%9D%B8%ED%84%B0%ED%8C%8C%ED%81%AC&amp;pageIndex=1"
										class="escrowLink" target="_blank">서비스 가입사실 확인</a>
								</p>
							</div> -->
						</div>

						<div class="moreInfoContainer">유의사항 등등</div>
					</div>
					
					<div id="REVIEW" class="prdContents prdMoreInfo" style="display:none;">
						<div class="prdBbs">
							<div class="bbsNotice">
								<div class="bbsNoticeHead">꼭 읽어주세요.</div>
								<p class="bbsNoticeText">
									게시판 운영 규정에 어긋난다고 판단되는 게시글은 사전 통보없이 블라인드 처리될 수 있습니다.<br>
									특히 티켓 매매 및 양도의 글은 발견 즉시 임의 삭제되며 전화번호, 이메일 등 개인정보는 악용될 우려가 있으므로 게시를 삼가 주시기 바랍니다.<br>
									사전 경고에도 불구하고 불량 게시물을 계속적으로 게재한 게시자의 경우 뮤즈 게시판 작성 권한이 제한됩니다.
								</p>
							</div>
							
							<div class="bbsInfo">
								<c:if test="${!empty reviews }">
									<div class="reviewStarTotal">
										<strong class="reviewStarTitle">관람 평점</strong>
										<div class="prdStar type-total">
											<div class="prdStarBack">
												<c:forEach begin="1" end="5" var="i">
													<c:choose>
											            <%-- 완전한 별 --%>
											            <c:when test="${i <= Math.floor(reviewAVG)}">
											                <img src="/muse/resources/img/ystar.svg" >
											            </c:when>
											            
											            <%-- 반 별 --%>
											            <c:when test="${i == Math.ceil(reviewAVG) && reviewAVG % 1 >= 0.5}">
											                <span class="ystarHalf"></span>
											                <span class="gstarHalf"></span>
											            </c:when>
											            
											            <%-- 빈 별 --%>
											            <c:otherwise>
											                <img src="/muse/resources/img/gstar.svg" >
											            </c:otherwise>
											        </c:choose>
											   </c:forEach>
											</div>
											<div class="prdStarScore">
											<!-- <span class="blind">평점: </span>9.9</div> -->
											<span class="blind">${reviewAVG }</span>
											</div>
										</div>
									</div>
								</c:if>
							
								<c:if test="${!empty best_reviews }">
									<c:forEach items="${best_reviews }" var="review">
										<li class="bbsItem">
										    <div class="bbsContent">
										        <div class="bbsItemHead">
										            <div class="leftSide">
										                	<c:forEach begin="1" end="5" var="i">
																<c:choose>
														            <%-- 완전한 별 --%>
														            <c:when test="${i <= Math.floor(review.mr_score)}">
														                <img src="/muse/resources/img/ystar.svg" >
														            </c:when>
														            
														            <%-- 반 별 --%>
														            <c:when test="${i == Math.ceil(review.mr_score) && review.mr_score % 1 >= 0.5}">
														                <span class="ystarHalf"></span>
														                <span class="gstarHalf"></span>
														            </c:when>
														            
														            <%-- 빈 별 --%>
														            <c:otherwise>
														                <img src="/muse/resources/img/gstar.svg" >
														            </c:otherwise>
														        </c:choose>
														   </c:forEach>
										                
										                
										            </div>
										            <div class="rightSide">
										                <div class="reviewInfo">
										                	<span>${review.u_id } |</span> <span> ${review.mr_date } |</span>
										                	<span class="like_review" data-code="${review.mr_code }">공감 ${review.like_count }</span>  
										                	<span class="heartspan">
											                <c:if test="${review.checkLike=='Y' }">
											                	<img class="cast_icon" alt=""
																			src="resources/img/muse_cast/full_heart.png" data-code = "${review.mr_code }"
																			data-check-like = "${review.checkLike }">
											                </c:if>
											                <c:if test="${review.checkLike=='N' }">
											                	<img class="cast_icon" alt=""
																			src="resources/img/muse_cast/empty_heart.png" data-code = "${review.mr_code }"
																			data-check-like = "${review.checkLike }">
											                </c:if>
										                	</span>
										                </div>
										            </div>
										        </div>
										        <div class="bbsItemBody">
										            <div class="bbsBodyMain">
										                <div class="bbsTitle">
										                    <span class="bastBadge">BEST</span> <strong class="bbsTitleText">${review.mr_title }</strong>
										                </div>
										                <p class="bbsText">
										                    ${review.mr_content }
										                </p>
										            </div>
										        </div>
										    </div>
										</li>
									</c:forEach>
								</c:if>
							<div class="bbsListWrap reviewAll">
								<div class="bbsListHead">
									<div class="leftSide">
										<strong class="bbsTotal">총 <span class="num">${countReview }</span>개의 관람후기가 등록되었습니다.</strong>
									</div>
									<div class="rightSide">
    									<a class="bbsWriteBtn" role="button" href="#">관람후기 작성</a>
									</div>
								</div>
								<c:if test="${empty reviews }">
											<div class="noResult">등록된 리뷰가 없습니다.</div>
								</c:if>
								<ul class="bbsList reviewList">
								
									<c:forEach items="${reviews }" var="review">
										<c:if test="${review.mr_state!=2 }">
									
											<li class="bbsItem">
											    <div class="bbsContent">
											        <div class="bbsItemHead">
											            <div class="leftSide">
											                	<c:forEach begin="1" end="5" var="i">
																	<c:choose>
															            <%-- 완전한 별 --%>
															            <c:when test="${i <= Math.floor(review.mr_score)}">
															                <img src="/muse/resources/img/ystar.svg" >
															            </c:when>
															            
															            <%-- 반 별 --%>
															            <c:when test="${i == Math.ceil(review.mr_score) && review.mr_score % 1 >= 0.5}">
															                <span class="ystarHalf"></span>
															                <span class="gstarHalf"></span>
															            </c:when>
															            
															            <%-- 빈 별 --%>
															            <c:otherwise>
															                <img src="/muse/resources/img/gstar.svg" >
															            </c:otherwise>
															        </c:choose>
															   </c:forEach>
											                
											                
											            </div>
											            <div class="rightSide">
											                <div class="reviewInfo">
											                
											                	
											                	<span>${review.u_id } |</span> <span> ${review.mr_date } |</span>
											                	<span class="like_review" data-code="${review.mr_code }">공감 ${review.like_count }</span>  
											                	<span class="heartspan">
												                <c:if test="${review.checkLike=='Y' }">
												                	<img class="cast_icon" alt=""
																				src="resources/img/muse_cast/full_heart.png" data-code = "${review.mr_code }"
																				data-check-like = "${review.checkLike }">
												                </c:if>
												                <c:if test="${review.checkLike=='N' }">
												                	<img class="cast_icon" alt=""
																				src="resources/img/muse_cast/empty_heart.png" data-code = "${review.mr_code }"
																				data-check-like = "${review.checkLike }">
												                </c:if>
												                
											                	</span>
  
											                </div>
											            </div>
											        </div>
											        <div class="bbsItemBody">
											            <div class="bbsBodyMain">
											                <div class="bbsTitle">
											                    <strong class="bbsTitleText">${review.mr_title }</strong>
											                </div>
											                <p class="bbsText">
											                    ${review.mr_content }
											                </p>
											            </div>
											        </div>
											    </div>
											</li>
										</c:if>						
										<c:if test="${review.mr_state==2 }">
									
											<li class="bbsItem">
											    <div class="bbsContent">
											        
											        <div class="bbsItemBody">
											            <div class="bbsBodyMain">
											                <div class="bbsTitle">
											                    <strong class="bbsTitleText">관리자에 의해 차단된 리뷰입니다.</strong>
											                </div>

											            </div>
											        </div>
											    </div>
											</li>
										</c:if>		
									</c:forEach>		
								</ul>
									<div id="pageNav">${pagingStr }</div>
							</div>
						</div>
					
					</div>

				</div>
								</div>
					
			</div>
			<div class="productSide">
				<div class="stickyWrap">
					<div>
						<%@ include file="reserveCal.jsp" %>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>

<!-- main 포스터 -->
<script>
	var navItems = document.querySelectorAll(".nav .navList .navItem");
	var activeItem = document.querySelector(".nav .navList .navItem.is-active"); // 처음부터 활성화된 항목이 있을 수 있음
	var activeDiv = document.querySelector("#INFO");
	
	// 카테고리 활성화
	navItems.forEach(item => {
    item.addEventListener('click', () => {
        const linkElement = item.querySelector('.navLink');
        const targetDiv = linkElement.dataset.target;
        
        // 이전 활성화된 항목 비활성화
        if (activeItem) {
            activeItem.classList.remove('is-active');
        }
        
        // 현재 항목 활성화
        item.classList.add('is-active');
        activeItem = item; // activeItem 업데이트 추가
        
        // 현재 활성화된 div 숨기기
        if (activeDiv) {
            activeDiv.style.display = 'none';
        }
        
        // 새로운 div 표시
        const newDiv = document.getElementById(targetDiv);
        if (newDiv) {
            newDiv.style.display = 'block';
            activeDiv = newDiv;
        }
    });
});

	// 뮤즈캐스트
	var prdCastBtn = document.querySelector(".prdCastBtn");
	var checkLikeMusical = ${checkLikeMusical};
	//var s_id = '${sessionScope.s_id}';

	// 뮤지컬 뮤즈캐스트 등록 및 취소
	prdCastBtn.addEventListener("click", function() {

		if (s_id) {
			if (checkLikeMusical == 1) {
				checkLikeMusical -= 1;
			} else {
				checkLikeMusical += 1;
			}

			var params = 'm_code=${mddto.m_code}';
			params += "&checkLikeMusical=" + checkLikeMusical;
			sendRequest('changeLikeMusical.do', params, showCheckLikeMusical,
					'GET');
		} else {
			if (confirm('로그인을 하신 후 서비스 이용이 가능합니다. 로그인하시겠습니까?')) {
				window.location.href = 'memberLogin.do';
			}
		}

	});

	function showCheckLikeMusical() {
		if (XHR.readyState === 4) {
			if (XHR.status === 200) {

				var countLike = XHR.responseText;
				var data = JSON.parse(countLike);

				console.log(data);
				var cast_icon = document.querySelector('.cast_icon');
				var prdCastNum = document.querySelector('.prdCastNum');

				prdCastNum.innerHTML = data.countLike;
				if (cast_icon.src.includes('full')) {
					cast_icon.src = 'resources/img/muse_cast/empty_heart.png';
				} else {
					cast_icon.src = 'resources/img/muse_cast/full_heart.png';
				}

			}
		}
	}

	var castingHeartBtns = document.querySelectorAll(".castingHeartBtn img");
	castingHeartBtns.forEach(function(castingHeart) {
				castingHeart.addEventListener("click",function(event) {
									if (s_id) {
										// UI를 먼저 업데이트 (즉시 피드백)

										// 서버 요청 (서버에 실제 데이터 변경 요청)
										var params = 'ma_code='
												+ castingHeart.id;
										params += "&is_liked="
												+ castingHeart.dataset.liked;
										sendRequest('changeLikeActor.do',params,function() {
													// 요청 성공 시 추가 처리
													if (XHR.readyState === 4) {
														if (XHR.status === 200) {

															if (castingHeart.dataset.liked === 'Y') {
																castingHeart.src = 'resources/img/muse_cast/empty_heart.png';
																castingHeart.dataset.liked = 'N';
															} else {
																castingHeart.src = 'resources/img/muse_cast/full_heart.png';
																castingHeart.dataset.liked = 'Y';
															}
															


														}
													}
												}, 'GET');
									} else {
										if (confirm('로그인을 하신 후 서비스 이용이 가능합니다. 로그인하시겠습니까?')) {
											window.location.href = 'memberLogin.do';
										}
									}
								});

			});
	
	var review_casts = document.querySelectorAll('.reviewInfo .cast_icon');

	review_casts.forEach(function(cast) {
	    cast.addEventListener("click", function() {
	        
	    	if (s_id) {
	    		alert(cast.dataset.checkLike);
				var params = 'mr_code='
						+ cast.dataset.code;
				params += "&checkLike="
						+ cast.dataset.checkLike;
				sendRequest('changeLikeReview.do',params,function() {
							// 요청 성공 시 추가 처리
							if (XHR.readyState === 4) {
								if (XHR.status === 200) {

									if (cast.dataset.checkLike === 'Y') {
										cast.src = 'resources/img/muse_cast/empty_heart.png';
										cast.dataset.checkLike = 'N';
									} else {
										cast.src = 'resources/img/muse_cast/full_heart.png';
										cast.dataset.checkLike = 'Y';
									}
									var countLike = XHR.responseText;
									var data = JSON.parse(countLike);
									var countLikeSpan = document.querySelector(".like_review[data-code='" + cast.dataset.code + "']");
									countLikeSpan.innerText='공감 ' +data.result;
									
									console.log(data);
								}
							}
						}, 'GET');
			} else {
				if (confirm('로그인을 하신 후 서비스 이용이 가능합니다. 로그인하시겠습니까?')) {
					window.location.href = 'memberLogin.do';
				}
			}
	    	
	    });
	});
	
	
	// 캐스팅 필터링 날짜 기본 세팅
	var range_start = document.querySelector('#range_start');
	var range_end = document.querySelector('#range_end');

	const setToday = new Date();
	const setAfterTMonth = new Date();
	setAfterTMonth.setMonth(setToday.getMonth() + 2); // 현재 달에 1을 더해 한 달 후로 설정

	const formattedStartDate = setToday.toISOString().split('T')[0];
	const formattedEndDate = setAfterTMonth.toISOString().split('T')[0];

	range_start.value = formattedStartDate;

	range_end.value = formattedEndDate;
	
	
	//
	
	function formatDate(timestamp) {
   const date = new Date(timestamp);
   const year = date.getFullYear();
   const month = String(date.getMonth() + 1).padStart(2, '0');
   const day = String(date.getDate()).padStart(2, '0');
   return year+'-'+month+'-'+day;
}

	var filterSearch = document.querySelector('#filterSearch');
	var dows = document.querySelectorAll(".dow");
	
	var startTimes = document.querySelectorAll(".startTime");
	var castingNames = document.querySelectorAll(".castingName");
	var castingDetailTable = document.querySelector(".castingDetailTable");

	filterSearch.addEventListener("click", function(){
	    var params = 'm_code=${mddto.m_code}&range_start='+range_start.value+'&range_end='+range_end.value;
	    sendRequest('getCastingByRange.do', params, function() {
	        if (XHR.readyState === 4 && XHR.status === 200) {
	        	
	        	alert(1);
	            const response = JSON.parse(XHR.responseText);
	            const castings = response.actorByRound;
	            const allChars = response.allChar;
	            
	            // 테이블 body 초기화
	            const tbody = document.querySelector('tbody');
	            tbody.innerHTML = '';
	            
	            // 헤더 행 생성
	            let headerRow = '<tr>' +
	                          '<th><span>관람일</span></th>' +
	                          '<th><span>시간</span></th>';
	            allChars.forEach(function(char) {
	                headerRow += '<th><span>' + char + '</span></th>';
	            });
	            headerRow += '</tr>';
	            tbody.innerHTML = headerRow;
	            
	            // 캐스팅 정보 행 생성
	            let previousDate = '';
	            let previousTime = '';
	            let currentRow = null;
	            
	            castings.forEach(function(casting, index) {
	                if (previousDate !== casting.mo_date || previousTime !== casting.mo_time) {
	                    // 첫 행이 아니면 이전 행 닫기
	                    if (index !== 0) {
	                        tbody.appendChild(currentRow);
	                    }
	                    
	                    // 새로운 행 시작
	                    currentRow = document.createElement('tr');
	                    currentRow.setAttribute('data-dow', casting.dow);
	                    currentRow.setAttribute('data-time', casting.mo_time);
	                    currentRow.setAttribute('data-cast', casting.ma_name);
	                    
	                    // 날짜와 시간 셀 추가
	                    currentRow.innerHTML = 
	                        '<td>' + formatDate(casting.mo_date) + '(' + casting.dow + ')</td>' +
	                        '<td>' + casting.mo_time + '</td>' +
	                        '<td>' + casting.ma_name + '</td>';
	                } else {
	                    // 같은 날짜/시간이면 배우 이름만 추가
	                    const td = document.createElement('td');
	                    td.textContent = casting.ma_name;
	                    currentRow.appendChild(td);
	                }
	                
	                previousDate = casting.mo_date;
	                previousTime = casting.mo_time;
	            });
	            
	            // 마지막 행 추가
	            if (currentRow) {
	                tbody.appendChild(currentRow);
	            }
	        }
	    }, 'GET');
	});
	
	addFilterListeners(dows);
    addFilterListeners(startTimes);
    addFilterListeners(castingNames);

    function addFilterListeners(elements) {
        elements.forEach(function(element) {
            element.addEventListener("click", function(event) {
                event.preventDefault(); // 기본 동작 방지
                filteringEvent(event);
            });
        });
    }
	
	
    function filteringEvent(event) {
        event.preventDefault();
        const target = event.target;
        target.classList.toggle('is-toggled');

        // 현재 선택된 모든 필터 가져오기
        const selectedDows = Array.from(document.querySelectorAll('.dow.is-toggled')).map(el => el.textContent);
        const selectedTimes = Array.from(document.querySelectorAll('.startTime.is-toggled')).map(el => el.textContent);
        const selectedCasts = Array.from(document.querySelectorAll('.castingName.is-toggled')).map(el => el.textContent);

        // 데이터가 있는 행만 선택 (헤더 제외)
        const rows = document.querySelectorAll('.castingDetailTable tbody tr[data-dow]');
        
        rows.forEach(row => {
        	
            const castCells = Array.from(row.cells).slice(2);
            
            castCells.forEach(cell => {
                cell.style.fontWeight = 'normal';  // 스타일 초기화
                if(selectedCasts.includes(cell.textContent.trim())) {
                    cell.style.fontWeight = 'bold';  // 선택된 배우 bold 처리
                }
            });
            
            // data 속성에서 값을 가져옴
            const dow = row.dataset.dow;  // data-dow 값
            const time = row.dataset.time;  // data-time 값
            
            // 모든 배우 이름을 가져옴 (3번째 셀부터 끝까지)
            const casts = Array.from(row.cells).slice(2).map(cell => cell.textContent.trim());

            // 필터 조건 확인
            const dowMatch = selectedDows.length === 0 || selectedDows.includes(dow);
            const timeMatch = selectedTimes.length === 0 || selectedTimes.includes(time);
            const castMatch = selectedCasts.length === 0 ||casts.some(cast => selectedCasts.includes(cast));
			
            

            
            // 모든 조건을 만족하는 경우에만 표시
            if (dowMatch && timeMatch && castMatch) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
            

            
        });
    }
    
    var hall_popup = document.querySelector(".musical_hall_mapper");
    document.querySelector(".popupCloseBtn").addEventListener("click", function(){
    	hall_popup.style.display = 'none';
    });
	
    document.querySelector(".infoBtn").addEventListener("click", function(){
    	hall_popup.style.display = 'block';
    });
    
    //페이징
    
function showNotice(cr){
    var params = 'crpage='+cr+'&m_code=${mddto.m_code}';
    sendRequest('reviewList.do', params, function(){
        if (XHR.readyState === 4) {
            if (XHR.status === 200) {
                var data = JSON.parse(XHR.responseText);
                var html = '';
                
                data.reviews.forEach(function(review) {
                    if(review.mr_state != 2) {
                        html += '<li class="bbsItem">';
                        html += '    <div class="bbsContent">';
                        html += '        <div class="bbsItemHead">';
                        html += '            <div class="leftSide">';
                        
                        // 별점 처리
                        for(let i = 1; i <= 5; i++) {
                            if(i <= Math.floor(review.mr_score)) {
                                html += '<img src="/muse/resources/img/ystar.svg">';
                            } else if(i == Math.ceil(review.mr_score) && review.mr_score % 1 >= 0.5) {
                                html += '<span class="ystarHalf"></span>';
                                html += '<span class="gstarHalf"></span>';
                            } else {
                                html += '<img src="/muse/resources/img/gstar.svg">';
                            }
                        }
                        
                        html += '            </div>';
                        html += '            <div class="rightSide">';
                        html += '                <div class="reviewInfo">';
                        html += '                    <span>' + review.u_id + ' |</span>';
                        html += '                    <span> ' + formatDate(review.mr_date) + ' |</span>';
                        html += '                    <span class="like_review" data-code="' + review.mr_code + '">공감 ' + review.like_count + '</span>';
                        html += '                    <span class="heartspan">';
                        
                        // 좋아요 하트 이미지
                        if(review.checkLike == 'Y') {
                            html += '<img class="cast_icon" alt="" src="resources/img/muse_cast/full_heart.png"';
                        } else {
                            html += '<img class="cast_icon" alt="" src="resources/img/muse_cast/empty_heart.png"';
                        }
                        html += ' data-code="' + review.mr_code + '" data-check-like="' + review.checkLike + '">';
                        
                        html += '                    </span>';
                        html += '                </div>';
                        html += '            </div>';
                        html += '        </div>';
                        html += '        <div class="bbsItemBody">';
                        html += '            <div class="bbsBodyMain">';
                        html += '                <div class="bbsTitle">';
                        html += '                    <strong class="bbsTitleText">' + review.mr_title + '</strong>';
                        html += '                </div>';
                        html += '                <p class="bbsText">';
                        html += '                    ' + review.mr_content;
                        html += '                </p>';
                        html += '            </div>';
                        html += '        </div>';
                        html += '    </div>';
                        html += '</li>';
                    } else {
                        // 차단된 리뷰
                        html += '<li class="bbsItem">';
                        html += '    <div class="bbsContent">';
                        html += '        <div class="bbsItemBody">';
                        html += '            <div class="bbsBodyMain">';
                        html += '                <div class="bbsTitle">';
                        html += '                    <strong class="bbsTitleText">관리자에 의해 차단된 리뷰입니다.</strong>';
                        html += '                </div>';
                        html += '            </div>';
                        html += '        </div>';
                        html += '    </div>';
                        html += '</li>';
                    }
                });
                
                // 생성된 HTML을 페이지에 삽입
                document.querySelector('.bbsList').innerHTML = html;
                
                // 페이징 문자열 삽입
                document.getElementById('pageNav').innerHTML = data.pagingStr;
            }
        }
    }, 'GET');
}


</script>

<script type="text/javascript">
window.onload = function() {

	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(${mhdto.mh_x}, ${mhdto.mh_y}), //지도의 중심좌표.
		level: 5 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options);
	
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(${mhdto.mh_x}, ${mhdto.mh_y}),
        map: map
    });
    
    
    var geocoder = new kakao.maps.services.Geocoder();

    geocoder.coord2Address( ${mhdto.mh_y},${mhdto.mh_x}, function(result, status) {
    	if (status === kakao.maps.services.Status.OK) {
            var address = result[0].address.address_name;
            document.querySelector('#addr').innerText = address;
            console.log('주소는 ' + address);
            // 상세 정보도 확인해볼 수 있습니다
        } else {
            alert('주소 변환 실패: ' + status);
        }
    });
    
}
</script>
</html>