<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="/muse/resources/js/httpRequest.js"></script>
<link rel="stylesheet" href="/muse/resources/css/Phj2.css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<style>
span .bestBadge {
	display: inline-block;
	width: 3rem;
	height: 1.1rem;
	margin-right: 0.6rem;
	color: #666;
	font-size: 0.8rem;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	border: 1px solid #ccc;
	border-radius: 0.4rem;
	box-sizing: border-box;
}

.table-content input[value="검색"] {
	width: 80px;
	height: 40px;
	border-radius: 10px;
	padding: 8px 20px;
	background-color: #4fa6fb;
	color: white;
	border: none;
	cursor: pointer;
}

.table-content input[value="삭제"] { /* 
    width: 80px;
    height: 40px; */
	border-radius: 10px;
	padding: 8px 20px;
	background-color: #e73e47;
	color: white;
	border: none;
	cursor: pointer;
}
td a.status-best {
    color: #DAA520;  /* 진한 골드색 - 베스트의 특별함을 나타내면서도 눈에 피로하지 않음 */
}

td a.status-blocked {
    color: #DC3545;  /* 부드러운 빨간색 - 경고의 의미를 담되 과하지 않음 */
}

td a.status-delete {
    color: #0D6EFD;  /* 차분한 파란색 - 정보 전달의 의미로 자주 사용되는 색상 */
}

/* 베스트 리뷰 설정 버튼 */
input[type="button"][value="베스트 리뷰 설정"] {
    background-color: #4CAF50;
    color: white;
    padding: 6px 12px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="button"][value="베스트 리뷰 설정"]:hover {
    background-color: #45a049;
}
input[type="button"][value="베스트 리뷰 해제"] {
    background-color: #4CAF50;
    color: white;
    padding: 6px 12px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="button"][value="베스트 리뷰 해제"]:hover {
    background-color: #45a049;
}
</style>
<title>Insert title here</title>
</head>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
<%@include file="musicalNamePopup2.jsp"%>
<body>
	<div class="main-content">
		<div class="main-contenttop">
			<h1>리뷰 삭제</h1>
			<hr>
		</div>

		<div class="table-content">
			<table style="border-collapse: collapse; margin-bottom: 20px;"
				id="infoTable">


				<tr>
					<th>뮤지컬명</th>
					<td colspan="3"><input type="text" name="m_title"
						placeholder="뮤지컬을 선택하세요" readonly> <input type="hidden"
						name="m_code" value="${m_title }"></td>
					<td class="button-container" style="text-align: right;"><input
						type="button" value="찾기" onclick="showMusicalNamePopup(event)">
					</td>
					<td><input type="button" value="검색"
						onclick="selectMusicalReview()"></td>
				</tr>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>상태</th>
					<th>삭제 요청</th>
					<th>베스트 리뷰</th>
				</tr>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td name="mr_code" class="mr_code">${dto.mr_code}</td>
						<td onclick="toggleContentRowFirst(this)">${dto.mr_title}</td>
						<td>${dto.u_id}</td>
						<td>${dto.mr_date}</td>
						<td><c:choose>
								<c:when test="${dto.mr_state == 1}">
									<a  class="status-best">베스트</a>
								</c:when>
								<c:when test="${dto.mr_state == 2}">
									<a  class="status-blocked">관리자 차단</a>
								</c:when>
								<c:when test="${dto.mr_state == 3}">
									<a  class="status-delete">삭제 요청</a>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose></td>
						<td><c:if
								test="${dto.mr_state ne 1 and dto.mr_state ne 2 and dto.mr_state ne 3}">
								<input type="button" value="삭제"
									onclick="deleteReviewAction(event)">
							</c:if></td>
						<td><input type="button" value="베스트 리뷰 설정"
							onclick="bestReviewAction(event)"></td>
					</tr>
					<tr class="content-row"
						style="display: none; background-color: #f0f0f0; text-align: center;">
						<td></td>
						<th colspan="5" style="padding-left: 20px;">${dto.mr_content}</th>
						<td></td>
					</tr>
				</c:forEach>
			</table>

		</div>
	</div>
</body>
<script>
function inputMusicalName(element) {
    var MusicalName = element.textContent || element.innerText;  // 클릭된 항목의 텍스트 가져오기
    
    document.getElementsByName('m_title')[0].value = MusicalName;
    
    closeMusicalNamePopup();

    var MusicalM_code= element.id;
    musical_code = MusicalM_code; //선택한 뮤지컬 idx값
} 

function selectMusicalReview(){
	const m_code = musical_code;
	const pr_code = '${s_pr_code}';
	const param = 'm_code=' + m_code + '&s_pr_code=' + pr_code;
	sendRequest('getmusicalReview.do',param,selectmusicalReviewResult,'GET');
}

function selectmusicalReviewResult() {
    if (XHR.readyState == 4) {
        if (XHR.status == 200) {
            var data = XHR.responseText;
            var MusicalList = JSON.parse(data); // 서버로부터 받은 JSON 데이터 파싱
            var list = MusicalList.list; // MusicalList에서 list 부분을 추출

            // 테이블 초기화 (기존 내용 제거)
            var tableBody = document.querySelector("#infoTable tbody");
            tableBody.innerHTML = ""; // 기존 테이블 내용을 비움

            console.log(MusicalList); // 전체 MusicalList 확인
            console.log(list); // list 확인

            // 첫 번째 고정 행 추가 (뮤지컬명 및 검색)
            tableBody.innerHTML += `
                <tr>
                    <th>뮤지컬명</th>
                    <td colspan="3">
                        <input type="text" name="m_title" placeholder="뮤지컬을 선택하세요" readonly> 
                        <input type="hidden" name="m_code">
                    </td>
                    <td class="button-container" style="text-align: right;">
                        <input type="button" value="찾기" onclick="showMusicalNamePopup(event)">
                    </td>
                    <td>
                        <input type="button" value="검색" onclick="selectMusicalReview()">
                    </td>
                </tr>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <td>상태</td>
                    <td>삭제 요청</td>
                    <td>베스트 리뷰 설정</td>
                </tr>
            `;

            // list가 비어 있을 경우 "리뷰가 없습니다." 메시지 추가
            if (list.length === 0) {
                var noReviewRow = document.createElement('tr');
                var noReviewCell = document.createElement('th');
                noReviewCell.colSpan = 7; // 전체 컬럼을 차지하도록 설정
                noReviewCell.textContent = '리뷰가 없습니다.';
                noReviewCell.style.textAlign = 'center';
                noReviewRow.appendChild(noReviewCell);
                tableBody.appendChild(noReviewRow);
            } else {
                // list에 데이터가 있을 경우, 테이블에 동적으로 내용 추가
            	list.forEach(function(dto) {
            	    // 새로운 행을 추가
            	    var row = document.createElement("tr");

            	    // 두 번째 열 - mr_code 값
            	    var td2 = document.createElement("td");
					td2.textContent = dto.mr_code;
					td2.setAttribute('name', 'mr_code');  // name 속성 추가
					td2.classList.add('mr_code');         // class 추가
					row.appendChild(td2);

            	    // 세 번째 열 - mr_title 값 (클릭 이벤트 추가)
            	    var td3 = document.createElement("td");
            	    td3.textContent = dto.mr_title;
            	    td3.style.cursor = "pointer"; // 클릭할 수 있도록 커서 변경
            	    td3.onclick = function() {
            	        toggleContentRowFirst(this); // 클릭 시 콘텐츠 보이기
            	    };
            	    row.appendChild(td3);

            	    // 네 번째 열 - u_id 값
            	    var td4 = document.createElement("td");
            	    td4.textContent = dto.u_id;
            	    row.appendChild(td4);

            	    // 다섯 번째 열 - mr_date 값
            	    var td5 = document.createElement("td");
            	    td5.textContent = dto.mr_date;
            	    row.appendChild(td5);

            	    // 여섯 번째 열 - 상태 (삭제 대기)
            	    var td6 = document.createElement("td");
            	    var state = '';
            	    var stateLink = document.createElement("a"); // a 태그 생성
            	    
            	    if(dto.mr_state == 1) {
            	        var stateLink = document.createElement("a");
            	        stateLink.textContent = '베스트';
            	        stateLink.classList.add('status-best');
            	        td6.appendChild(stateLink);
            	    } else if(dto.mr_state == 2) {
            	        var stateLink = document.createElement("a");
            	        stateLink.textContent = '관리자 차단';
            	        stateLink.classList.add('status-blocked');
            	        td6.appendChild(stateLink);
            	    } else if(dto.mr_state == 3) {
            	        var stateLink = document.createElement("a");
            	        stateLink.textContent = '삭제 요청';
            	        stateLink.classList.add('status-delete');
            	        td6.appendChild(stateLink);
            	    }
            	    row.appendChild(td6);

            	    // 일곱 번째 열 - 삭제 버튼
            	    
            	    var td7 = document.createElement("td");

            	    if (dto.mr_state != 1 && dto.mr_state != 2 && dto.mr_state != 3) {
            	        var deleteButton = document.createElement("input");
            	        deleteButton.type = "button";
            	        deleteButton.value = "삭제";
            	        deleteButton.onclick = function(e) { deleteReviewAction(e); };
            	        td7.appendChild(deleteButton);
            	    }

            	    row.appendChild(td7);  // td7을 row에 추가

            	    
            	    var td8 = document.createElement("td");

            	    var reviewButton = document.createElement("input");
            	    reviewButton.type = "button";
            	    reviewButton.value = "베스트 리뷰 설정";
            	    reviewButton.onclick = function(e) {bestReviewAction(e)};
            	    
            	    td8.appendChild(reviewButton);
            	    row.appendChild(td8);
            	    
            	    

            	    // 행을 테이블 본문에 추가
            	    tableBody.appendChild(row);
// `mr_content`를 포함하는 숨겨진 행을 추가
var contentRow = document.createElement("tr");
contentRow.classList.add("content-row"); // 클래스 추가
contentRow.style.display = "none";
contentRow.style.backgroundColor = '#f0f0f0';
contentRow.style.textAlign = 'center';

// 첫 번째 빈 td
var emptyTd1 = document.createElement("td");
contentRow.appendChild(emptyTd1);

// 내용이 들어갈 th 
var thContent = document.createElement("th");
thContent.colSpan = 5;
thContent.style.paddingLeft = "20px";
thContent.textContent = dto.mr_content;
contentRow.appendChild(thContent);

// 마지막 빈 td
var emptyTd2 = document.createElement("td");
contentRow.appendChild(emptyTd2);

row.parentNode.insertBefore(contentRow, row.nextSibling); // 현재 행 바로 아래에 추가
            	});
            }
        }
    }
}



function toggleContentRowFirst(titleCell) {
	  // titleCell은 클릭된 셀 (즉, 'mr_title' 셀)을 의미합니다.
	  var row = titleCell.parentElement;  // 클릭된 셀에서 부모 요소인 <tr>을 찾습니다.
	  var contentRow = row.nextElementSibling;  // 바로 아래 행을 찾습니다.

	  // contentRow가 있으면 표시/숨김 처리
	  if (contentRow && contentRow.classList.contains('content-row')) {
	    if (contentRow.style.display === 'none') {
	      contentRow.style.display = 'table-row';  // 보이기
	    } else {
	      contentRow.style.display = 'none';  // 숨기기
	    }
	  }
	}
	
function getTdValues(form) {
    // tr 요소를 찾습니다
    var row = form.querySelector('tr');
    
    // td 값들 가져오기
    var mr_code = row.querySelector('td:nth-child(1)').textContent;
    var mr_title = row.querySelector('td:nth-child(2)').textContent;
    var u_id = row.querySelector('td:nth-child(3)').textContent;
    var mr_date = row.querySelector('td:nth-child(4)').textContent;
    var pr_code = '${s_pr_code}';
    // 원하는 데이터를 콘솔에 출력 (혹은 서버로 전송 등)
    console.log('mrCode: ' + mrCode);
    console.log('mrTitle: ' + mrTitle);
    console.log('uId: ' + uId);
    console.log('mrDate: ' + mrDate);
    console.log('pr_code: ' + pr_code);
    
    // 예시로 값을 콘솔에 출력 후, 폼 제출을 계속 진행하려면 true를 반환
    return true; 
}
function deleteReviewAction(event){
		var selectedRow = event.target.closest('tr');  // event.target은 클릭한 버튼을 의미, closest('tr')은 부모 tr을 찾음

	    // tr에서 각 td 값을 추출
	    var mr_code = selectedRow.querySelector('td[name="mr_code"]').textContent; // mr_code 값
	    var mr_title = selectedRow.querySelector('td:nth-child(2)').textContent; // mr_title 값
	    var u_id = selectedRow.querySelector('td:nth-child(3)').textContent; // u_id 값
	    var mr_date = selectedRow.querySelector('td:nth-child(4)').textContent; // mr_date 값
	  //  var mr_content = selectedRow.querySelector('td:nth-child(5)').textContent; // 삭제 대기 상태 값
	    var mr_content_tr =  selectedRow.nextElementSibling;
	    var mr_content = mr_content_tr.querySelector('th').textContent;
	    var pr_code='${s_pr_code}';
	console.log(mr_code);
	console.log(mr_title);
	console.log(u_id);
	console.log(mr_date);
	console.log(mr_content_tr);
	console.log(mr_content);
	var param = "mr_code=" + encodeURIComponent(mr_code) + 
    "&mr_title=" + encodeURIComponent(mr_title) + 
    "&u_id=" + encodeURIComponent(u_id) + 
    "&mr_date=" + encodeURIComponent(mr_date) + 
    "&mr_content=" + encodeURIComponent(mr_content) + 
    "&pr_code=" + encodeURIComponent(pr_code);
	
	window.location.href="deleteReviewForm.do?" +param;
}

function bestReviewAction(event){
	
  	var selectedRow = event.target.closest('tr');  
    var mr_code = selectedRow.children[0].textContent; // mr_code 값
    var param = "mr_code="+mr_code;

    var statusTd = selectedRow.querySelector('td:nth-child(5)');
	var currentStatus = statusTd.textContent.trim();

    
    // 이미 차단되었거나 삭제 요청된 리뷰는 베스트 설정 불가
    if (currentStatus === '관리자 차단' || currentStatus === '삭제 요청') {
        alert('이 리뷰는 베스트 리뷰로 설정할 수 없습니다.');
        return;
    }
    sendRequest('bestViewOK.do', param, bestReviewActionResult,'GET');
}

function bestReviewActionResult() {
    if (XHR.readyState === 4) {
        if (XHR.status === 200) {  
            var result = XHR.responseText;
            var data = JSON.parse(result);
            var mr_code = data.mr_code;
            
            console.log("서버 응답:", result);
            console.log("파싱된 데이터:", data.mr_code);
            console.log("결과 값:", data.result);
            
            if (data.result > 0) {
                var rows = document.querySelectorAll('tr');
                rows.forEach(function(row) {
                    var selectrow = row.querySelector('td[name="mr_code"]');
                    
                    if (selectrow && selectrow.textContent === data.mr_code) {
                        var statusTd = row.querySelector('td:nth-child(5)');
                        
                        if (statusTd) {
                            var currentStatus = statusTd.textContent.trim();
                            
                            if (currentStatus === '베스트') {
                                // 베스트 상태 해제
                                statusTd.innerHTML = '';
                                // 삭제 버튼 다시 표시
                                var deleteButtonTd = row.querySelector('td:nth-child(6)');
                                if (deleteButtonTd) {
                                    deleteButtonTd.innerHTML = '<input type="button" value="삭제" onclick="deleteReviewAction(event)">';
                                }
                            } else {
                                // 베스트 상태로 변경
                                statusTd.innerHTML = '<a  class="status-best">베스트</a>';
                                // 삭제 버튼 제거
                                var deleteButtonTd = row.querySelector('td:nth-child(6)');
                                if (deleteButtonTd) {
                                    deleteButtonTd.innerHTML = '';
                                }
                            }
                            
                            // 베스트 리뷰 설정 버튼 텍스트 변경
                            var bestButtonTd = row.querySelector('td:nth-child(7)');
                            if (bestButtonTd) {
                                var bestButton = bestButtonTd.querySelector('input[type="button"]');
                                if (bestButton) {
                                    bestButton.value = currentStatus === '베스트' ? 
                                        "베스트 리뷰 설정" : "베스트 리뷰 해제";
                                }
                            }
                        }
                    }
                });
            }
        }
    }
}



	

</script>
</html>