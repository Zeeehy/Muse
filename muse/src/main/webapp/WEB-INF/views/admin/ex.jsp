<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Table</title>
  <style>
    body {
      margin: 0;
      background-color: #f8f9fa;
      color: #212529;
    }

    .container2 {
      max-width: 1200px;
      margin: 40px auto;
      padding: 20px;
      background: white;
      border-radius: 10px;
      box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    .table-title {
      font-size: 24px;
      margin-bottom: 20px;
      font-weight: bold;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }

    thead {
      background-color: #6d99c9;
      color: white;
    }

    thead th {
      padding: 12px;
      text-align: left;
      font-size: 16px;
    }

    tbody tr {
      border-bottom: 1px solid #ddd;
    }

    tbody tr:hover {
      background-color: #f1f1f1;
    }

    tbody td {
      padding: 12px;
      font-size: 14px;
    }

    .highlight {
      color: #007bff;
      font-weight: bold;
    }

    .no-data {
      text-align: center;
      padding: 20px;
      font-size: 16px;
      color: #6c757d;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="table-title">관리자 테이블</div>
    <table>
      <thead>
        <tr>
          <th>공연 이름</th>
          <th>예매 수량</th>
          <th>총 판매액</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>뮤지컬 홍련</td>
          <td class="highlight">32</td>
          <td>₩320,000</td>
        </tr>
        <tr>
          <td>뮤지컬 알라딘</td>
          <td class="highlight">40</td>
          <td>₩400,000</td>
        </tr>
        <tr>
          <td>뮤지컬 시라노</td>
          <td class="highlight">24</td>
          <td>₩240,000</td>
        </tr>
      </tbody>
    </table>
  </div>
</body>
</html>
