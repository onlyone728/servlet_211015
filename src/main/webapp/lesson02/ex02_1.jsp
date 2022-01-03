<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get Method</title>
</head>
<body>
	<!-- request 객체는 jsp에서 바로 사용할 수 있다. -->
	<Strong>아이디</Strong>
	<%= request.getParameter("user_id") %>
	<br>
	
	<Strong>이름</Strong>
	<%= request.getParameter("name") %>
	<br>
	
	<Strong>나이</Strong>
	<%= request.getParameter("age") %>
</body>
</html>