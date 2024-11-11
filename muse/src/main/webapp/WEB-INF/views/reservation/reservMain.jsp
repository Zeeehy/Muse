<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<link rel="stylesheet" type="text/css" href="resources/css/Yuri.css">
<script>
console.log("로드");

function updateTimes() {
    var selectedDate = document.getElementById("playDate").value;
    console.log("선택날짜:", selectedDate); 

    var playTimeSelect = document.getElementById("playTime");
    playTimeSelect.innerHTML = "<option>선택하세요!</option>";

    if (selectedDate !== "선택하세요!") {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/getMusicalTimeByDate?selectedDate=" + encodeURIComponent(selectedDate), true);
        //xhr.open("GET", window.location.origin + "/getMusicalTimeByDate?selectedDate=" + encodeURIComponent(selectedDate), true);

        console.log("AJAX 요청을 보냄:", "/getMusicalTimeByDate?selectedDate=" + encodeURIComponent(selectedDate));

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                console.log("AJAX 응답 수신, 상태 코드:", xhr.status);  // 응답 상태 코드 확인
                if (xhr.status === 200) {
                    var data = JSON.parse(xhr.responseText);

                    console.log("서버에서 가져온 시간 데이터:", data);  // 서버 데이터 확인

                    data.forEach(function(time) {
                        var option = document.createElement("option");
                        option.value = time;
                        option.textContent = time;
                        playTimeSelect.appendChild(option);
                    });
                } else {
                    console.error("AJAX 요청 실패:", xhr.status);  // 실패한 경우 상태 코드 출력
                }
            }
        };
        xhr.send();
    }
}

window.onload = function() {
    console.log("window.onload 호출됨");
    document.getElementById("playDate").addEventListener("change", updateTimes);
};

</script>


</head>
<body>
<h1>예매페이지</h1>
<form>
    <section class="reservWrap">
        <article class="contWrap">
            <header class="step">
                <h2>01 좌석 선택</h2>
                <h3>[ ${musicalInfo.M_TITLE} ] <span> | ${musicalInfo.MH_NAME}</span></h3>
                <div class="select">
                    <em>다른 관람일자 선택 : </em>
                    <span>일자</span>
                    <select id="playDate">
                        <option>선택하세요!</option>
                        <c:forEach var="date" items="${playDate}">
                            <option value="${date}">${date}</option>
                        </c:forEach>
                    </select>
                    <span>시간</span>
                    <select id="playTime">
                        <option>선택하세요!</option>
                    </select>
                </div>
            </header>
            <section class="allSeat">
                <aside class="seatL"></aside>
                <aside class="seatR">
                    <div class="s Floor">
                        <h2>원하시는 좌석 위치를 선택해주세요.</h2>
                        <div>
                            <ul>
                                <li>1F <input type="checkbox"></li>
                                <li>2F <input type="checkbox"></li>
                                <li>3F <input type="checkbox"></li>
                            </ul>
                        </div>
                    </div>
                    <div class="s Rating">
                        <h2>좌석등급 / 잔여석</h2>
                        <div>
                            <ul>
                                <li>
                                    <div>
                                        <img src="#">VIP석
                                        <span>0석</span>
                                    </div>
                                    <span>170,000원</span>
                                </li>
                                <li>
                                    <div>
                                        <img src="#">R석
                                        <span>0석</span>
                                    </div>
                                    <span>140,000원</span>
                                </li>
                                <li>
                                    <div>
                                        <img src="#">S석
                                        <span>0석</span>
                                    </div>
                                    <span>110,000원</span>
                                </li>
                                <li>
                                    <div>
                                        <img src="#">A석
                                        <span>0석</span>
                                    </div>
                                    <span>80,000원</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="s Choice">
                        <h2>선택좌석 </h2>
                        <div></div>
                    </div>
                    <div class="s Button">
                        <button class="nextBt">좌석선택완료</button>
                        <div class="subBtList">
                            <button class="subBt">이전단계</button>
                            <button class="subBt">좌석 다시 선택</button>
                        </div>
                    </div>
                </aside>
            </section>
        </article>
    </section>
</form>
</body>
</html>
