<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍당무 마켓</title>
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
	
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>	
<style>
a:hover {text-decoration: none;}
header { height: 100px; background-color: #FF7F50;}
nav { height: 50px; background-color: #FF7F50;}
nav ul li a {color: #fff; font-weight: bold;}
/* .content {height:500px;} */
.box {border: solid 2px #FF7F50;}
.box:hover {background:linear-gradient(#FF7F50, yellow);}
.box .descriptionImg {width:320px; height: 200px; overflow: hidden;}
.description .name {color: #FF7F50;}
footer {height:80px;}
</style>	
</head>
<body>
	<div class="container">
		<jsp:include page="/lesson04/quiz03/header.jsp" />
		<jsp:include page="/lesson04/quiz03/menu.jsp" />
		<jsp:include page="/lesson04/quiz03/insert_content.jsp" />
		<jsp:include page="/lesson04/quiz03/footer.jsp" />
	</div>
</body>
</html>