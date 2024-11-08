<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
</head>
<body>
<h1>예매페이지</h1>
<form>
    <section class="reservWrap">
        <article class="contWrap">
            <header class="step">
                <h2>01 좌석 선택</h2>
                <h3>뮤지컬[시라노] <span>| 홍익대 대학로 아트센터 대극장</span></h3>
                <div class="select">
                	<em>다른 관람일자 선택 : </em>
                	<span>일자</span>
                	<select id="playDate">
                		<option>선택하세요!</option>
                	</select>
                	<span>시간</span>
                	<select id="playTime">
                		<option>선택하세요!</option>
                	</select>
                </div>
            </header>
            <section class="allSeat">
                <aside class="seatL"></aside>
                <aside class="seatR">
                	<div class="s Floor">
                		<h2>원하시는 좌석 위치를 선택해주세요.</h2>
                		<div>
                			<ul>
                				<li>1F <input type="checkbox"></li>
                				<li>2F <input type="checkbox"></li>
                				<li>3F <input type="checkbox"></li>
                			</ul>
                		</div>
                	</div>
                	<div class="s Rating">
                		<h2>좌석등급 / 잔여석</h2>
                		<div>
                			<ul>
                				<li>
                					<div>
		                				<img src="#">VIP석
		                				<span>0석</span>	
	                				</div>
	                				<span>170,000원</span>
                				</li>
                				<li>
                					<div>
		                				<img src="#">R석
		                				<span>0석</span>	
	                				</div>
	                				<span>140,000원</span>
                				</li>
                				<li>
                					<div>
		                				<img src="#">S석
		                				<span>0석</span>	
	                				</div>
	                				<span>110,000원</span>
								</li>
                				<li>
                					<div>
		                				<img src="#">A석
		                				<span>0석</span>	
	                				</div>
	                				<span>80,000원</span>
                				</li>
                			</ul>
                		</div>
                	</div>
                	<div class="s Choice">
                		<h2>선택좌석 </h2>
                		<div></div>
                	</div>
                	<div class="s Button">
                		<button class="nextBt">좌석선택완료</button>
                		<div class="subBtList">
                			<button class="subBt">이전단계</button>
                			<button class="subBt">좌석 다시 선택</button>
                		</div>
                	</div>
                </aside>
            </section>
        </article>
    </section>
</form>
</body>
</html>