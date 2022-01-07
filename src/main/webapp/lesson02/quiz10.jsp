<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar 달력 만들기</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
</head>
<body>
<%
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
%>
	<div class="container">
		<h1 class="text-center"><%= sdf.format(cal.getTime()) %></h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-danger">일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</thead>
			<tbody>
			<%
				cal.set(Calendar.YEAR, 2022);
				cal.set(Calendar.MONTH, 0);
				cal.set(Calendar.DAY_OF_MONTH, 1);
				int year = cal.get(Calendar.YEAR); 
				int month = cal.get(Calendar.MONTH)+1; 
				int startDay = cal.get(Calendar.DATE); 
				int startDayOfWeek = cal.get(Calendar.DAY_OF_WEEK); 
				int lastDay = cal.getActualMaximum(Calendar.DATE);
				
				cal.set(Calendar.DATE, lastDay);
				int lastWeek = cal.get(Calendar.WEEK_OF_MONTH); 

			%>
				<tr>
				<% 
					// 1일 전 공백 처리
					for (int i = 1; i < startDayOfWeek; i++) {
				%>
					<td></td>
				<%		
					}
				%>
				<%
					for (int i = 1; i <= lastDay; i++) {
						startDayOfWeek++;
						if (startDayOfWeek % 7 == 2) {
				%>
				</tr>
				<tr>
				<%
						}
						if (startDayOfWeek % 7 == 2) {
				%>
					<td class="display-4"><%= i %></td>
					<%
						} else if (startDayOfWeek % 7 == 1) {
					%>
					<td class="display-4"><%= i %></td>
					<%
						} else {
					%>
					<td class="display-4"><%= i %></td>
					<% 
						}
					}	
					%>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>