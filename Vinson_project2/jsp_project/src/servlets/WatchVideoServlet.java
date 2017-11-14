package servlets;

import classes.MariaConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by cfenglv on 2016/12/28.
 */
@WebServlet(name = "WatchVideoServlet", urlPatterns = {"/WatchVideoServlet"})
public class WatchVideoServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();

		MariaConnection mariaConnection = new MariaConnection();
		Statement stmt = mariaConnection.getStatement();
		String sql;
		String user_name = (String) request.getSession().getAttribute("user_name");
		String course_name = request.getParameter("course_name");
		course_name = course_name.replace("Sharp", "#");
		course_name = course_name.replace("dot", ".");
		course_name = course_name.replace("Cpp", "C++");
		if(stmt == null) {
			response.setStatus(403);
			out.print("Database connect failed");
			out.flush();
			out.close();
		} else {
			sql = "update user_rel_course set learned = learned + 1 where user_name = '" + user_name + "' and course_name = '" + course_name + "'";
			try {
				stmt.executeQuery(sql);
				out.print("Success");
				out.flush();
				out.close();
			} catch (SQLException e) {
				e.printStackTrace();
				response.setStatus(403);
				out.print("Error");
				out.flush();
				out.close();
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
