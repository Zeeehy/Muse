<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예매자 확인 페이지</title>
    <link rel="stylesheet" type="text/css" href="resources/css/Main.css">
    <link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
    <style>
        /* 기존 스타일 유지 */
    </style>
</head>
<body>
    <h1>예매자 확인 페이지</h1>
    <form>
        <section class="reservWrap">
            <article class="contWrap">
                <header class="step">
                    <h2>03 예매자 확인</h2>
                    <h3>
                        <c:out value="${musicalInfo.M_TITLE}" default="뮤지컬 제목"/> 
                        <span>| <c:out value="${musicalInfo.MH_NAME}" default="극장명"/></span>
                    </h3>
                    <div class="select">
                        <em>다른 관람일자 선택 : </em>
                        <span>일자</span>
                        <select id="playDate">
                            <option selected><c:out value="${selectedDate}"/></option>
                        </select>
                        <span>시간</span>
                        <select id="playTime">
                            <option selected><c:out value="${selectedTime}"/></option>
                        </select>
                    </div>
                </header>
                <section class="allSeat">
                    <!-- 왼쪽 섹션 -->
                    <aside class="seatL" style="display: flex; flex-direction: column;">
                        <!-- 예매자 정보 섹션 -->
                        <div class="priceT" style="padding: 36px 36px 0 36px;">
                            <!-- 기존 예매자 정보 폼 유지 -->
                        </div>
                        <!-- 티켓 수령 방법 섹션 -->
                        <div class="pointB" style="padding: 15px 36px;">
                            <!-- 기존 티켓 수령 정보 유지 -->
                        </div>
                    </aside>
                    
                    <!-- 오른쪽 섹션 -->
                    <aside class="seatR">
                        <div class="s inf">
                            <h2>나의 예매 정보</h2>
                            <div class="reservmInfo">
                                <div style="display: flex; gap: 15px; flex-direction: row; align-items: stretch;">
                                    <img src="">
                                    <ul class="mInfoList">
                                        <li><span><c:out value="${musicalInfo.M_TITLE}"/></span></li>
                                        <li><c:out value="${musicalInfo.M_START_DATE} ~ ${musicalInfo.M_END_DATE}"/></li>
                                        <li><c:out value="${musicalInfo.MH_NAME}"/></li>
                                        <li><c:out value="${musicalInfo.M_AGE}"/></li>
                                        <li>관람시간 : <c:out value="${musicalInfo.M_RUNTIME}"/>분</li>
                                    </ul>
                                </div>
                                <table style="margin-top: 15px;">
                                    <tbody>
                                        <tr>
                                            <th>일시</th>
                                            <td><c:out value="${selectedDate}"/> <c:out value="${selectedTime}"/></td>
                                        </tr>
                                        <tr>
                                            <th>선택좌석<br>(${seatCount}석)</th>
                                            <td>
                                                <ul class="seatInf">
                                                    <c:forEach items="${selectedSeats}" var="seat">
                                                        <li>${seat.grade} ${seat.floor}층-${seat.section}블록 ${seat.row}열 ${seat.position}</li>
                                                    </c:forEach>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>티켓금액</th>
                                            <td>
                                                <c:set var="totalPrice" value="0"/>
                                                <c:forEach items="${selectedSeats}" var="seat">
                                                    <c:set var="totalPrice" value="${totalPrice + seat.price}"/>
                                                </c:forEach>
                                                <c:out value="${totalPrice}"/>원
                                            </td>
                                        </tr>
                                        <!-- 나머지 테이블 내용 -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="s Choice">
                            <h2>총 결제 금액</h2>
                            <div>
                                <span><b><c:out value="${totalPrice - (usePoint != null ? usePoint : 0)}"/>원</b></span>
                            </div>
                        </div>
                        
                        <div class="s Button"> 
                            <div class="subBtList">
                                <button type="button" class="subBt" onclick="history.back()">이전단계</button>
                                <button type="button" class="subBt" style="background: #FF3D32; color: #fff;" onclick="goToNextStep()">다음단계</button>
                            </div>
                        </div>
                    </aside>
                </section>
            </article>
        </section>
    </form>
    
    <script>
    function goToNextStep() {
        // 다음 단계로 이동하는 로직 구현
        // 예: form submit 또는 location.href 사용
    }
    </script>
</body>
</html>