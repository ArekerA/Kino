<%-- 
    Document   : kupione
    Created on : 2018-05-21, 11:10:11
    Author     : Mateusz
--%>

<%@page import="Kino.User"%>
<%@page import="Kino.Zamowienie"%>
<%@page import="Kino.Bilet"%>
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
            Bilet b=new Bilet();
            Zamowienie z=new Zamowienie();
            for(int i=0; i<r; i++)
           {
                String str = "" + i;
                b.setNazwa("ulgowy");
                b.setCena(12.5);
                //z.setUser(Integer.parseInt(session.getAttribute("logged-user-id").toString()));
                //Database.createZamowienie(z);
               // Database.updateZamowienie(z);
                Database.createBilet(b);
                Database.updateBilet(b);
                
           }
            Database.zamknij();
        %>
    </body>
</html>
