<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="resources/css/Main.css">
    <link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
</head>
<body>
    <h1>가격/할인 페이지</h1>
    <form>
        <section class="reservWrap">
            <article class="contWrap">
                <header class="step">
                    <h2>02 가격/할인</h2>
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
                    <aside class="seatL" style="display: flex; flex-direction: column;">
                    	<div class="priceT">
                    	<p class="stit"><span>밀라노석</span> | 좌석 1매를 선택하셨습니다. </p>
                    		<div class="priceList">
                    			
                    			<table>
								    <thead>
								        <tr>
								            <th rowspan="2">기본가</th>
								            <td>일반</td>
								            <td>90,000원</td>
								            <td>
								                <select>
								                    <option>예매</option>
								                </select>
								            </td>
								        </tr>
								    </thead>
								    <tbody>
								        <tr>
								            <th rowspan="3">기본할인</th>
								            <td>국가유공자 할인(본인만) 50%</td>
								            <td>45,000원</td>
								            <td>
								                <select>
								                    <option>예매</option>
								                </select>
								            </td>
								        </tr>
								        <tr>
								            <td>장애인 할인(1~3등급/동반 1인) 50%</td>
								            <td>45,000원</td>
								            <td>
								                <select>
								                    <option>예매</option>
								                </select>
								            </td>
								        </tr>
								        <tr>
								            <td>장애인 할인(4~6등급/본인만) 50%</td>
								            <td>45,000원</td>
								            <td>
								                <select>
								                    <option>예매</option>
								                </select>
								            </td>
								        </tr>
								    </tbody>
								</table>
                    		</div>
                    	</div>
                    	<div class="pointB">
                    		<p class="stit"><span>My Point</span></p>
                    		<div class="pointContainer">
						        <div class="pointCheck">
						            <label>나의 포인트 조회 :</label>
						            <input type="text" value="2000 P" readonly>
						        </div>
						        <div class="pointUse">
						            <label>포인트 사용하기 :</label>
						            <input type="text" value="2000P">
						            <button>사용하기</button>
						        </div>
						    </div>
                    	</div>
                    </aside>
                    <aside class="seatR">
                        <div class="s inf">
                            <h2>나의 예매 정보</h2>
                            <div class="reservmInfo">
                                <div style="display: flex; gap: 15px; flex-direction: row; align-items: stretch;">
                                    <img src="">
                                    <ul class="mInfoList">
                                        <li><span>뮤지컬 [이프덴]</span></li>
                                        <li>2024.09.17 ~ 2024.11.17</li>
                                        <li>홍익대 대학로 아트센터 대극장</li>
                                        <li>중학생 이상 관람가</li>
                                        <li>관람시간 : 160분 </li>
                                    </ul>
                                </div>
                                <table style="margin-top: 15px;">
                                    <tbody>
                                        <tr>
                                            <th>일시</th>
                                            <td>2024년 12월 11일(수) 19:30</td>
                                        </tr>
                                        <tr>
                                            <th>선택좌석<br>(2석)</th>
                                            <td>
                                                <ul class="seatInf">
                                                    <li>밀라노석 1층-A블록 1열 2</li>
                                                    <li>밀라노석 1층-A블록 1열 2</li>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>티켓금액</th>
                                            <td>310,000원</td>
                                        </tr>
                                        <tr>
                                            <th>할인</th>
                                            <td>0원</td>
                                        </tr>
                                        <tr>
                                            <th>포인트</th>
                                            <td><b>2000P</b> 사용</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table>
                                    <tbody>
                                        <tr>
                                            <th>취소기한</th>
                                            <td><b>2024년 12월 16일(월) 17:00</b></td>
                                        </tr>
                                        <tr>
                                            <th>취소 수수료</th>
                                            <td><b>티켓금액의 0~30%</b></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="s Choice">
                            <h2>총 결제 금액</h2>
                            <div>
                                <span><b>310,000원</b></span>
                            </div>
                        </div>
                        <div class="s Button"> 
                            <div class="subBtList">
                                <button class="subBt">이전단계</button>
                                <button class="subBt" style="background: #FF3D32; color: #fff;">다음단계</button>
                            </div>
                        </div>
                    </aside>
                </section>
            </article>
        </section>
    </form>
</body>
</html>
