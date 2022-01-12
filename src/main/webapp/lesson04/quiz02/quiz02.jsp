<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.common.MysqlService" %>  
<%@ page import="java.sql.ResultSet" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
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
	// DB 연결
	MysqlService mysql = MysqlService.getInstance();
	mysql.connection();
	
	// select query
	String query = "select * from `bookmark` order by `id` desc";
	ResultSet result = mysql.select(query);
%>
	<div class="container">
		<table class="table text-center">
			<thead>
				<tr class="row">
					<th class="col-3">사이트</th>
					<th class="col-6">사이트 주소</th>
					<th class="col-3"></th>
				</tr>
			</thead>
			<tbody>
			<%
				while (result.next()){
			%>
				<tr class="row">
					<td class="col-3"><%= result.getString("name") %></td>
					<td class="col-6"><a href="<%= result.getString("url") %>"><%= result.getString("url") %></a></td>
					<td class="col-3"><a href="/db/quiz02_delete?id=<%= result.getInt("id") %>" class="btn btn-warning">삭제하기</a></td>
				</tr>
			<%
				}
			%>
				<tr class="row">
					<td class="col-3"></td>
					<td class="col-6"></td>
					<td class="col-3"><a href="/lesson04/quiz02/quiz02_1.jsp" class="btn btn-primary">추가하기</a></td>
				</tr>
			</tbody>
		</table>
		
	</div>
<%
	mysql.disconnection();
%>	
</body>
</html>