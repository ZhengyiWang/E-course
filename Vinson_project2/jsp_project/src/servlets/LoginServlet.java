package servlets;

import classes.MariaConnection;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by cfenglv on 2016/12/26.
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();

		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");

		MariaConnection mariaConnection = new MariaConnection();
		Statement stmt = mariaConnection.getStatement();
		String sql;

		if(stmt == null) {
			response.setStatus(503);
			out.print("Database connect failed");
			out.flush();
			out.close();
		} else {
			sql = "select * from user where user_name = '" + user_name + "' and password = '" + password + "'";
			try (ResultSet rs = stmt.executeQuery(sql)) {
				if(rs.next()) {
					HttpSession ss = request.getSession();
					ss.setAttribute("user_name", user_name);
					ss.setMaxInactiveInterval(100000);
					out.print(ss.getId());
					out.flush();
					out.close();
				} else {
					response.setStatus(403);
					out.print("User name or Password is wrong");
					out.flush();
					out.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
