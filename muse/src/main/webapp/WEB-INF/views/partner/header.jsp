<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</style>
</head>
<body>
	<div class="header">
	<div class="left-section">
        <input type="image" src="/muse/resources/img/museimage.png" class="header-image">
         
         <select>
         	<option selected>기획사</option>
         	<option>2</option>
         	<option>3</option>
         </select>
         <p>  를 선택해주세요</p>
         </div>
          <div class="right-section">
         	<a>박형주님</a>|<a>로그아웃</a>
          </div>
    </div>
</body>
</html>