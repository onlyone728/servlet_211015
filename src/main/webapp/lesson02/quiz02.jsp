<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz02</title>
<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1 class="mb-5">날짜, 시간 링크</h1>
		<!-- <form method="get" action="/lesson02/quiz02_1.jsp">
			<a href="/lesson02/quiz02_1.jsp?select=time" class="btn btn-primary">현재 시간 확인</a>
			<a href="/lesson02/quiz02_1.jsp?select=date" class="btn btn-success">현재 날짜 확인</a>
		</form> -->
		<!-- 풀이 -->
		<a href="/lesson02/quiz02_2.jsp?type=time" class="btn btn-info">현재 시간 확인</a>
		<a href="/lesson02/quiz02_2.jsp?type=date" class="btn btn-success">현재 날짜 확인</a>
	</div>
</body>
</html>