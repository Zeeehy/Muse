<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="header">
	<div class="left-section">
        <input type="image" src="/muse/resources/img/museimage.png" class="header-image" onclick="window.location.href='partnerMainForm.do';">

         
         <select>
         	<option selected>기획사</option>
         	<option>2</option>
         	<option>3</option>
         </select>
         <p>를 선택해주세요</p>
         </div>
          <div class="right-section">
         	<a>박형주님</a>|<a>로그아웃</a>
         	<input type="hidden" value="pr_1" name="pr_code">
         	<!-- <input type="hidden" value="${pr_code}" name="pr_code"> -->
          </div>
    </div>
</body>
</html>