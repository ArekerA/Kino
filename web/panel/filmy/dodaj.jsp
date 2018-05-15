<%-- 
    Document   : dodaj
    Created on : 2018-05-15, 12:10:25
    Author     : Mateusz
--%>

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
        <title>JSP Page</title>
    </head>
    <body>
       <%
    String tytul = request.getParameter("tytul");    
    String czas = request.getParameter("czas");
    String img = request.getParameter("img");
    String opis = request.getParameter("opis");
    String link = request.getParameter("link");
   
     Database.polacz();
     Database.createFilm(tytul, czas, img, opis, link);
     Database.zamknij();
     
 response.sendRedirect("index.jsp");
    
%>

    </body>
</html>
