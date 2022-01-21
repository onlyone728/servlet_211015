<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.test.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>	
	
<%
	// 판매자 아이디 정보들을 가져온다
	MysqlService mysqlService = new MysqlService();
	mysqlService.connection();
	
	String query = "select id, nickname from seller";
	ResultSet result = mysqlService.select(query);
%>

<section class="mt-5 d-flex justify-content-center">
	<div>
		<div class="display-4">물건 올리기</div>
		<div class="input-box mt-5">
			<form id="inputForm" action="/db/quiz03/insert_goods" method="POST">
				<div class="d-flex justify-content-between">
					<select class="form-control col-3" id="sellerSelect" name="sellerSelect">
						<option value="default">-아이디 선택-</option>
						<%
							// 판매자 아이디 목록들
							while (result.next()) {
						%>
						<option value="<%=result.getInt("id") %>"><%=result.getString("nickname") %></option>
						<%
							}
						%>						
						
					</select> <input type="text" class="form-control col-5" name="title"
						placeholder="제목" id="titleInput">
					<div class="input-group  col-3">
						<input type="text" class="form-control" name="price"
							placeholder="가격" id="priceInput">
						<div class="input-group-append">
							<span class="input-group-text">원</span>
						</div>
					</div>

				</div>
				
				<textarea class="form-control mt-3" cols="100" rows="5" name="description"></textarea>
				
				<div class="input-group mt-3">
					<div class="input-group-prepend">
						<span class="input-group-text">이미지 url</span>
					</div>
					<input type="text" class="form-control " name="imageUrl">

				</div>
				<input type="submit" value="저장" class="btn btn-block mt-3">
			</form>
		</div>
	</div>
</section>

<script>
	$(document).ready(function() {
		$("#inputForm").on("submit", function(e) {

			var title = $("#titleInput").val();
			var price = $("#priceInput").val();

			if ($("#sellerSelect").val() == "default") {
				alert("판매자를 선택하세요.");
				return false;
			}

			if (title == null || title == "") {
				alert("제목을 입력하세요.");
				return false;
			}

			if (price == null || price == "") {
				alert("가격을 입력하세요.");
				return false;
			}

			return true;
		});
	});
</script>