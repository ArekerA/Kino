<%-- 
    Document   : test
    Created on : 2018-04-18, 10:49:33
    Author     : Arekl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<%@page import="Kino.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
           out.println("<h2>Ścieżka do bazy: " + System.getProperty("user.dir") + "</h2>");
            Database.polacz();
            Zamowienie a = Database.readZamowienie(0);
            a.getIlosc().set(0, new Integer(5));
            Database.updateZamowienie(a);
            //trorzy schemat bazy - wywołać tylko raz!
            //Database.init();
            
            //tworzy przykładowe dane - wywołać tylko raz!
            //Database.init2();
            
            Database.zamknij();
        %>
    </body>
</html>
