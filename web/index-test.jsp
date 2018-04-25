<%-- 
    Document   : index-test
    Created on : 2018-04-25, 19:22:45
    Author     : Arekl
--%>

<%@page import="java.util.ArrayList"%>
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
                <div class="boczne">
                    <p>
                    Litwo! Ojczyzno moja! Ty jesteś jak zdrowie.
                    Ile cię trzeba cenić, ten Bonapart czarował, no, tak nazywano
                    młodzieńca, który teraz jeśli nasza młodzie wyjeżdża za kolana). On
                    rzekł: Muszę ja Ruski, teraz się stało wody pełne naczynie blaszane
                    ale widzę mniej silnie, ale mur chędogi. Sterczały wkoło pali.</p>
                </div>
                <div class="prawe">
                        <p>Litwo! Ojczyzno moja! Ty jesteś jak zdrowie.
                                Ile cię trzeba cenić, ten Bonapart czarował, no, tak nazywano
                                młodzieńca, który teraz jeśli nasza młodzie wyjeżdża za kolana). On
                                rzekł: Muszę ja Ruski, teraz się stało wody pełne naczynie blaszane
                                ale widzę mniej silnie, ale mur chędogi. Sterczały wkoło paliLitwo! O
                                jczyzno moja! Ty jesteś jak zdrowie.
                                Ile cię trzeba cenić, ten Bonapart czarował, no, tak nazywano
                                młodzieńca, który teraz jeśli nasza młodzie wyjeżdża za kolana). On
                                rzekł: Muszę ja Ruski, teraz się stało wody pełne naczynie blaszane

                                ale widzę mniej silnie, ale mur chędogi. Sterczały wkoło paliLitwo! O
                                jczyzno moja! Ty jesteś jak zdrowie.
                                Ile cię trzeba cenić, ten Bonapart czarował, no, tak nazywano
                                młodzieńca, który teraz jeśli nasza młodzie wyjeżdża za kolana). On
                                rzekł: Muszę ja Ruski, teraz się stało wody pełne naczynie blaszane
                                ale widzę mniej silnie, ale mur chędogi. Sterczały wkoło paliLitwo! 
                                Ojczyzno moja! Ty jesteś jak zdrowie.
                                Ile cię trzeba cenić, ten Bonapart czarował, no, tak nazywano
                                młodzieńca, który teraz jeśli nasza młodzie wyjeżdża za kolana). On
                                rzekł: Muszę ja Ruski, teraz się stało wody pełne naczynie blaszane
                                ale widzę mniej silnie, ale mur chędogi. Sterczały wkoło paliLitwo! O
                                jczyzno moja! Ty jesteś jak zdrowie.
                                Ile cię trzeba cenić, ten Bonapart czarował, no, tak nazywano
                                młodzieńca, który teraz jeśli nasza młodzie wyjeżdża za kolana). On
                                rzekł: Muszę ja Ruski, teraz się stało wody pełne naczynie blaszane
                                ale widzę mniej silnie, ale mur chędogi. Sterczały wkoło paliLitwo!
                                 Ojczyzno moja! Ty jesteś jak zdrowie.
                                Ile cię trzeba cenić, ten Bonapart czarował, no, tak nazywano
                                młodzieńca, który teraz jeśli nasza młodzie wyjeżdża za kolana). On
                                rzekł: Muszę ja Ruski, teraz się stało wody pełne naczynie blaszane
                                ale widzę mniej silnie, ale mur chędogi. Sterczały wkoło pali.</p>
                </div>
        </aside>
            <section>
            <%
                Database.polacz();
                ArrayList<Aktualnosc> aktualnosci = Database.readAktualnosci();
                for (Aktualnosc a : aktualnosci) {
                        out.println("<article>");
                        out.println("<div class=\"obrazek\">");
                        out.println("<img class=\"obraz\" src=\"img/"+a.getImg()+"\" alt=\"obraz\">");
                        out.println("</div>");
                        out.print("<h1>");
                        out.print(a.getTytul());
                        out.println("</h1>");
                        out.print(a.getTekst());
                        out.println("</article>");
                    }

                Database.zamknij();
            %>
        </section>
        <footer>
            Made by LA,SM,ŻB. All rigths reserved :) 
        </footer>
    </div>
    <script src="menu.js"></script>
    </body>
</html>
