package com.test;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/db/quiz03/insert_goods")
public class ServletDBQuiz03 extends HttpServlet {
	@Override 
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String imageUrl = request.getParameter("imageUrl");
		String description = request.getParameter("description");
		String sellerId = request.getParameter("sellerSelect");
		
		MysqlService mysqlService = new MysqlService();
		mysqlService.connection();
		
		String query = "insert into `used_goods`"
				+ "(`sellerId`, `title`, `price`, `description`, `picture`)"
				+ "values"
				+ "(" + sellerId + ", '" + title + "', " + price + ", '" + description + "', '" + imageUrl + "')";
		
		//System.out.println(query);
		
		try {
			mysqlService.update(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("/hongdangmu/list_template.jsp");
	}
}
