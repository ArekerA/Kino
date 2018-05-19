<%-- 
    Document   : register
    Created on : 2018-05-03, 13:24:23
    Author     : Mateusz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Kino.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import ="java.sql.*" %>
        <%

            session.setAttribute("logged-user-id", null);
            session.setAttribute("logged-user-nick", null);
            session.setAttribute("logged-user-email", null);
            session.setAttribute("logged-user-level", null);
            String site = new String("index.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

        %>
    </body>
</html>
