<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 팝업 스타일 */
#ActorPopup {
    display: none; /* 기본적으로 숨김 */
    position: absolute;
    top: 50%;
    left: 50%; 
    transform: translate(-50%, -50%);
    z-index: 1000;
}

.popupActorWrap {
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.2);
    border: 1px solid #ccc;
    padding: 20px;
    width: 300px;
    position: relative;
}

.actorClose-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    background: none;
    border: none;
    font-size: 1.2rem;
    cursor: pointer;
}

.popupActorWrap table {
    width: 100%;
    margin: 10px 0;
}

.popupActorWrap input[type="button"] {
    width: 80px;
    height: 40px;
    font-size: 14px;
    padding: 5px;
    border-radius: 5px;
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
    margin-left: 20px;
}
</style>
</head>
<body>

<!-- 팝업 요소 -->
<div id="ActorPopup">
    <div class="popupActorWrap">
        <button class="actorClose-btn" onclick="closeActorPopup()">X</button>
        <table>
            <tr>
                <td><input type="text" value=""></td>
                <td><input type="button" value="검색"></td>
            </tr>
            <tr>
                <th>이름</th>
                <th>생년월일</th>
            </tr>
            <tr>
                <td>김준수</td>
                <td>0000-00-00</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>