<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<script src="/muse/resources/js/httpRequest.js"></script>
</head>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
<style>
#seatGrade {
	display: flex;
	transform: scale(0.5); /* 예: 80% 크기로 줄이기 */
	transform-origin: center; /* 축소 기준을 좌측 상단으로 */
	width: calc(100%/ 0.5); /* 부모 컨테이너의 가로 크기를 유지 */
	overflow: hidden; /* 내부 내용이 넘치지 않도록 설정 */
}

#gradeTableDiv table {
	font-size: 30px;
	font-weight: bold;
	width: 100%;
	border-collapse: collapse; /* 테이블 셀의 경계선 처리를 설정 */
}

#GradeColor {
	width: 30px;
	height: 30px;
}
    .table-content input[value="저장"]{
	/* width: 80px;
    height: 40px; */
    border-radius: 10px; 
    padding: 8px 20px;
    background-color: #2d92f5;
    color: white;
    border: none;
    cursor: pointer;
}
.table-content input[value="신청"]{
	 width: 80px;
    height: 40px; 
    border-radius: 10px; 
    padding: 8px 20px;
    background-color: #2d92f5;
    color: white;
    border: none;
    cursor: pointer;
}
.musicalNamePopup {
        
        
        top: 0; 
        left: 110%; 
        margin-left: 10px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 0.3rem 0.6rem rgba(0, 0, 0, 0.2);
        z-index: 100;
        display: none;
        width: 280px;
    }

    /* 닫기 버튼 스타일 */
    .MusicalNameClose-btn {
        position: absolute;
        top: 5px;
        right: 5px;
        background: none;
        border: none;
        font-size: 18px;
        cursor: pointer;
    }

    /* 검색 입력 스타일 */
    #searchInputMusicalName {
        width: 85%;
        padding-right: 30px;
    }

    /* 검색 아이콘 */
    #searchIcon {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
    }
    #MusicalListTable {
    	width:100%;
    }
.table-content input[value="찾기"] {
    width: 80px;
    height: 40px;
    border-radius: 10px;
    padding: 8px 20px;
    background-color: #60c558;
    color: white;
    border: none;
    cursor: pointer;
}
.buttondiv {
	margin-top:-350px;
}
</style>
<body>
<!-- 좌석 -->
<div class="main-content">
		<div class="main-contenttop">
			<h1>좌석 지정</h1>
			<hr>
		</div>

		<div class="table-content">
			<form class="table-content">
				<table style="border-collapse: collapse; margin-bottom: 20px;">
					<tr>
						<th>뮤지컬명</th>
						<td colspan="3"><input type="text" name="m_title"
							placeholder="뮤지컬을 선택하세요" value="${m_name }"> <input type="hidden"
							name="m_code" value="${m_code }"></td>
						<td class="button-container" style="text-align: right;"><input
							type="button" value="찾기" onclick="showMusicalNamePopup(event)">
						</td>
						<td colspan="3"><input type="hidden" name="mh_code" value="${mh_code }"></td>
							
						
					</tr>
					
				</table>
				<div id="seatGrade">
				<div id="gradeTableDiv">
					<table id="gradeTable">
						<tr>
							<td>좌석 이름</td>
							<td>좌석 가격</td>
							<td>좌석 색상</td>
							<td></td>
						</tr>
						<tr id="sg_1">
							<td>VIP석</td>
							<td><input type="text" name="vipgradePrice"></td>
							<td><div id="GradeColor" style="background-color: #CE3B3B;"></div></td>
							<td><input type="radio" name="selectGrade"></td>
						</tr>
						<tr id="sg_2">
							<td>R석</td>
							<td><input type="text" name="rgradePrice"></td>
							<td><div id="GradeColor" style="background-color: #1CA814;"></div></td>
							<td><input type="radio" name="selectGrade"></td>
						</tr>
						<tr id="sg_3">
							<td>S석</td>
							<td><input type="text" name="sgradePrice"></td>
							<td><div id="GradeColor" style="background-color: #17B3FF;"></div></td>
							<td><input type="radio" name="selectGrade"></td>
						</tr>
						<tr id="sg_4">
							<td>A석</td>
							<td><input type="text" name="agradePrice"></td>
							<td><div id="GradeColor" style="background-color: #F2EA1C;"></div></td>
							<td><input type="radio" name="selectGrade"></td>
						</tr>
					</table>
				</div>
				<c:if test="${result!=''}">
					<%@include file="musicalSeatInsert.jsp"%>
				</c:if>
				<c:if test="${result=='' }">
				<div id="nullDiv"style="width:1000px"></div>
				</c:if>
			</div>

				
				<div class="buttondiv">
					<input type="button" value="신청" onclick="insertTicketOpen()">
					<input type="reset" value="취소">
				</div>

			</form>
		</div>
	</div>
    <div id="musicalNamePopup" class="musicalNamePopup">
    <div class="musicalNameWrap">
       
        <button class="MusicalNameClose-btn" onclick="closeMusicalNamePopup()">X</button>
          <div style="position: relative; width: 100%; max-width: 300px;">
            <input type="text" id="searchInputMusicalName" placeholder="검색어를 입력하세요">
            <i class="fas fa-search" id="searchIcon" onclick="SeachMusicalName()"></i>
        </div>
        <table id="MusicalListTable">
            <thead>
                <tr>
                    <th>뮤지컬 목록</th>
                </tr>
            </thead>
            	<tbody id="MusicalNameTableBody">
            </tbody>
        </table>
    </div>
	</div>
			
</body>
<script>
var MusicalHoleCode = '';
var musical_code = '${m_code}';
var musical_Name = '';

function insertTicketOpen(){
	var vipgradePrice = document.getElementsByName("vipgradePrice")[0].value;
    var rgradePrice = document.getElementsByName("rgradePrice")[0].value;
    var sgradePrice = document.getElementsByName("sgradePrice")[0].value;
    var agradePrice = document.getElementsByName("agradePrice")[0].value;
    alert(musical_code+"");
    // 입력값 검증
    if (vipgradePrice === "" || vipgradePrice === null) {
        alert("VIP 등급 가격을 입력해 주세요.");
        return;
    }
    if (rgradePrice === "" || rgradePrice === null) {
        alert("R 등급 가격을 입력해 주세요.");
        return;
    }
    if (sgradePrice === "" || sgradePrice === null) {
        alert("S 등급 가격을 입력해 주세요.");
        return;
    }
    if (agradePrice === "" || agradePrice === null) {
        alert("A 등급 가격을 입력해 주세요.");
        return;
    }

    // URL 파라미터 구성
    var param = 'm_code=' + musical_code + 
                '&sg_code1=sg_1&sp_price1=' + vipgradePrice +
                '&sg_code2=sg_2&sp_price2=' + rgradePrice +
                '&sg_code3=sg_3&sp_price3=' + sgradePrice +
                '&sg_code4=sg_4&sp_price4=' + agradePrice;
                
    window.location.href = 'insertSeatPriceSeat.do?' + param;
    makeDummy();
}


/* function selectHallTypeResult(){
	 if (XHR.readyState === 4) {
	        if (XHR.status === 200) {
	        	var data = XHR.responseText;
				alert(data);
	        }
	 }
	        
} */

function SeachMusicalName(){
	var param = 'pr_code=${s_pr_code}';
	var searchInputMusicalName = document.getElementById("searchInputMusicalName").value;

// 입력값이 null이 아닌 경우에만 param 수정
if (searchInputMusicalName) {
    param = param + '&searchMusical=' + encodeURIComponent(searchInputMusicalName);
}


	var searchInputMusicalName = sendRequest('getMusicalList.do',param,ResultSeachMusicalName,'GET');
}
function ResultSeachMusicalName(){
	if(XHR.readyState==4){
		if (XHR.status == 200) {
		    var data = XHR.responseText;
		    var MusicalList = JSON.parse(data);
		    
		    var tableBody = document.getElementById('MusicalNameTableBody');
		    tableBody.innerHTML = '';
		    // 결과가 없을 때
		    if (MusicalList.list.length === 0) {
		        var row = document.createElement('tr');
		        var noResultCell = document.createElement('td');
		        noResultCell.textContent = '검색된 결과가 없습니다.';
		        noResultCell.colSpan = 3;  
		        row.appendChild(noResultCell);
		        tableBody.appendChild(row);
		    } else {
		        // 결과가 있을 때
		        for (var i = 0; i < MusicalList.list.length; i++) {
		            var dto = MusicalList.list[i];
		            var MusicalName = dto.m_title;
		            // 새 행 생성
		            var row = document.createElement('tr');
		            row.innerHTML = '<td style="text-align: center;"><a onclick="inputMusicalName(this)" data-mcode="'+dto.m_code+'" data-mhcode="'+dto.mh_code+'">' + MusicalName + '</a></td>'
	                +'<td style="text-align: center;">' + dto.mh_code + '</td>';

					tableBody.appendChild(row);
		        }
		        
		    }
		}
	}
}

 function inputMusicalName(element) {
    // 뮤지컬 제목 입력
    var musicalName = element.textContent || element.innerText;
    document.getElementsByName('m_title')[0].value = musicalName;
    musicalName = musicalName;
    // 공연장 코드 입력
    var mhCode = element.getAttribute('data-mhcode');
    document.getElementsByName('mh_code')[0].value = mhCode;
    
    // 뮤지컬 코드 저장
    var mCode = element.getAttribute('data-mcode');
    musical_code = mCode;
    
    // 공연장 코드 저장
    MusicalHoleCode = mhCode;
    
    // 팝업 닫기
    closeMusicalNamePopup();
    
    // 좌석 정보 요청
    param = 'mh_code=' + MusicalHoleCode;

    param += '&m_code='+musical_code;
    param += '&m_name='+musicalName;
	
    window.location.href='musicalSeatAddForm.do?'+param;
    
}

function showMusicalNamePopup(button) {
	SeachMusicalName();
    var popup = document.getElementById('musicalNamePopup');
    
    
    var buttonInfo=button.target;
    var rect = buttonInfo.getBoundingClientRect(); 
    
    
    popup.style.left = (rect.left + 100)+ 'px';
    popup.style.top = (rect.top)+ 'px'; 
	
    popup.style.display = "block";
    popup.style.position = "absolute";
    
}

function closeMusicalNamePopup() {
    const popup = document.getElementById('musicalNamePopup');
    popup.style.display = 'none'; 
}

window.onload = function() {
   

    // musical_code가 빈 문자열일 경우 스타일을 변경
    if (musical_code !== '') {
        var seatGrade = document.getElementById('seatGrade');
        seatGrade.style.marginTop = '-400px';
    }
};
</script>
</html>