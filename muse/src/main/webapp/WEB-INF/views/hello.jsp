<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>hello.jsp</h1>
	<h3>메세지:${msg}</h3>
	

	<h5 >${dto.idx}</h5>
	<h5 >${dto.name}</h5>
	<h5 >${dto.email}</h5>
	<h5 >${dto.dept}</h5>
		
	
</body>
</html>