<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="Kino.*" %>
        <title>Kino Planeta</title>
    </head>
    <body>
        <header>        
            <div class="logo">
                <img src="img/kino_logo.png" alt="Kino Planeta">
            </div>
        </header>
        <div class="zawartosc"> <ul class="menu" id="menu">
            </ul>
            <aside>
                <div class="boczne">
                    <p>Kino Planeta</p>
                    <p>Kraków, Warszawska 24</p>
                    <a href="mailto:someone@example.com?Subject=Hello%20again">Napisz do nas</a>
                </div>

            </aside>
            <section>
                <article><div class="zawartosc">
                    <div class="cennik">
                    <table>
                        <tr><td>Seans</td><td>Normalny</td></tr>
                        <%
                            Database.polacz();
                         ArrayList<Bilet> bilety = Database.readBilety();
                        for (Bilet b : bilety) {
                         out.println("<tr>    <td><div class=\"dwade\">"+b.getNazwa()+"</div></td>    <td><div class=\"dwade\">"+b.getCena()+"</div></td>   </tr>");
                         }
                        Database.zamknij();
                        
         %>
                    
                    </table>  
                    </div> </div>
                </article>

            </section>
            <footer>
                Made by LA,SM,BŻ. All rigths reserved :)
            </footer>
        </div>

        <jsp:include page="menu.jsp"/>
    </body>
</html>