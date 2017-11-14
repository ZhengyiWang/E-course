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
@WebServlet(name = "ExamServlet", urlPatterns = {"/ExamServlet"})
public class ExamServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String choice = request.getParameter("choices");
		String choices[] = choice.split(",");
		String course_name = request.getParameter("course_name");
		String user_name = (String) request.getSession().getAttribute("user_name");
		MariaConnection mariaConnection = new MariaConnection();
		Statement stmt = mariaConnection.getStatement();
		String sql;
		if(stmt == null) {
			response.setStatus(503);
			out.print("Database connect failed");
			out.flush();
			out.close();
		} else {
			sql = "select answer from exam where course_name = '" + course_name + "'";
			try (ResultSet rs = stmt.executeQuery(sql)) {
				if(rs.next()) {
					String answer = rs.getString(1);
					String[] answers = answer.split(",");
					double each = 0, total = 0;
					int len = answers.length;
					each = 100.0 / len;
					for(int i = 0; i < len; ++i) {
						if(answers[i].equals(choices[i])) {
							total += each;
						}
					}
					sql = "update user_rel_course set score = " + Double.toString(total) + " where course_name = '" + course_name + "' and user_name = '" + user_name + "'";
					stmt.execute(sql);
					out.print("Success");
					out.flush();
					out.close();
				} else {
					response.setStatus(403);
					out.print("Something is wrong");
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
