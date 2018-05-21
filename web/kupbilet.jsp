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

        <div class="kupbilet">
            <table class="miejsca">
                <tr>
                    <th class="ekran" colspan="15">EKRAN</th>
                </tr>
                <%

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

                        out.println("<tr class=\"rzad\">");
                        for (int a = 0; a < 15; a++) {
                            out.println("<th class=\"miejsce\">");

                            if (miejsca.get(14 * i + (a + i)).getDostepnosc() == 1) {
                                out.println("<label class=\"container\"><input type=\"checkbox\" checked onclick=\"return false;\">  <span class=\"checkmark\" ></span></label>");
                            } else {
                                out.println("<label class=\"container\"><input type=\"checkbox\" name=\"check\" value="+((miejsca.get(14 * i + (a + i)).getId())+1)+">  <span class=\"checkmark\"></span></label>");
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
            %>

                </body>
                </html>
