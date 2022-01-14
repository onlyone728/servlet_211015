package com.test.quiz;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/db/quiz02_insert")
public class DatabaseQuiz02Insert extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// DB 연결
		MysqlService mysql = MysqlService.getInstance();
		mysql.connection();
		
		// get parameter
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		
		// insert query
		String insertQuery = "insert into `bookmark` (`name`, `url`)" 
		+ "values ('" + name + "', '" + url + "')";
		
		try {
			mysql.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// DB 해제
		mysql.disconnection();
		
		// 리다이렉트(목록페이지 quiz02.jsp)
		response.sendRedirect("/lesson04/quiz02/quiz02.jsp");
	}
}
