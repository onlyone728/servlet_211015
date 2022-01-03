<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
<!-- 1. 1부터 n까지의 합계를 구하는 함수 -->
<%!
	public int getSum(int n){
		int sum = 0;
		for (int i = 1; i <= n; i++){
			sum += i;
		}
		return sum;
}
%>
	<h1>1부터 50까지의 합은 <%= getSum(50) %> 입니다.</h1>

<!-- 2. 점수들의 평균 구하기
스크립틀릿(scriptlet) <% %> 문법을 사용해서 주어진 점수들의 평균을 구하세요. -->
<% 
	int[] scores = {80, 90, 100, 95, 80};
	int sum = 0;
	for (int i = 0; i < scores.length; i++){
		sum += scores[i];
	}
	double average = (double)sum / scores.length;
%>
<h1>평균 점수는 <%= average %>점 입니다.</h1>


<!-- 3. 채점 결과
아래 채점표로 시험점수가 몇점인지 구하세요. -->
<%
	List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"}); 
	int count = 0;
	for (int i = 0; i < scoreList.size(); i++){
		if (scoreList.get(i) == "O"){
			count++;
		}
	}
	int score = 100 / scoreList.size() * count;
%>
<h1>채점 결과는 <%= score %>점 입니다.</h1>

<!-- 4. 나이 구하기
주어진 생년월일을 가진 사람의 나이를 구하세요. -->
<%
	String birthDay = "20010820";
	String year = birthDay.substring(0, 4);
	// out.print(year);
	
	// int intBirth = Integer.valueOf(birthDay);
	// int year = intBirth / 10000;
	int age = 2021 - Integer.parseInt(year) + 1;
%>
<h1><%= birthDay %>의 나이는 <%= age %>세 입니다.</h1>

</body>
</html>