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
<%@page import="Kino.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
    String id = request.getParameter("id");    
    String wersja = request.getParameter("wersja");
    String data = request.getParameter("data");
    int sala = Integer.parseInt((request.getParameter("sala")));
  
    Database.polacz();
    ArrayList<Wersja> wersje = Database.readWersje();
    ArrayList<Film> filmy = Database.readFilmy();
    ArrayList<Sala> sale = Database.readSale();
                            int i = 0;
                            int id2=333;
                            int wersja2=333;
                            
                        for(Film f : Database.readFilmy())
                                             {         
                                                   if (i == 0 && f.getTytul().equals(id))
                                                   { 
                                                       i = 1;
                                                       id2 = f.getId();
                                                   }
                                             }
    
                         i =0;
                          for(Wersja w : Database.readWersje())
                          {         
                                if (i == 0 && w.getTekst().equals(wersja))
                                { 
                                    i = 1;
                                    wersja2 = w.getId();
                                }
                          }
                          
    Database.createSeans(id2, wersja2, data, sala);
    Database.zamknij();
    response.sendRedirect("index.jsp");
    
%>

    </body>
</html>
