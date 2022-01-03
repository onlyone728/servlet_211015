package com.test.quiz;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlMappingQuiz02 extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		
		// 현재 시간은 14시 52분 43초 입니다.
		Date now = new Date();
		PrintWriter out = response.getWriter();
		SimpleDateFormat sdf = new SimpleDateFormat("현재 시간은 H시 m분 s초 입니다.");
		out.println(sdf.format(now));
	}
}
