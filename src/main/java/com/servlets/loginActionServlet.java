package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.UserDao;

@WebServlet("/loginActionServlet")
public class loginActionServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		HttpSession session = request.getSession();

		if ("admin@gmail.com".equals(email) && "admin".equals(pass)) {
			session.setAttribute("email", email);
			response.sendRedirect("admin/adminHome.jsp");
		} else {
			int flag = 0;
			try {

				Connection con = UserDao.getConn();
				String query = "select * from users where email='" + email + "' and password ='" + pass + "';";

				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(query);

				while (rs.next()) {
					flag = 1;
					session.setAttribute("email", email);
					response.sendRedirect("home.jsp?msg=exist");
				}
				if (flag == 0)
					response.sendRedirect("login.jsp?msg=notExist");
			} catch (Exception e) {
				System.out.println(e);
				response.sendRedirect("login.jsp?msg=Error");
			}
		}

	}

}
