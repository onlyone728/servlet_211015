<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.test.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>
	
<%
	// 데이터 가져오기 - 판매자, 물건을 조인해서 가져온다.
	MysqlService mysqlService = new MysqlService();
	mysqlService.connection();
	
	String query = "select A.nickname, B.title, B.price, B.picture from seller AS A	join used_goods AS B on A.id = B.sellerId";
	ResultSet result = mysqlService.select(query);
%>
	
<section class="mt-4 d-flex justify-content-center">
	<div class="d-flex flex-wrap ">

		<%
             while (result.next()) {
        %>
		<%-- goods-box가 상품 하나의 영역 --%>
		<div class="goods-box mb-3 mr-2">
			<div class="goods-image-box ">
			
				<%-- 이미지 없는 경우 --%>
				<%	if (result.getString("picture") == null || result.getString("picture").equals("")) { %>
				<div class="d-flex h-100 justify-content-center align-items-center">
					<h4 class="text-secondary">이미지 없음</h4>
				</div>
				
				<%-- 이미지 있는 경우 --%>
				<%
             		} else {
				%>
				<div class="goods-image-box">
					<img class="w-100" src="<%= result.getString("picture") %>">
				</div>             			
             	<%	
             		}
				%>
			</div>
			<div class="title mt-1"><%= result.getString("title") %></div>
			<div class="price mt-1"><%= result.getString("price") %>원</div>
			<div class="seller mt-1"><%= result.getString("nickname") %></div>
		</div>
		<% 	} %>
	</div>
</section>