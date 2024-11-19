<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



</body>
<script type="text/javascript">
const seatsData = ${jsonSeats};

const updatedSeatsData = seatsData.map(seat => {
    // 좌석의 등급에 해당하는 할인 정보 찾기
    
    console.log(seat);
    
    alert(seat.floor);

});
</script>
</html>