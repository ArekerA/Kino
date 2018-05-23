<%-- 
    Document   : kupbilet
    Created on : 2018-05-16, 12:13:26
    Author     : Mateusz
--%>
<%@page import="com.sun.webkit.network.URLs"%>
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

        <div class="kupbilet" >
            <table class="miejsca">
                
                <%
                    if(session.getAttribute("logged-user-nick")!=null)
                    {
                        out.println("<tr><th class='ekran' style='color: white;' colspan='15'  id='ekran'>SALA KINOWA</th></tr> <br><br>");
                         out.println("<tr><th class='ekran' style='color: white;' colspan='15'  id='ekran'>EKRAN</th></tr>");
                    Database.polacz();
                    Integer id=Integer.parseInt(request.getParameter("id")); 
                    
                    ArrayList<Miejsce> miejsca1 = Database.readMiejsca();
                    ArrayList<Miejsce> miejsca = new ArrayList<Miejsce>();
                    for (int size = 0; size < miejsca1.size(); size++) {
                        if (miejsca1.get(size).getIdSeansu() == id) {
                            miejsca.add(miejsca1.get(size));
                        }
                    }
                    out.println("<form action=\"kup.jsp\" method=\"post\">");
                    for (int i = 0; i < 15; i++) {
                        
                        out.println("<tr style='margin: 3px; padding: 3px;' class=\"rzad\">");
                        for (int a = 0; a < 15; a++) {
                            
                            out.println("<th style='margin: 3px; padding: 3px;' class=\"miejsce\">");
                            
                            if (miejsca.get(14 * i + (a + i)).getDostepnosc() == 1) {
                              //out.print(i+":"+a);
                                out.println("<label class=\"container\"><input style='margin: 3px; padding: 3px;' type=\"checkbox\" checked onclick=\"return false;\">  <span class=\"checkmark\" ></span></label>");
                            } else {
                                // out.print(i+":"+a);
                                out.println("<label class=\"container\"><input style='margin: 3px; padding: 3px;' type=\"checkbox\" name=\"check\" value="+((miejsca.get(14 * i + (a + i)).getId())+1)+">  <span class=\"checkmark\"></span></label>");
                            }
                                
                            out.println("</th>");
                        }
                        out.println("</tr>");
                        Database.zamknij();
                    }
                
            out.println("</table>");
            out.println("<div class=\"kup\">");
 //               out.println("<h1>Podaj dane</h1> ");
                
//                    out.println("Imię:");
//                    out.println("<input type=\"text\" name=\"imie\"> ");
//                    out.println("<br>");
//                    out.println("Nazwisko:");
//                    out.println("<input type=\"text\" name=\"nazwisko\"> ");
//                    out.println("<br>");
//
//                    out.println("Adres email (ten z małpą):");
//                    out.println("<input type=\"email\" name=\"email\"> ");
//                    out.println("<br>");
//                    out.println("Telefon:");
//                    out.println("<input type=\"number\" name=\"phone\"> ");
//                    out.println("<br>");
                    out.println("<input type=\"submit\" value=\"Idę dalej!\">");
                out.println("</form>");
            out.println("</div>");
            out.println("<div>");
                    }
                    else
                    {
                         
                        out.println(" <h2 style='color:white;'>Musisz być zalogowany aby kupić bilet!</h2>");
                        out.println("<form action=\"zaloguj.jsp\" method=\"post\">");
                        out.println("<br><input type=\"submit\" value=\"Zaloguj się\">");
                        out.println("</form>");
                        out.println(" <h2 style='color:white;'>Nie masz konta?</h2>");
                        out.println("<form action=\"rejestruj.jsp\" method=\"post\">");
                        out.println("<input type=\"submit\" value=\"Zarejestruj się\">");
                        out.println("</form>");
                    }
            %>

                </body>
                </html>
