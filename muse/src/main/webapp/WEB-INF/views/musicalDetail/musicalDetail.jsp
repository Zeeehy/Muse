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

</head>
<body>
	<%@include file="../header.jsp"%>
	<!-- main 시작 -->
	<div id="container">
		<div class="contents">
			<div class="productWrapper">
				<div class="productMain">
					<div class="productMainTop">
						<div class="summary">
							<div class="summaryTop">
								<h2 class="prdTitle">${mddto.m_title }</h2>
								<div class="prdSection">
									<div class="tagText">
										<span>뮤지컬</span><span> 주간 1위 . 별별별별별 처리해야됨</span>
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
												<a class="prdCastBtn" href="#"> <c:if
														test="${empty sessionScope.s_id}">
														<img class="cast_icon" alt=""
															src="resources/img/muse_cast/empty_heart.png">
													</c:if> <c:if test="${!empty sessionScope.s_id}">
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
												href="#">두산아트센터 연강홀<i>(자세히)</i></a>
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
									<li class="infoItem infoPrice"><strong class="infoLabel">가격</strong>
									<div class="infoDesc">
											<ul class="infoPriceList">
												<li class="infoPriceItem is-largePrice"><a
													class="infoBtn is-accent" data-popup="info-price"
													role="button" href="#">전체가격보기 <i>(자세히)</i></a></li>
												<li class="infoPriceItem"><span class="name">R석
														처리해야됨</span><span class="price ">88,000원</span></li>
												<li class="infoPriceItem"><span class="name">S석</span><span
													class="price ">66,000원</span></li>
											</ul>
										</div></li>
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
									data-target="REVIEW">관람후기<span class="countNum">999+</span></a></li>
								<li class="navItem"><a class="navLink" href="#"
									data-target="QNA">Q&amp;A<span class="countNum">9</span></a></li>
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
														<img src="${casting.ma_img }" class="castingImage"
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
											 	
											 	<tr data-dow="${casting.mo_date}" data-time="${casting.mo_time}" data-cast="${casting.ma_name}">
											 		<td>${ casting.mo_date}</td>
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


					</div>

					<div id="ADDITIONAL" class="prdContents prdMoreInfo"
						style="display: none;">
						<div class="moreInfoContainer">
							<h4 class="moreInfoTitle">기획사 정보 처리해야함</h4>
							<p>
								주최 알라딘문화산업전문회사, 롯데컬처웍스, 클립서비스 / 제작 S&amp;CO <br>제작투자 대구MBC,
								IBK기업은행, 로간벤처스 / 협찬 메르세데스-벤츠 코리아, 콤텍시스템 <br>공동주관 다날엔터테인먼트 /
								공연문의 1577-3363
							</p>
						</div>

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
									<tr>
										<th>주최/기획</th>
										<td>클립서비스주식회사</td>
										<th>고객문의</th>
										<td>1577-3363</td>
									</tr>
									<tr>
										<th>공연시간</th>
										<td>150 분(인터미션 : 20분)</td>
										<th>관람등급</th>
										<td>8세이상 관람가능</td>
									</tr>
									<tr>
										<th>주연</th>
										<td><span class="moreInfoCast">김준수, 서경수, 박강현, 정성화,
												정원영, 강홍석, 이성경, 민경아, 최지혜, 이상준, 황만익, 윤선용, 임별, 방보용, 양병철</span></td>
										<th>공연장소</th>
										<td>샤롯데씨어터</td>
									</tr>
									<tr>
										<th>예매수수료</th>
										<td>장당 2,000원</td>
										<th>배송료</th>
										<td>현장수령 무료 (배송불가)</td>
									</tr>
									<tr>
										<th>유효기간/이용조건</th>
										<td colspan="3">2024.11.22~2025.06.22 예매한 공연 날짜, 회차에 한해
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
												<li>티켓이 배송된 이후에는 인터넷 취소가 안되며, 취소마감 시간 이전에 티켓이 인터파크 티켓
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
												<li>티켓수령방법을 모바일티켓으로 선택 시 인터파크 앱, 인터파크 티켓 앱에서 즉시 이용
													가능합니다.</li>
												<li>모바일티켓으로 예매하실 경우 종이 티켓으로 입장권 수령방법 변경 불가합니다.</li>
												<li>결제완료(입금완료)후 모바일티켓을 확인할 수 있습니다.</li>
												<li>안드로이드 버전 4.0이상만 사용 가능, iOS 7 이상만 사용 가능합니다.</li>
												<li>스포츠 시즌권 구매고객이거나 인터파크 외 예매처에서 예매한 모바일티켓은 별도의 모바일티켓
													앱을 통해서만 이용 가능합니다.</li>
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
										<th>상호</th>
										<td>클립서비스주식회사</td>
										<th>대표자명</th>
										<td>설도권</td>
									</tr>
									<tr>
										<th>사업자등록번호</th>
										<td>211-86-93404</td>
										<th>E-mail</th>
										<td>clipservicetm@naver.com</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td colspan="3">1577-3363</td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="3">서울특별시 강남구 강남대로 564(논현동) 지하1층,6층(논현동,원빌딩)</td>
									</tr>
								</tbody>
							</table>
							<div class="escrowGuide">
								<strong class="escrowTitle">㈜인터파크 안전결제시스템 <span
									class="is-light">(Escrow System, 에스크로)</span> 안내
								</strong>
								<p class="escrowText">
									인터파크의 모든 상품은 판매자 및 결제 수단의 구분 없이 회원님들의 구매안전을 위해 안전결제시스템을 도입하여
									서비스하고 있습니다.<br>결제대금예치업 등록 : 02-006-00064 <a
										href="//www.fss.or.kr/fss/bbs/B0000392/view.do?nttId=63552&amp;viewType=BODY&amp;menuNo=&amp;sd[…]d=1&amp;searchWrd=%EC%9D%B8%ED%84%B0%ED%8C%8C%ED%81%AC&amp;pageIndex=1"
										class="escrowLink" target="_blank">서비스 가입사실 확인</a>
								</p>
							</div>
						</div>

						<div class="moreInfoContainer">유의사항 등등</div>
					</div>

				</div>
			</div>
			<div class="productSide">
				<div class="stickyWrap">
					<div>
						<img alt="크아악" src="resources/img/musical/matahariDetail.PNG">
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
	navItems.forEach(function(item) {
		item.addEventListener('click', function() {
			console.log("forEach");

			var linkElement = item.querySelector('.navLink');
			var targetDiv = linkElement.dataset.target;

			// 이전 활성화된 항목이 있으면 비활성화
			if (activeItem) {
				activeItem.classList.remove('is-active');
			}

			// 현재 클릭된 항목을 활성화하고, activeItem으로 저장
			item.classList.add('is-active');
			activeItem = item;

			if (targetDiv == "INFO") {
				activeDiv.style.display = 'none';
				activeDiv = document.getElementById(targetDiv);
				activeDiv.style.display = 'block';
			} else if (targetDiv == "ADDITIONAL") {
				activeDiv.style.display = 'none';
				activeDiv = document.getElementById(targetDiv);
				activeDiv.style.display = 'block';

			} else if (targetDiv == "CASTING") {
				activeDiv.style.display = 'none';
				activeDiv = document.getElementById(targetDiv);
				activeDiv.style.display = 'block';
			}
		});
	});

	// 뮤즈캐스트
	var prdCastBtn = document.querySelector(".prdCastBtn");
	var checkLikeMusical = ${checkLikeMusical};
	var s_id = '${sessionScope.s_id}';

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

	var filterSearch = document.querySelector('#filterSearch');
	var dows = document.querySelectorAll(".dow");
	
	var startTimes = document.querySelectorAll(".startTime");
	var castingNames = document.querySelectorAll(".castingName");
	var castingDetailTable = document.querySelector(".castingDetailTable");
	
	filterSearch.addEventListener("click", function(){
		var params = 'm_code=${m_code}&range_start='+range_start.value+'&range_end='+range_end.value;
		sendRequest('getCastingByRange.do',params,function() {
				// 요청 성공 시 추가 처리
		if (XHR.readyState === 4) {
			if (XHR.status === 200) {
				
				alert(1);
				

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
            
            castCells.forEach(function(cell){
            	console.log(cell);
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
	
	
</script>
</html>