<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="resources/css/Main.css">
    <link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
    <style>
        .priceList  {
            background: #fff;
  			padding: 25px;
        }
        .priceList table {
            width: 100%;
            border-collapse: collapse;
        }
        .priceList th, .priceList td {
            padding: 8px;
            text-align: center;
            font-size: 14px;
        }
        .priceList td input {
            width: 100%;
            padding: 5px;
            box-sizing: border-box;
            border: none;
            color: #333;
            font-size: 14px;
        }
        .warning {
            font-size: 12px;
            color: red;
            margin-top: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>예매자 확인 페이지</h1>
    <form>
        <section class="reservWrap">
            <article class="contWrap">
                <header class="step">
                    <h2>03 예매자 확인</h2>
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
                    	<p class="stit"><span>예매자 확인</span></p>
                    		<div class="priceList">
                    			<table>
	                    			<tr>
					                    <th>이름</th>
					                    <td><input type="text" value="고유리" readonly></td>
					                </tr>
					                <tr>
					                    <th>생년월일</th>
					                    <td>
						                    <input type="text" style="background-color: #eaeaea;" value="">
						                    <p class="warning">*생년월일을 정확히 입력하세요. 본인 확인이 되지 않아 예매가 불가능 합니다.</p>
					                    </td>
					                </tr>
					                <tr>
					                    <th>연락처</th>
					                    <td><input type="text" value="010 - 0000 - 0000" readonly></td>
					                </tr>
					                <tr>
					                    <th>이메일</th>
					                    <td><input type="text" value="abcd@naver.com" readonly></td>
					                </tr>
					            </table>
	                    	</div>
	                    	</div>
                    	<div class="pointB" style="padding: 15px 36px;">
                    		<p class="stit"><span>티켓 수령 방법</span></p>
                    		<div style="padding: 25px; background: #fff;">
                    			<p style="color: #FF3D32; text-align:center;" ><b style="font-size: 20px; margin-right: 25px;">현장수령</b> 예매시 부여되는 "예약번호"로 관람일 당일 티켓을 수령하여 입장합니다.</p>
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
