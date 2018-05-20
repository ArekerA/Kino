<%-- 
    Document   : kupbilet
    Created on : 2018-05-16, 12:13:26
    Author     : Mateusz
--%>
<%@page import="java.util.ArrayList"%>
<link rel="stylesheet" href="style.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Kino.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>

      <%

// Grab the variables from the form.
  String[] miejsca; 
  miejsca = request.getParameterValues("check");
  Database.polacz();
   if (miejsca != null) {
       
    for (int i = 0; i < miejsca.length; i++) {
        int a = Integer.parseInt(miejsca[i]);
        Database.readMiejsce(a).getDostepnosc();
        Miejsce m=  Database.readMiejsce(a);
        m.setDostepnosc(1);
        Database.updateMiejsce(m);
    }
   }
    else 
   {
       out.println ("none selected");
   }
Database.zamknij();
%>
<%-- Print out the variables. --%>
<h1>Zakupoiono</h1>
                </body>
                </html>
