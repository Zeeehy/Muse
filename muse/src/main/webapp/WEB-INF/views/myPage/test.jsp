<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역 확인</title>
<style>
/* 기본 초기화 */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    color: #333;
    background-color: #f8f8f8;
}

.container {
    display: flex;
    max-width: 1200px;
    margin: 20px auto;
}

.main-content {
    flex: 1;
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 20px;
}

.main-content h2 {
    font-size: 20px;
    color: #d2322d;
    border-bottom: 2px solid #d2322d;
    padding-bottom: 5px;
    margin-bottom: 20px;
}

/* 예약 내역 스타일 */
.ticket-info {
    margin-bottom: 20px;
    padding: 20px;
    background-color: #fefefe;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.ticket-info h3 {
    font-size: 18px;
    color: #d2322d;
    margin-bottom: 10px;
}

.ticket-info p {
    font-size: 14px;
    color: #555;
    margin-bottom: 8px;
}

.ticket-details, .payment-info {
    border-top: 1px solid #ddd;
    padding-top: 15px;
    margin-top: 15px;
}

.ticket-details table, .payment-info table {
    width: 100%;
    border-collapse: collapse;
}

.ticket-details th, .payment-info th {
    font-weight: bold;
    text-align: left;
    padding: 10px 0;
    color: #333;
}

.ticket-details td, .payment-info td {
    padding: 10px 0;
    color: #333;
}

/* 버튼 스타일 */
.button {
    display: inline-block;
    padding: 8px 16px;
    background-color: #d2322d;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    text-align: center;
    font-size: 14px;
    margin-top: 10px;
}

.button:hover {
    background-color: #a12821;
}

.cancel-button {
    color: #d2322d;
    background-color: #f9f9f9;
    border: 1px solid #d2322d;
}

.cancel-button:hover {
    background-color: #ffdede;
}
</style>
</head>
<body>
<div class="container">
    <div class="main-content">
        <h2>예매내역 확인 • 취소</h2>
        <div class="ticket-info">
            <h3>콜드플레이 내한공연</h3>
            <p>예매자: 이지현</p>
            <p>이용일: 2025년 04월 24일 (목) 20시 00분</p>
            <p>장소: 고양종합운동장 주경기장</p>
            
            <div class="ticket-details">
                <table>
                    <tr>
                        <th>예매번호</th>
                        <td>T2565****</td>
                    </tr>
                    <tr>
                        <th>좌석</th>
                        <td>FLOOR 입장번호 ****</td>
                    </tr>
                    <tr>
                        <th>티켓수령 방법</th>
                        <td>배송 (2025년 03월 24일 발송 예정)</td>
                    </tr>
                </table>
            </div>
            
            <div class="payment-info">
                <table>
                    <tr>
                        <th>결제일자</th>
                        <td>2024.09.27</td>
                    </tr>
                    <tr>
                        <th>결제수단</th>
                        <td>카카오페이</td>
                    </tr>
                    <tr>
                        <th>결제상태</th>
                        <td>결제 완료</td>
                    </tr>
                </table>
            </div>
            
            <a href="#" class="button">티켓재발송 요청</a>
            <a href="#" class="button cancel-button">예매 취소</a>
        </div>
    </div>
</div>
</body>
</html>
