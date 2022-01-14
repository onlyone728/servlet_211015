package com.test.quiz;

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
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		// get parameter
		String nickname = request.getParameter("nickname");
		String title = request.getParameter("title");
		int price = Integer.valueOf(request.getParameter("price"));
		String description = request.getParameter("description");
		String picture = request.getParameter("url");
		
		// DB 연동
		MysqlService mysql = MysqlService.getInstance();
		mysql.connection();
		
		// seller table에서 sellerId 확인
		String query = "select * from `seller` where `nickname` = " + nickname;
		
		ResultSet result = mysql.select(query);
		int sellerId = result.getInt("id");
		
		// insert query
		String insertQuery = "insert into `used_goods` (`sellerId`, `title`, `description`,`price`, `picture`)"
				+ "values (" + sellerId + ", '" + title + "', '" + description + "', " + price + ", '" + picture + "')";
		
		// DB 해제
		mysql.disconnection();
		
		// 리다이렉트 -> 목록 페이지(list_template.jsp)
	}
}
