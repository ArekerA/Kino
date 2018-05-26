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
        
       
        
        <%
            Integer r=Integer.parseInt(request.getParameter("size"));
            Database.polacz();
            out.print("  <div class=\"title\">Zakupiono bilety w ilości: "+r+"</div>");
          //  Zamowienie z=new Zamowienie();
           // z.setUser(Integer.parseInt(session.getAttribute("logged-user-id").toString()));
           // Database.createZamowienie(z);
            for(int i=0; i<r; i++)
           {
                
               
                //out.print("<div>"+request.getParameter(Integer.toString(i))+"</div>");
               
                //Database.createZamowienie(z);
               // Database.updateZamowienie(z);
               
                               
           }
            Database.zamknij();
        %>
    </body>
</html>