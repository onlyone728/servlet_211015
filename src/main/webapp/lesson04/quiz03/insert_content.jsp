<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.common.MysqlService" %> 
<%@ page import="java.sql.ResultSet" %>

<%
	// DB 연동
	MysqlService mysql = MysqlService.getInstance();
	mysql.connection();
	
	// select query
	String query = "select * from `seller`";
	ResultSet result = mysql.select(query);
%>

<div class="content w-75 mx-auto">
	<h1 class="display-4 my-5">물건 올리기</h1>
	<form method="post" action="/db/quiz03_insert">
		<div>
			<div class="d-flex">
				<select class="form-control col-2" name="nickname" id="nickname">
					<option>-아이디 선택-</option>
					<%
						while (result.next()) {
					%>
					<option><%= result.getString("nickname") %></option>
					<%
						}
					%>
				</select>
				<input type="text" class="form-control mx-2 col-6" name="title" id="title" placeholder="제목">
				<div class="input-group col-3">
					<input type="text" name="price" id="price" class="form-control" placeholder="가격">
					<div class="input-group-append">
						<span class="input-group-text">원</span>
					</div>
				</div>
			</div>
			<textarea rows="10" class="form-control my-3" name="description"></textarea>
			<div class="input-group">
				<div class="input-group-append">
					<span class="input-group-text">이미지 url</span>
				</div>
				<input type="text" name="picture" class="form-control">
			</div>
			<input type="submit" value="저장" id="submitBtn" class="btn btn-secondary w-100 my-3">
		</div>
	</form>
</div>
<%
	// DB 해제
	mysql.disconnection();
%>

<script>
	$(document).ready(function() {
		$('#submitBtn').on('click', function(e) {
			let nickname = $("#nickname").val();
			let title = $("#title").val;
			let price = $("#price").val();
			
			if (nickname == '') {
				alert("닉네임을 선택하세요.");
				return;
			}
			if (title == '') {
				alert("제목을 입력하세요.");
				return;
			}
			if (price == '') {
				alert("가격을 입력하세요.");
				return;
			}
		});
	});
</script>