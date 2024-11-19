<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.modal {
    width: 600px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    padding: 20px;
    position: relative;
    font-family: Arial, sans-serif;
}

.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 1.2em;
    color: #333;
}

.close-btn {
    font-size: 1.5em;
    background: none;
    border: none;
    cursor: pointer;
}

.modal-tabs {
    display: flex;
    margin-top: 10px;
}

.tab {
    flex: 1;
    text-align: center;
    padding: 10px;
    cursor: pointer;
    background: #d9534f;
    border: 1px solid #bbb;
    color: white;
}

.filter {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-top: 15px;
}

.search-bar {
    flex: 1;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.recommendation {
    margin: 15px 0;
    color: #555;
    font-size: 0.9em;
}

.items {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}

.item {
    width: 48%;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 10px;
    display: flex;
    align-items: center;
    gap: 10px;
}

.item img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
}

.item-info h3 {
    margin: 0;
    font-size: 0.95em;
    color: #333;
}

.item-info p {
    margin: 2px 0;
    font-size: 0.8em;
    color: #666;
}

.actions {
    margin-top: 15px;
    display: flex;
    gap: 10px;
    justify-content: center;
}

.register-btn, .cancel-btn {
    padding: 8px 15px;
    font-size: 0.9em;
    cursor: pointer;
    border: none;
    border-radius: 4px;
}

.register-btn {
    background-color: #d9534f;
    color: white;
}

.cancel-btn {
    background-color: #ccc;
}
</style>
<script>
function getSearchCast(){
	//생각해보니 얜 굳이 ajax로 할 필요가?페이징할땐 필요하려나
	var filter = document.getElementById('filter').value;
	var search_cast=document.getElementById('search_cast').value;
	var xhr = new XMLHttpRequest();
	if(document.getElementById('filter').checked){
		xhr.open('GET', 'museCastingSearchActor.do?search_cast=' + search_cast, true);
	} else {
		xhr.open('GET', 'museCastingSearchMusical.do?search_cast=' + search_cast, true);
	}
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            document.getElementById('items').innerHTML = JSON.parse(xhr.responseText);
        }
    };
    xhr.send();

}

function insertLikeActor(){
	var user_id = "${sessionScope.s_id}";
	var checkedValues = [];
	var likeActorList =  document.getElementsByName("actorCheck");
	for(var i=0; i<likeActorList.length;i++){
		if(likeActorList[i].checked){
			checkedValues.push(likeActorList[i].id);
			alert(likeActorList[i].id);
		}
		
	}
	
	if(checkedValues.length==0){
		window.alert('등록하려면 체크를 해주세요');
		return;
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "insertLikeActor.do", true);
	xhr.setRequestHeader("Content-Type", "application/json");
	xhr.onload = function (){
		if(xhr.status === 200){	
			alert('관심배우 추가 성공');
			location.reload();
		} else{
			alert('관심배우 추가 실패');
		}
	};
	xhr.send(JSON.stringify({insertLikeActorList: checkedValues,
        user_id: user_id}));
	
}

function insertLikeMusical(){
	var user_id = "${sessionScope.s_id}";
	var checkedValues = [];
	var likeMusicalList =  document.getElementsByName("musicalCheck");
	for(var i=0; i<likeMusicalList.length;i++){
		if(likeMusicalList[i].checked){
			checkedValues.push(likeMusicalList[i].id);
			alert(likeMusicalList[i].id);
		}
		
	}
	
	if(checkedValues.length==0){
		window.alert('등록하려면 체크를 해주세요');
		return;
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "insertLikeMusical.do", true);
	xhr.setRequestHeader("Content-Type", "application/json");
	xhr.onload = function (){
		if(xhr.status === 200){	
			alert('관심공연 추가 성공');
			location.reload();
		} else{
			alert('관심공연 추가 실패');
		}
	};
	xhr.send(JSON.stringify({insertLikeMusicalList: checkedValues,
        user_id: user_id}));
	
}

function insertLike(){
	var filter = document.getElementById('filter').value;
	if(document.getElementById('filter').checked){
		insertLikeActor();
	} else {
		insertLikeMusical();
	}
}

</script>
</head>
<body>
<div class="modal">
    <div class="modal-header">
        <h2>뮤즈캐스트 설정하기</h2>
        <button class="close-btn">×</button>
    </div>
    <div class="modal-tabs">
        <button class="tab">관심배우/공연</button>
    </div>
    <div class="modal-content">
        <div class="filter">
            <label><input type="radio" name="filter" id="filter" checked> 관심배우</label>
            <label><input type="radio" name="filter"> 관심공연</label>
            <input type="text" placeholder="검색" class="search-bar" id="search_cast">
            <button class="search-btn" onclick="getSearchCast()">검색</button>
        </div>
        <div class="recommendation">
            <span>뮤즈 추천 인물 정보가 총 0건 있습니다.</span>
        </div>
        <div class="items" id="items">
        </div>
        <div class="actions">
            <button class="register-btn" onclick="insertLike()">등록</button>
            <button class="cancel-btn">취소</button>
        </div>
    </div>
    <!--<form enctype="application/x-www-form-urlencoded"></form>  -->
</div>
</body>
</html>