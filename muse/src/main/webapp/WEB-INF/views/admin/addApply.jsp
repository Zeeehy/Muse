<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/muse/resources/css/Phj.css">
<link rel="stylesheet" href="/muse/resources/css/Ljh.css">
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
</head>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>

<style>
.radio-btn {
   margin-right: 8px; /* 라디오 버튼과 텍스트 사이의 간격 조정 */
}

/* 라디오 버튼을 조금 더 커지게 설정 */
.radio-btn {
   width: 16px;
   height: 16px;
   margin-right: 5px;
}
.table-content td input[type="radio"], td input[type="checkbox"] {
   width: auto;
   margin-right: 15px;
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
.textarea-style {
   width: 100%;
   height: 80px;
   border-radius: 8px; /* 둥근 모서리 */
   font-size: 16px;
   background-color: #f9f9f9;
   resize: none; /* 크기 조절 아이콘 제거 */
}
</style>
<body>
   <div class="main-content">
      <div class="main-contenttop">
         <h1>공연 등록 승인</h1>
         <hr id="hrLine">
      </div>
      <form name="insertMusical" action="">
      <div class="table-content">
         <table>
            <tr>
               <th style="width: 20%;">뮤지컬명</th>
               <td colspan="5"><input type="text" name="m_title" value="${dto.m_title}" readonly></td>
            </tr>

            <tr>
                  <th>등록 유형</th>
                  <td class="radio-container" style="width: 160px; text-align: right">
                     <label> <input type="radio" name="registration_type" 
                      class="radio-btn" checked> 신규 등록
                  </label>
                  </td>
                  <td class="radio-container" colspan="2"
                     style="width: 25%; text-align: left;"><label> <input
                        type="radio" name="registration_type" value="update"
                        class="radio-btn" disabled> 수정
                  </label></td>
               </tr>
            <tr>
               <th>관람 등급</th>
               <td colspan="5"><input type="text" name="m_age" value="${dto.m_age}" readonly></td>
            </tr>
            <tr>
               <th>공연장</th>
               <td colspan="5"><input type="text" name="mh_name" value="${dto.mh_name}" readonly></td>
            </tr>
            <tr>
               <th>공연 스케줄</th>
                <td colspan="5"><input type="text" name="m_date" value="${dto.m_startdate} ~ ${dto.m_enddate}" readonly></td>
            </tr>
            <tr>
               <th>판매 오픈 시간</th>
               <td colspan="5"><input type="text" name="m_openDate" value="${dto.m_opendate} ${dto.m_opentime}" readonly></td>
            </tr>
            <tr>
               <td colspan="3" style="text-align: center;"></td>
               <th colspan="2" style="text-align: center;">공연 시간(인터미션 포함)</th>
               <td><input type="text" name="m_time" value="${dto.m_time}분" readonly></td>
            </tr>
            <tr>
               <td colspan="3" style="text-align: center;"></td>
               <th colspan="2" style="text-align: center;">인터 미션 시간</th>
               <td><input type="text" name="m_inTime" value="${dto.m_intime}분" readonly></td>
            </tr>
            <tr>
               <th>매수 제한</th>
               <td colspan="5" style="text-align: center;"><input type="text" name="m_maxticket" value="${dto.m_maxticket}" readonly></td>
            </tr>
            <tr>
               <th>단독 판매 여부</th>
               <td colspan="3"></td>
               <td>
               <label> 사용 <input type="radio" name="m_single" value="1"  <c:if test="${dto.m_single == 1}">checked</c:if> disabled>
               </label></td>
               <td colspan="3"><label> 사용안함<input type="radio" value="0"  <c:if test="${dto.m_single == 0}">checked</c:if> disabled
                     name="m_single">
                  </label>
               </td>
            </tr>
            <tr>
               <th>캐스트 보드 사용 유무</th>
               <td colspan="3"></td>
               <td><label> 사용 <input type="radio" name="m_calender" value="1"  <c:if test="${dto.m_calendar == 1}">checked</c:if> disabled>
               </label></td>
               <td><label> 사용안함 <input type="radio" name="m_calender" value="0"  <c:if test="${dto.m_calendar == 0}">checked</c:if> disabled>
               </label></td>
            </tr>


            <tr>
               <th>포스터 정보</th>
               <td colspan="5"><input type="text" name="m_poster" value="${dto.m_poster}" readonly></td>
            </tr>
            <tr>
               <th>상세 이미지</th>
               <td colspan="5"><input type="text" name="m_detailImg" value="${dto.m_detailimg}" readonly></td>
            </tr>
            <tr>
               <th>공연 정보</th>
                  <td colspan="5"><textarea class="textarea-style" name="m_notice" readonly >${dto.m_notice}</textarea></td>
               </tr>
            
         </table>
         <div class="partnerInfo" style="margin-top: 100px;">
				<h2 style="text-align: center;">파트너 정보</h2>
				<table>
	                <tr>
	                    <th>파트너 명</th>
	                    <td><input type="text" value="${dto.pr_name}" readonly ></td>
	                </tr>
	                <tr>
	                    <th>사업자 번호</th>
	                    <td><input type="text" value="${dto.pr_num}" readonly ></td>
	                </tr>
	                <tr>
	                    <th>사업자 연락처</th>
	                    <td><input type="text" value="${dto.pr_pnum}" readonly></td>
	                </tr>
	                <tr>
	                    <th>사업자 이메일</th>
	                    <td><input type="text" value="${dto.pr_email}" readonly></td>
	                </tr>

				</table>
			</div>
			<div class="buttondiv" style="margin-bottom:50px;margin-top:50px;">
			
				<input class="blueButton" type="button" value="반영" onclick="window.location.href='addApplyEnd.do?m_code=${dto.m_code}'" style="margin: 10px; width: 90px;font-size: 16pt;height: 50px;">
				<input class="grayButton" type="button" value="뒤로가기" onclick="window.location.href='addApplyList.do'" style="margin: 10px; width: 90px;font-size: 16pt;height: 50px;">
				
			</div>
      </div>
   </form>
   </div>
</body>
<script>
//var count = 0;
var gradeList = [];
/* function addGrade(){
    count++;
    const table = document.getElementById("gradeTable");
    const gradePrice = document.getElementById("gradePrice").value;
    const gradeColor = document.getElementById("gradeColor").value;
} 

function addClickList(evnet){
   
}
*/
</script>
</html>