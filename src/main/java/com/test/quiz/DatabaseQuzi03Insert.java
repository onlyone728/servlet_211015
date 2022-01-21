package com.test.quiz;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/db/quiz03_insert")
public class DatabaseQuzi03Insert extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// get parameter
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String imageUrl = request.getParameter("imageUrl");
		String description = request.getParameter("description");
		String sellerId = request.getParameter("sellerSelect");
		
		// DB 연동
		MysqlService mysql = MysqlService.getInstance();
		mysql.connection();
		
		// insert query
		String insertQuery = "insert into `used_goods` (`sellerId`, `title`, `description`,`price`, `picture`)"
				+ "values (" + sellerId + ", '" + title + "', '" + description + "', " + price + ", '" + imageUrl + "')";
		try {
			mysql.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// DB 해제
		// mysql.disconnection();
		
		// 리다이렉트 -> 목록 페이지(list_template.jsp)
		response.sendRedirect("/lesson04/quiz03/list_template.jsp");
	}
}
