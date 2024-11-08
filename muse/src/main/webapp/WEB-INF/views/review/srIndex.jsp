<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
.search-container{
	display: flex;
    flex-direction: column;
    align-items: center;
	width: 605px;
    margin: 200px auto;
}

.submitButton{
  background-image: url('/muse/resources/img/main/search.png');
  background-size: cover;        /* 이미지가 버튼 크기에 맞춰지도록 설정 */
  background-repeat: no-repeat;  /* 이미지가 반복되지 않도록 설정 */
  background-position: center;   /* 이미지가 중앙에 위치하도록 설정 */
  width: 40px;                   /* 버튼의 너비를 이미지 크기에 맞게 설정 */
  height: 40px;                  /* 버튼의 높이를 이미지 크기에 맞게 설정 */
  border: none;                  /* 버튼의 기본 테두리 제거 */
  padding: 0;                    /* 버튼 안의 기본 여백 제거 */
  cursor: pointer;               /* 커서를 포인터로 변경 */
  background-color: transparent;
}

.srIndexHr {
  color: #ff3d32;
  width: 100%; /* hr 너비를 form과 맞추기 */
  margin-top: 10px; /* hr 위에 여백 추가 */
  border: 1px solid #ff3d32;
  margin-bottom: 20px;
    margin-top: 15px;
}

form {
  display: flex;
  align-items: center;
  gap: 60px; /* input 사이 간격 조정 */
  margin-bottom: 10px; /* hr과 form 사이에 여백 추가 */
  
  
}

#searchInput{
 outline: none; 
 border: none;
 font-size:20pt;
 text-align: center;
}
</style>


</head>
<body>
<%@include file="../header.jsp" %>


<div class="search-container">
    <h1 style="margin-bottom:50px;">공연명 또는 공연장을 검색하세요!</h1>
    <form name="" action="srsearchresult.do">
        <select style=" border: none;font-size:16pt;outline: none;" name="searchTag">
            <option value="m_title">공연명</option>
            <option value="mh_name">공연장</option>
        </select>
        <input name="searchWord" type="text" id="searchInput" placeholder="공연명 또는 공연장을 검색하세요." style="" required>
        <input type="submit" class="submitButton" value="" >
    </form>
    <hr class="srIndexHr">
</div>

<%@include file="../footer.jsp" %>
</body>


<script>
const searchInput = document.getElementById('searchInput');
const placeholderText = "공연명 또는 공연장을 검색하세요.";

searchInput.addEventListener('focus', function() {
    this.placeholder = ""; // 클릭 시 플레이스홀더 제거
});

searchInput.addEventListener('blur', function() {
    if (this.value === "") {
        this.placeholder = placeholderText; // 입력 없으면 플레이스홀더 복원
    }
});
</script>
</html>