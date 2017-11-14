package servlets;

import classes.MariaConnection;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by cfenglv on 2016/12/26.
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");
		String email_id = request.getParameter("email_id");
		String confirm = request.getParameter("confirm");
		String captcha = request.getParameter("captcha");
		String phone_number = request.getParameter("phone_number");
		String birthday = request.getParameter("birthday");
		String country = request.getParameter("country");

		MariaConnection mariaConnection = new MariaConnection();
		Statement stmt = mariaConnection.getStatement();
		String sql;

		int answer = (int)request.getSession().getAttribute("result");
		int input = Integer.parseInt(captcha);

		if(input != answer) {
			response.setStatus(403);
			out.print("captcha");
			out.flush();
			out.close();
			return ;
		}

		if(stmt == null) {
			response.setStatus(503);
			out.print("Database connect failed");
			out.flush();
			out.close();
		} else {
			sql = "select * from user where user_name = '" + user_name + "'";
			try (ResultSet rs = stmt.executeQuery(sql)) {
				if(rs.next()) {
					response.setStatus(403);
					out.print("user_name");
					out.flush();
					out.close();
				} else {
					sql = "insert into user set ";
					sql += "user_name = '" + user_name + "',";
					sql += "password = '" + password + "',";
					sql += "email_id = '" + email_id + "',";
					sql += "phone_number = '" + phone_number + "',";
					sql += "birthday = '" + birthday + "',";
					sql += "country = '" + country + "'";
					stmt.executeUpdate(sql);
					request.getSession().setAttribute("user_name", user_name);
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
