<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="resources/css/Main.css">
    <link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
    <style>
        .reservWrap .allSeat {
            width: auto;
		    padding: 36px 0 36px 36px;
		    gap: 36px;
        }
        .reserv-container h2 {
            font-size: 18px;
            padding: 0 0 15px 0;
        }
        .reserv-container {
            background: #fff;
            padding: 30px;
        }
        .reservImg {
            float: left;
            margin-top: 15px;
            width: 220px;
    		height: 270px;
		    background: #000;
        }
        .reservTxt {
       		width: 70%;
            float: right;
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-top: 15px;
        }
        .reserv-header {
            background: #F66904;
            color: #fff;
            padding: 10px 20px;
        }
        .reservWrap .allSeat table td {
            width: auto;
            font-size: 12px;
            padding: 9px;
        }
        .additional-info {
            width: 50%;
        }
        .additional-info th {
            width: 50px;
            font-size: 10px;
            font-weight: 400;
            background: #F2F2F2;
            padding: 10px;
        }
        .reservWrap .allSeat table th {
		    background: #D9D9D9;
		    font-size: 13px;
		}
		.reservWrap .allSeat table td.label {
		    background: #f2f2f2;
		}
		.subBtList {
		    padding-top: 0px;
		}
		.reservWrap .allSeat .seatR {
		    justify-content: flex-end;
		}
    </style>
</head>
<body>
    <h1>취소수수료 페이지</h1>
    <form>
        <section class="reservWrap">
            <article class="contWrap">
                <header class="step">
                    <h2>05 결제완료</h2>
                    <h3>뮤지컬[시라노] <span>| 홍익대 대학로 아트센터 대극장</span></h3>
                </header>
                <section class="allSeat">
                    <aside class="seatL" style="display: flex; flex-direction: column;">
                        <div class="reserv-container">
                            <p class="reserv-header">예약번호 | TJKDSKLF87 (총 ${seatList.size()}매)</p>
                            <div class="reservImg">
                                <img style="width: 100%;" src="resources/img/musical/${musicalInfo.M_POSTER}" alt="${musicalInfo.M_TITLE} 포스터">
                            </div>
                            <div class="reservTxt">
                                <table class="reserv-table">
                                    <tr>
                                        <td class="label">공연명</td>
                                        <td class="value">${musicalInfo.M_TITLE}</td>
                                    </tr>
                                    <tr>
                                        <td class="label">장소</td>
                                        <td class="value">${musicalInfo.MH_NAME}</td>
                                    </tr>
                                    <tr>
                                        <td class="label">좌석</td>
                                        <td class="value">
                                        <ul class="seatInf">
                                           <c:forEach items="${seatList}" var="seat">
                                              <li>
											  ${seat.grade}석, ${seat.floor}층-${seat.section}블록, ${seat.row}열 ${seat.number}번
											  </li>
                                           </c:forEach>
                                        </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label">일시</td>
                                        <td class="value">${selectedDate} ${selectedTime}</td>
                                    </tr>
                                </table>

                                <table class="reserv-table">
                                    <tr>
                                        <th colspan="2">예약자 정보</th>
                                    </tr>
                                    <tr>
                                        <td class="label">예매자</td>
                                        <td class="value">${memberInfo.U_NAME}</td>
                                    </tr>
                                    <tr>
                                        <td class="label">예매자 연락처</td>
                                        <td class="value">${memberInfo.U_PNUM}</td>
                                    </tr>
                                    <tr>
                                        <td class="label">티켓수령방법</td>
                                        <td class="value"><b>현장수령</b> (시작 전 30분전까지 현장에 오셔서 예약번호를 통해서 티켓을 받으세요.  </td>
                                    </tr>
                                </table>

                                <div style="display: flex; align-items: flex-start; gap: 15px;">
                                    <table class="additional-info">
                                        <tr>
                                            <th colspan="2">결제 정보</th>
                                        </tr>
                                        <tr>
                                            <td class="label">티켓 금액</td>
                                            <td class="value">${ticketPrice}</td>
                                        </tr>
                                        <!-- <tr>
                                            <td class="label">할인</td>
                                            <td class="value">0원</td>
                                        </tr> -->
                                        <tr>
                                            <td class="label">포인트</td>
                                            <td class="value">
                                            <b> 
	                                            <c:choose>
									                <c:when test="${empty usePoint || usePoint == 0}">
									                    0 P 사용
									                </c:when>
									                <c:otherwise>
									                    ${usePoint} P 사용
									                </c:otherwise>
									            </c:choose>
									         </b>
								            </td>
                                        </tr>
                                        <tr>
                                            <td class="label">총 결제금액</td>
                                            <td class="value"><b>${ticketPrice - (usePoint != null ? usePoint : 0)} 원</b></td>
                                        </tr>
                                    </table>

                                    <table class="additional-info">
                                        <tr>
                                            <th colspan="2">결제 수단</th>
                                        </tr>
                                        <tr>
                                            <td class="label">결제 방법</td>
                                            <td class="value">카카오페이</td>
                                        </tr>
                                        <tr>
                                            <td class="label">취소기한</td>
                                            <td class="value"><b>${jcancelDeadline}</b></td>
                                        </tr>
                                        <tr>
                                            <td class="label">취소수수료</td>
                                            <td class="value"><b>티켓금액의 0~30%</b></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </aside>
                    <aside class="seatR">
                        <div class="s Button"> 
                            <div class="subBtList">
                                <button  type="button"  class="subBt" style="width: 100%; background: #FF3D32; color: #fff;" onclick="goToMain()">메인으로 돌아가기</button>
                            </div>
                        </div>
                    </aside>
                </section>
            </article>
        </section>
    </form>
    <script>
	function goToMain() {
	    window.opener.location.href = '/muse/index.do';
	    window.close(); 
	}
	</script>
</body>
</html>
