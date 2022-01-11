<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="d-flex align-items-center">
	<div class="logo col-2 d-flex align-items-center">
		<h1>
			<a href="/lesson03/quiz02/list_template.jsp" class="text-success">Melong</a>
		</h1>
	</div>
	<div class="seafch col-10 d-flex align-items-center">
		<form method="get" action="/lesson03/quiz02/detail_template.jsp">
			<div class="search-bar d-flex input-group">
				<input type="text" name="search" class="form-control">
				<div class="input-group-append">
					<input type="submit" class="btn btn-info" value="검색">
				</div>
			</div>
		</form>
	</div>
</header>