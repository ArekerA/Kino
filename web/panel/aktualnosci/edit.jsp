<%-- 
    Document   : dodaj
    Created on : 2018-05-15, 12:10:25
    Author     : Mateusz
--%>

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
        <title>Edytuj Aktualność</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            if (request.getParameter("tytul") != null) {
            Database.polacz();
                Database.updateAktualnosc(request.getParameter("tytul"), request.getParameter("tekst"), Integer.parseInt(request.getParameter("id")));
                Database.zamknij();
            }
            String site = new String("index.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

        %>

    </body>
</html>
