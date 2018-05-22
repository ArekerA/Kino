<%-- 
    Document   : kupione
    Created on : 2018-05-21, 11:10:11
    Author     : Mateusz
--%>

<%@page import="Kino.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        
        <h1>Zakupiono!</h1>
        
        <%
            Integer r=Integer.parseInt(request.getParameter("size"));
            Database.polacz();
            for(int i=0; i<r; i++)
            {
                String str = "" + i;
            
                //Database.createBilet(request.getParameter(str).toString(), 12.5);
                out.print(request.getParameter(""+i));
            }
            Database.zamknij();
        %>
    </body>
</html>
