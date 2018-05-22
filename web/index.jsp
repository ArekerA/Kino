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
                <% Database.polacz();
                    
                ArrayList<Aktualnosc> aktualnosci = Database.readAktualnosci();
                
                 for (Aktualnosc a : aktualnosci)
                 {
                     out.println("<article style='border-style: dashed'>" + "<div class='tytek'>" + a.getTytul() + 
                             "</div> <div class='obrazek'> <img class='obraz' src=\"img/" 
                             + a.getImg() + "\" alt=" + a.getTytul() + "</div > <div style='text-align: justify;'>" + a.getTekst() +"</div></article>"); 
                     
                     
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