<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* Header */

.header {
    background-color: #D9D9D9;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: flex-start;
    font-size: 24px;
    color: #333;
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 1;
    padding: 10px 20px;
}

.header-image {
    width: 100px;  /* 원하는 너비 */
    height: 50px; /* 원하는 높이 */
    margin-right: 40px; /* 이미지와 텍스트 사이의 간격 조정 */
}
.header select{
	border: none; /* 테두리 제거 */
    background-color: #f3f0f0; /* 배경색 변경 (예: 연한 하늘색) */
    padding: 5px 10px;
    border-radius: 5px; /* 모서리를 둥글게 */
}
.left-section {
            display: flex; /* 왼쪽 요소들 수평 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
        }
.right-section {
			padding-right:60px;
			margin:10px;
            display: flex; /* 오른쪽 요소들 수평 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
        }    

/*헤더 섹션 끝*/
</style>

</head>
<body>
	
	<div class="header">
        <input type="image" src="/muse/resources/img/museimage.png" class="header-image">
        <h3 style="margin-left:20px;">관리자</h3>
        <h6 style="margin-left: auto; margin-right: 45px;">관리자 로그인중</h6>
        <a href="adminLogout.do" style="text-decoration: none; font-size: 13pt; margin-right: 45px;">LOGOUT</a>
    </div>
</body>
</html>