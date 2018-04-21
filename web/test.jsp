<%-- 
    Document   : test
    Created on : 2018-04-18, 10:49:33
    Author     : Arekl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<%@page import="Kino.Database" %>
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
            Database.polacz();
            
            //trorzy schemat bazy - wywołać tylko raz!
            //Database.init();
            
            //tworzy przykładowe dane - wywołać tylko raz!
            //Database.init2();
            
        %>
    </body>
</html>
