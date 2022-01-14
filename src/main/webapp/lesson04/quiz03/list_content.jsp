<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.common.MysqlService" %>    
<%@ page import="java.sql.ResultSet" %>    
<%
	// DB 연결
	MysqlService mysql = MysqlService.getInstance();
	mysql.connection();
	
	// select query
	String query = "select * from `seller` as A join `used_goods` as B on A.id = B.sellerId order by B.`id` desc;";
	ResultSet result = mysql.select(query);
%>
<div class="content mt-3">
	<article class="d-flex flex-wrap justify-content-between">
	<%
		while (result.next()) {
	%>
		<div class="box p-3 mb-3">
			<div class="descriptionImg">
				<img src="<%= result.getString("B.picture") %>" alt="사진" width="300">
			</div>
			<div class="description mt-2">
				<h4 class="title"><%= result.getString("B.title") %></h4>
				<div class="price"><%= result.getInt("B.price") %></div>
				<div class="name"><%= result.getString("A.nickname") %></div>
			</div>
		</div>
	<%
		}
	%>
	</article>
</div>
<%
	// DB 해제
	mysql.disconnection();
%>