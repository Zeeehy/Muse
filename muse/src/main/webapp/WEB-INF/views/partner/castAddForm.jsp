<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<style>
	.main{
	width:100%;
	}
</style>
</head>
<body>

<div class="main">
<%@include file="header.jsp" %>
<%@include file="sidebar.jsp" %>
<div class="main-content">

    	<div class="main-contenttop">
        	<h1>캐스트 보드</h1>
        	
        	<hr>
        </div>
        	<div class="table-content">
        	<table border="1" id="roleTable">
        		<tr>
        			<th colspan="3">뮤지컬명</th>
        			<td colspan="3"><input type="text"></td>
        			<td colspan="2"><input type="button" value="찾기"></td>
        		</tr>
        		<tr>
        			<th colspan="3">접수번호 / 상태</th>
        			<td colspan="3"><input type="text"></td>
        			<td colspan="2"><input type="button" value="찾기"></td>
        		</tr>
        		<tr>
        			<th colspan="3">역할 선택</th>
        			<td colspan="3"><input type="text" id="roleInput"></td>
        			<td colspan="2"><input type="button" value="추가"  onclick="addRow()"></td>
        		</tr>
        	</table>
        	<table>
        		<tr>
        			<td colspan="5" style="text-align: center;">배우</td>
        			<td colspan="2" style="text-align: center;">역할</td>
        			<td></td>
        		</tr>
        		<tr>
        			<td colspan="3"><input type="image"></td>
        			<td colspan="2" style="text-align: center;">
        				<select>
        					<option>배우 이름</option>
        					<option>1</option>
        					<option>2</option>
        				</select></td>
        			<td colspan="2" style="text-align: center;">배우 역할</td>
        			<td><input type="button" value="삭제"></td>
        		</tr>
        		<tr>
        			<th colspan="3">일자별 배우 등록</th>
        			<td><input type="date"></td>
        			<td style="text-align: center;">~</td>
        			<td><input type="date"></td>
        			<td colspan="2"><input type="button" value="조회"></td>
        		</tr>
        		<tr>
        			<td colspan="2" style="text-align: center;">공연일</td>
        			<td colspan="3" style="text-align: center;">시간</td>
        			<td colspan="3" style="text-align: center;">역할</td>
        		</tr>
        			<tr>	
        		<td colspan="2" style="text-align: center;">공연일</td>
        		<td colspan="3" style="text-align: center;">
        		<select>
        					<option>시간</option>
        					<option>10:00</option>
        					<option>14:00</option>
        		</select>
        		</td>
        			<td colspan="3" style="text-align: center;">배우 역할</td>
        		</tr>
        	</table>
        	<h2>파트너 정보</h2>
            <table>
                <tr>
                    <th>파트너 명</th>
                    <td><input type="text" required></td>
                </tr>
                <tr>
                    <th>사업자 번호</th>
                    <td><input type="text" required></td>
                </tr>
                <tr>
                    <th>사업자 명</th>
                    <td><input type="text" required></td>
                </tr>
                <tr>
                    <th>대표자 이름</th>
                    <td><input type="text" required></td>
                </tr>
            </table>
            <div class="buttondiv">
                <input type="submit" value="신청">
                <input type="reset" value="취소">
            </div>
        	</div>
        </div>
</div>
</body>
<script>
function addRow() {
    const table = document.getElementById("roleTable");
    const roleInput = document.getElementById("roleInput").value;

    
    const newRow = table.insertRow();
    newRow.innerHTML = `
        <td colspan="3"><input type="image" /></td>
        <td colspan="2" style="text-align: center;">
            <select>
                <option>배우 이름</option>
                <option>1</option>
                <option>2</option>
            </select>
        </td>
        <td colspan="2" style="text-align: center;">roleInput</td>
        <td><input type="button" value="삭제" onclick="deleteRow(this)"></td>
    `

    
    document.getElementById("roleInput").value = "";
}

// 행 삭제 함수
function deleteRow(button) {
    const row = button.parentNode.parentNode;
    row.parentNode.removeChild(row);
}
</script>
</html>