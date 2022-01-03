package com.test.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex03")
public class GetMethodEx03 extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/plain");
		response.setContentType("text/json");
		
		PrintWriter out = response.getWriter();

		String userId = request.getParameter("user_id");
		String name = request.getParameter("name");
		Integer age = Integer.parseInt(request.getParameter("age"));
//		out.println("user_id : " + userId);
//		out.println("name : " + name);
//		out.println("age : " + age);
		
		// JSON(Javascript Object Notation)으로 response 구성하기
		// {"user_id":"onlyone728", "name":"hana", "age":36}
		out.print("{\"user_id\":\"" + userId + "\", \"name\":\"" + name + "\", \"age\":" + age + "}");
		out.print("test");
	}
}
