<%-- 
    Document   : logout
    Created on : Dec 28, 2016, 8:15:53 PM
    Author     : vinson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            session.removeAttribute("userId");
            session.removeAttribute("password");
            session.invalidate();
        %>
    </body>
</html>
