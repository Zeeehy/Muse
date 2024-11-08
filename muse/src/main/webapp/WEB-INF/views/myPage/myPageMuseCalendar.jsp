<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
</head>

<body>
<div id='calendar'></div>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth',
		locale : 'ko', 
		headerToolbar : {
        	start : "",
            center : "prev title next",
            end : 'dayGridMonth,dayGridWeek,dayGridDay'
            },
	selectable : true,
	droppable : true,
	editable : true,
	events : [
        <c:forEach var="calendar" items="${calendarList}">
            {
                title: '${calendar.calendar_Title}',
                start: '${calendar.calendar_Start}',
                end: '${calendar.calendar_End}',
                color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
            },
        </c:forEach>
    ]
			});
			calendar.render();
		});
</script>
</body>
</html>