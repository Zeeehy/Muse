<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="resources/css/Main.css">
    <link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
    <style>
        .priceList table {
            width: 100%;
            border-collapse: collapse;
        }
        .priceList th, .priceList td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: left;
            font-size: 14px;
        }
        .priceList th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .priceList .highlight {
            color: red;
        }
        .warning {
            font-size: 14px;
            color: red;
            margin-top: 5px;
        }
        .consent {
            margin-top: 20px;
		    font-size: 13px;
			border: 1px solid;
			padding: 15px;
        }
        .checkbox-group {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>취소수수료 페이지</h1>
    <form>
        <section class="reservWrap">
            <article class="contWrap">
                <header class="step">
                    <h2>04 취소수수료</h2>
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
                    	<div class="priceT" style="padding: 36px 36px 0 36px;">
                    	<p class="stit"><span>취소수수료 동의</span></p>
                    		<div class="priceList">
                    			<table>
					                <thead>
					                    <tr>
					                        <th style="text-align: center;">내용</th>
					                        <th style="text-align: center;">취소일</th>
					                        <th style="text-align: center;">취소수수료</th>
					                    </tr>
					                </thead>
					                <tbody>
					                    <tr>
					                        <td>미발권기간</td>
					                        <td>2024.11.03 ~ 2024.11.10</td>
					                        <td class="highlight">없음</td>
					                    </tr>
					                    <tr>
					                        <td>예매 후 8일~관람일 10일 전까지</td>
					                        <td>2024.11.11 ~ 2024.12.10</td>
					                        <td class="highlight">장당 4,000원 (티켓금액의 10% 한도)</td>
					                    </tr>
					                    <tr>
					                        <td>관람일 9일~7일 전까지</td>
					                        <td>2024.12.11 ~ 2024.12.12</td>
					                        <td class="highlight">티켓금액의 10%</td>
					                    </tr>
					                    <tr>
					                        <td>관람일 6일~3일 전까지</td>
					                        <td>2024.12.13 ~ 2024.12.17</td>
					                        <td class="highlight">티켓금액의 20%</td>
					                    </tr>
					                    <tr>
					                        <td>관람일 2일~1일 전까지</td>
					                        <td>2024.12.18 ~ 2024.12.19</td>
					                        <td class="highlight">티켓금액의 30%</td>
					                    </tr>
					                </tbody>
					            </table>
							    <p class="warning">
							     *취소기간: 2024년 12월 19일(목) 17:00<br>
							     *예매취소는 예매일 이후 취소기한은 별도로 정하지 않습니다.<br>
							     단, 예매 후 당일 12시 이전 취소 시에는 취소수수료 없음(취소기한 내에 한함)
							   	</p>
							   	<div class="consent">
							     <p style="margin-bottom: 15px;"><strong style="font-size: 15px;">개인정보 제3자 정보제공</strong></p>
							     <p>
							        MUSE는 기획사와 이용자 간의 상품 거래를 중개하는 통신판매중개자입니다. 거래과정이 이루어진 이후의 고객정보 관련 책임은 정보 제공에 관한 동의를 확인한 후 발행 내에서 거래 당사자에게 예약에 관한 정보를 제공합니다.
							     </p>
							  </div>
							  <div class="checkbox-group">
							     <input type="checkbox" id="agree-all">
							     <label for="agree-all">모두 동의합니다.</label><br>
							     <input type="checkbox" id="agree-fee">
							     <label for="agree-fee">(필수) 취소수수료/취소기한을 확인하였으며, 동의합니다.</label><br>
							     <input type="checkbox" id="agree-info">
							     <label for="agree-info">(필수) 제3자 정보제공 내용에 동의합니다.</label>
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
