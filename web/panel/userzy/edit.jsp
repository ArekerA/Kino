<%-- 
    Document   : dodaj
    Created on : 2018-05-20, 13:07:55
    Author     : Arekl
--%>

<%@page import="Kino.SHA256"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Kino.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edytowanie Usera</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            if (request.getParameter("nick") != null) {
                Database.polacz();
                if(request.getParameter("pass") != null && !request.getParameter("pass").equals(""))
                    Database.updateUser(Integer.parseInt(request.getParameter("id")), request.getParameter("nick"), request.getParameter("email"), SHA256.szyfruj(request.getParameter("pass")), Integer.parseInt(request.getParameter("lvl")));
                else
                    Database.updateUser(Integer.parseInt(request.getParameter("id")), request.getParameter("nick"), request.getParameter("email"), Integer.parseInt(request.getParameter("lvl")));
                Database.zamknij();
            }
            String site = new String("index.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

        %>

    </body>
</html>
