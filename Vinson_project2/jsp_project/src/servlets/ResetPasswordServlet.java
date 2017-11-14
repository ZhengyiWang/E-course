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
@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/ResetPasswordServlet"})
public class ResetPasswordServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();

		MariaConnection mariaConnection = new MariaConnection();
		Statement stmt = mariaConnection.getStatement();
		String sql;
		String user_name = (String) request.getSession().getAttribute("user_name");
		String old_password = request.getParameter("old_password");
		String new_password = request.getParameter("new_password");
		if(stmt == null) {
			response.setStatus(403);
			out.print("Database connect failed");
			out.flush();
			out.close();
		} else {
			sql = "select * from user where user_name = '" + user_name + "' and password = '" + old_password + "'";
			try (ResultSet rs = stmt.executeQuery(sql)) {
				if(!rs.next()) {
					response.setStatus(403);
					out.print("Old password is incorrect");
					out.flush();
					out.close();
				} else {
					sql = "update user set password = '" + new_password + "' where user_name = '" + user_name + "' and password = '" + old_password + "'";
					stmt.execute(sql);
					out.print("Success");
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
