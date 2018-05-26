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
  out.println("<div class=\"opis\">");
   if (miejsca != null) {
    out.println("<form action=\"kupione.jsp?size="+miejsca.length+"\" method=\"post\">");   
    ArrayList<Bilet> bilety = Database.readBilety();
    for (int i = 0; i < miejsca.length; i++) {
        String str = "" + i;
        out.println("Rodzaj biletu o numerze "+(i+1)+" dla miejsca :"+miejsca[i]+"");
        out.println("<select class=\"wybor\" name="+str+">");
         
         for (Bilet b : bilety) {
        out.println("<option value="+b.getId()+">"+b.getNazwa()+"</option>");
         }
        out.println("</select>");
        out.println("<br>");
//        Database.readMiejsce(a).getDostepnosc();
//        Miejsce m=  Database.readMiejsce(a);
//        m.setDostepnosc(1);
//        Database.updateMiejsce(m);
    }
    out.println("");
    out.println("Kupujesz dla:");
    out.println(session.getAttribute("logged-user-nick").toString());
    out.println("<br>");
    out.println("<input type=\"submit\" value=\"Idę dalej!\">");
    out.println("</form>");
    //Integer idus=Integer.parseInt(session.getAttribute("logged-user-id").toString());
   }
    else 
   {
       out.println ("Nie wybrano biletu.. proszę się ewakuować");
       out.println("");
       
   }
   out.println("</div>");
Database.zamknij();
%>
<%-- Print out the variables. --%>
                </body>
                </html>
