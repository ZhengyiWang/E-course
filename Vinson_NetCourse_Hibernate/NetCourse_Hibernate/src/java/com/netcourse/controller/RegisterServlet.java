package com.netcourse.controller;

import com.captcha.botdetect.web.servlet.Captcha;
import com.netcourse.dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.netcourse.entity.User;
import com.netcourse.util.MD5;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;

public class RegisterServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        MD5 md5 = new MD5();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String country = request.getParameter("country");

        Captcha captcha = Captcha.load(request, "exampleCaptchaTag");
        boolean isHuman = captcha.validate(request.getParameter("captchaCode"));

        Map<String, String> messages = new HashMap<String, String>();
        request.setAttribute("messages", messages);

        // 没时间了!拼写检查去你的!
        if (isHuman) {
            if (!username.equals("") & !email.equals("") & !password.equals("")
                    & !phone.equals("") & !country.equals("")) {
                // 明文到密文转换
                password = md5.getMD5(password);
                User user = new User(username, email, password, phone, country);
                UserDao dao = new UserDao();
                boolean result = dao.reg(user);
                if (result) {
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect("main.jsp");
                } else {
                    request.getSession().setAttribute("reg_status_code", 500);
                    response.sendRedirect("error.jsp");
                }
            } else {
                request.getSession().setAttribute("reg_status_code", 500);
                response.sendRedirect("error.jsp");
            }
        } else {
            messages.put("captcha", "400");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
        }
    }

}
