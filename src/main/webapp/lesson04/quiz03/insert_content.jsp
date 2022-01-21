<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.common.MysqlService" %> 
<%@ page import="java.sql.ResultSet" %>

<%
	// DB 연동
	MysqlService mysql = MysqlService.getInstance();
	mysql.connection();
	
	// select query
	String query = "select `id`, `nickname` from `seller`";
	ResultSet result = mysql.select(query);
%>

<div class="content w-75 mx-auto">
	<h1 class="display-4 my-5">물건 올리기</h1>
	<form method="post" action="/db/quiz03_insert" id="inputForm">
			<div class="d-flex justify-content-between">
				<select class="form-control col-2" name="sellerSelect" id="sellerSelect">
					<option value="default">-아이디 선택-</option>
					<%
						while (result.next()) {
					%>
					<option value="<%=result.getInt("id") %>"><%= result.getString("nickname") %></option>
					<%
						}
					%>
				</select>
				<input type="text" class="form-control mx-2 col-6" name="title" id="titleInput" placeholder="제목">
				<div class="input-group col-3">
					<input type="text" name="price" id="priceInput" class="form-control" placeholder="가격">
					<div class="input-group-append">
						<span class="input-group-text">원</span>
					</div>
				</div>
			</div>
			<textarea rows="10" class="form-control my-3" name="description"></textarea>
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">이미지 url</span>
				</div>
				<input type="text" name="imageUrl" class="form-control">
			</div>
			<input type="submit" value="저장" class="btn btn-secondary btn-block mt-3">
	</form>
</div>


<script>
	$(document).ready(function() {
		$("#inputForm").on("submit", function(e) {
			let title = $("#titleInput").val;
			let price = $("#priceInput").val();
			
			if ($("#sellerSelect").val() == "default") {
				alert("판매자를 선택하세요.");
				return false;
			}
			if (title == "" || title = null) {
				alert("제목을 입력하세요.");
				return false;
			}
			if (price == "" || price = null) {
				alert("가격을 입력하세요.");
				return false;
			}
			return true;
		});
	});
</script>