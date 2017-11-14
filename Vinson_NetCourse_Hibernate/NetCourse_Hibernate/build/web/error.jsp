<%--
    Document   : error
    Created on : Dec 28, 2016, 7:15:20 PM
    Author     : vinson
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>

    <body>
        <!-- 获取Messages -->
        <%
            Map<String, String> messages = new HashMap<String, String>();
            messages = (HashMap) request.getAttribute("messages");

        %>
        <!-- 验证码出错 -->
        <%            if (messages.containsKey("captcha")) {
                if (messages.get("captcha").equals("400")) {
                    out.print("Captcha incorrect");
                }
            };
        %>
        <!--登录失败-->
        <%
            if (messages.containsKey("login_error")) {
                if (messages.get("login_error").equals("400")) {
                    out.print("Login Fail");
                }
            };
        %>
    </body>

</html>
