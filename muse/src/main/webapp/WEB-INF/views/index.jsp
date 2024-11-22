<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
<!-- Slick CSS -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<title>MUSE</title>
<!-- jQuery (Slick이 필요로 함) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Slick JavaScript -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- main 포스터 -->
 <script>
 function formatDate(dateString) {
	    const date = new Date(dateString); // 서버에서 받은 날짜 문자열을 Date 객체로 변환
	    const year = date.getFullYear();
	    const month = String(date.getMonth() + 1).padStart(2, '0');
	    const day = String(date.getDate()).padStart(2, '0');
	    return year + '-' + month + '-' + day;
	}
 
 $(document).ready(function() {
	    // '뮤지컬 전체보기' 버튼 클릭 시 추가 데이터를 요청
	    $("#loadMore").on("click", function() {
	        var page = $(this).data("page");  // 현재 페이지 정보 가져오기
	        $("#entire_look").hide();         
	        console.log(page);
	        
	        $.ajax({
	            url: "loadMoreMusicals.do",  // Ajax 요청 URL
	            type: "GET",
	            data: { page: page },  // page 번호를 요청 파라미터로 전송
	            dataType: "json", // JSON 응답을 기대
	            success: function(response) {
	            	
	            	
	                // 서버에서 받아온 데이터를 이용해 화면에 추가
	                var musicals = response.main_musicallist;
	                
	                // 뮤지컬 리스트 항목을 반복문으로 동적으로 추가
	                musicals.forEach(function(musical) {
	                	 // 날짜를 형식에 맞게 변환
	                    var formattedStartDate = formatDate(musical.m_startdate);               	 
	                    var formattedEndDate = formatDate(musical.m_enddate);
	                    
	                    var musicalItem = `<div class="screening-item all">
	                            						<div class="thumbnail">
								                            <a href="musicalDetail.do?m_code=\${musical.m_code}">
								                                <img src="resources/img/musical/\${musical.m_poster}" alt="공연 포스터" width="250px" height="440px">
								                            </a>
							                            </div>
							                            <div class="title">\${musical.m_title}</div>
							                            <div class="meta">\${musical.mh_name}  <br> \${formattedStartDate} ~ \${formattedEndDate}</div>
							                        </div>
	                    						`;
	                    
	                    // .screening-container.all의 마지막에 새 항목을 추가
	                    $(".screening-container.all").append(musicalItem);
	                });		
	             	
	            },
	            error: function(xhr, status, error) {
	                console.error("데이터 로딩 실패: ", error);
	            }
	        });
	    });
	});
    </script>
<script>
$(document).ready(function() {
    // 첫 번째 슬라이더 (What's on 섹션)
    $('.screening-container:not(.open):not(.all)').slick({
        slidesToShow: 4,       // 한 번에 보이는 슬라이드 개수
        slidesToScroll: 1,     // 한 번에 스크롤되는 슬라이드 개수
        arrows: true,          // 좌우 탐색 버튼 활성화
        dots: false,           // 페이지네이션(하단 점) 비활성화
        infinite: true         // 무한 루프
    });

    // 두 번째 슬라이더 (Ticket Open 섹션)
    $('.screening-container.open').slick({
        slidesToShow: 4,       // 한 번에 보이는 슬라이드 개수
        slidesToScroll: 1,     // 한 번에 스크롤되는 슬라이드 개수
        arrows: true,          // 좌우 탐색 버튼 활성화
        dots: false,           // 페이지네이션(하단 점) 비활성화
        infinite: true         // 무한 루프
    });
});
</script>
</head>
<body>
<%@include file="header.jsp" %>
	<!-- main 시작 -->
	 <div class="content">
        <article class="whatsOn">
        <!--<a href="myPageMuseCalendar.do" class="calender"><img src="resources/img/main/calender.png">공연일정 전체보기</a> <!-- 캘린더 -->          
            <h2>What's on</h2>
            <div class="screening-container">           
	            <!-- main_banner 데이터 반복문으로 출력 -->
	        	<c:forEach var="banner" items="${main_banner}">
	                <div class="screening-item">
	                    <div class="thumbnail"><a href="musicalDetail.do?m_code=${banner.m_code}"><img src="resources/img/musical/${banner.m_poster}"alt="공연 포스터" width="352.78px" height="440px"></a></div>
	                    <div class="title">${banner.m_title}</div>
	                    <div class="meta">${banner.mh_name}  |  ${banner.m_startdate} ~ ${banner.m_enddate}</div>
	                </div>
	            </c:forEach>                
            </div>  
        </article>
        
        
        <article class="ticketOpen">
        	<h2>Ticket Open</h2>    
        	<div class="screening-container open">
        	  	<!-- main_ticketopen 데이터 반복문으로 출력 -->
        		<c:forEach var="ticketopen" items="${main_ticketopen}">
	                <div class="screening-item open" >
	                    <div class="thumbnail"><a href="openNoticeView.do?on_code=${ticketopen.on_code}"><img src="resources/img/musical/${ticketopen.m_poster}"alt="공연 포스터" width="277.78px" height="440px"></a></div>
	                    <div class="title">${ticketopen.m_title}</div>

	                    <div class="meta red" style="height: 32px;"><p style="color:#444; margin-bottom: 5px;">일반 오픈 : ${ticketopen.on_open}</p>	                    
						   <c:if test="${ticketopen.on_muse_open != '없음'}">
						   <p> 뮤즈패스 오픈 : ${ticketopen.on_muse_open}</p>
						   </c:if>
	                    </div>
	                    <div class="meta gray">${ticketopen.on_type}</div>
	                </div>     
                </c:forEach>      
            </div>          
            <div class="bt ticketOpen">
            	<a href="openNotice.do">티켓 오픈 전체보기 <i class="fa-solid fa-angle-right"></i></a>
            </div> 
        </article>
        
        
        <div class="mainBanner">
        	<a href="musepass.do">
	        	<div class="txt">
	        		<p class="txt01">
		        	공연 선예매와 선 지급 포인트 15000P, 리뷰 적립 포인트 2배 등의
		        	</p>
		        	<p class="txt02">
		        	특별한 <b style="color:#FCBA10;">혜택</b>이 가득, <b style="color:#FF3D32;">뮤즈패스</b>에 가입해보세요!
		        	</p>
		        </div>
	        	<img src="resources/img/main/banner.png">
	        </a>
        </div>
        
        
        <article class="bestReview" style="padding-bottom: 50px;">
        	<h2>Best Review</h2>
        	<div class="reviewcont">
        		<ul class="cont">
        			<!-- main_bestreview 데이터 반복문으로 출력 -->
        			<c:forEach var="bestreview" items="${main_bestreview}">
	        			<li>
	        				<a href="musicalDetail.do?m_code=${bestreview.m_code}">        		
	        					<div class="reviewposter">
	        						<img src="resources/img/musical/${bestreview.m_poster}"alt="공연 포스터" width="300px" height="352.78px">
	        					</div>
	        					<div class="reviewtxt">
	        						<ul>
	        							<li class="name">${bestreview.m_title}</li>
	        							<li class="title"><b>${bestreview.mr_title}</b></li>
	        							<li class="content">${bestreview.mr_content}</li>
	        							<li class="inf">
	        								<span>${bestreview.u_id}</span>
	        								<span><img src="resources/img/ystar.svg"alt="별" width="12px" height="12px"></span>
	        								<span>(${bestreview.mr_score})</span>
	        							</li>
	        						</ul>
	        					</div>
	        				</a>
	        			</li>
        			</c:forEach>      
        		</ul>
        	</div>
        </article>
        
        
        <article class="alltheMusical">
        	<h2>All the musicals</h2>
        	<div class="screening-container all">
        		<!-- main_musicallist 데이터 반복문으로 출력 -->
        		<c:forEach var="musicallist" items="${main_musicallist}">
	                <div class="screening-item all">
	                     	<div class="thumbnail"><a href="musicalDetail.do?m_code=${musicallist.m_code}"><img src="resources/img/musical/${musicallist.m_poster}"alt="공연 포스터" width="250px" height="440px"></a></div>
		                    <div class="title">${musicallist.m_title}</div>
		                    <div class="meta red"><p style="color:#000; margin-bottom:5px;">${musicallist.mh_name}</p>  ${musicallist.m_startdate} ~ ${musicallist.m_enddate}</div>
	                </div>
                </c:forEach>               
            </div> 
            <!-- 전체보기 버튼 -->
            <div id="entire_look" class="bt ticketOpen">
                <a href="javascript:void(0);" id="loadMore" data-page="2">뮤지컬 전체보기<i class="fa-solid fa-angle-right"></i></a>
            </div>
        </article>
    </div>
<%@include file="footer.jsp" %>
</body>
</html>