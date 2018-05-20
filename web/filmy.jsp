<%-- 
    Document   : filmy
    Created on : 2018-05-04, 09:44:35
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
        <title>Kino Planeta</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>        
            <div class="logo">
                <img src="img/kino_logo.png" alt="Kino Planeta">
            </div>
        </header>
        <div class="zawartosc">           
            <ul class="menu" id="menu">
            </ul>
            <aside>

            </aside>
            <section>
                <%
                    Database.polacz();
                    ArrayList<Film> filmy = Database.readFilmy();
                    for (Film a : filmy) {
                        out.println("<article>");
                        out.println("<table class=\"film\">");
                        out.println("<tr>");
                        out.println("<th class=\"plakat\" rowspan=\"2\"><img class=\"posterr\" src=\"img/" + a.getImg() + "\" alt=\"obraz\"></th> ");
                        out.println("<th class=\"tytul\">" + a.getTytul() + "</th>");
                        out.println("<th class=\"czas\">" + a.getCzas() + "</th>");
                        out.println("<th class=\"zwiastun\" rowspan=\"2\"> <iframe width=\"210\" height=\"160\" src=\"" + a.getLink() + "\"> </iframe></th>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td class=\"opis\" colspan=\"2\">" + a.getOpis() + "</td>");
                        out.println("</tr>");
                        out.println("</article>");
                    }

                    Database.zamknij();
                %>
            </section>
            <footer>
                Made by LA,SM,ŻB. All rigths reserved :) 
            </footer>
        </div>
        <jsp:include page="menu.jsp"/>
    </body>
</html>
