<!DOCTYPE html>
        <%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="Kino.*" %>
        <%@page import="java.util.ArrayList"%>
<html>
    <head>
<link rel="stylesheet" href="style.css">
        <title>Kino Planeta</title>
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
                <div class="boczne">
                    <p>
                        <%
                         out.print("<div class=\"dwade2\">NA EKRANIE:</div>");
                         Database.polacz();
                         ArrayList<Film> filmy = Database.readFilmy();
                        for (Film f : filmy) {
                         out.println("<br><h5>"+f.getTytul()+"</h5>");
                         }
                        Database.zamknij();
                        %>
                       </p>
                </div>
                <div class="prawe">
                    <p>
                    <h3> Projekt studencki z przedmiotu:<h3>
                            <div class="dwade2">TECHNOLOGIE INTERNETOWE</div>
                            <br>Autorzy:
                                <br>Arkadiusz Ludwikowski
                                <br>Mateusz Stanek
                                <br>Bartłomiej Żmuda
                            
                    </p>
                </div>
            </aside>
            <section>
                <% Database.polacz();
                    
                ArrayList<Aktualnosc> aktualnosci = Database.readAktualnosci();
                
                 for (Aktualnosc a : aktualnosci)
                 {
//                     out.println("<article style='border-style: dashed; margin: 5px; padding: 5px;' >" + "<div class='tytek' style='font-size: 25pt; text-align: center;  margin: 5px; padding: 5px;'  >" + a.getTytul() + 
//                             "</div> <div class='obrazek'> <img class='obraz' src=\"img/" 
//                             + a.getImg() + "\" alt=" + a.getTytul() + "</div > <div style='text-align: justify;'>" + a.getTekst() +"</div></article>"); 
//                     
                     out.print("<div class=\"article\">");
                     out.print("<div class=\"title\">"+a.getTytul()+"</div>");
                     out.print("<div class=\"opis\">"+a.getTekst()+"</div>");
                     out.print("<div class='obraz'> <img class=\"obrazek\" src=\"img/"  + a.getImg() + "\" alt=" + a.getTytul() + "</div >");
                     out.print("</div>");
                     
                 }
                 
                    
                %>
                
                
            </section>
            <footer>
                Made by LA,SM,ŻB. All rigths reserved :) 
            </footer>
        </div>
        <jsp:include page="menu.jsp"/>
        
    </body>
</html>