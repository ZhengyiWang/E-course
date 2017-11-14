package com.netcourse.controller;

import com.netcourse.dao.UserDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.netcourse.util.MD5;
import com.netcourse.entity.User;
import java.io.PrintWriter;
import com.captcha.botdetect.web.servlet.Captcha;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;

public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = request.getParameter("user");
        String password = request.getParameter("pass");

        Captcha captcha = Captcha.load(request, "exampleCaptchaTag");
        boolean isHuman = captcha.validate(request.getParameter("captchaCode"));

        Map<String, String> messages = new HashMap<String, String>();
        request.setAttribute("messages", messages);

        UserDao dao = new UserDao();

        if (isHuman) {
            User user = dao.login(userId, password);
            PrintWriter out = response.getWriter();
            out.println(userId);

            if (user != null) {
                request.getSession().setAttribute("user", user);
                response.sendRedirect("main.jsp");
            } else {
                messages.put("login_error", "400");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            messages.put("captcha", "400");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
        }

    }

}
