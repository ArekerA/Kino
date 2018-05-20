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
        <div class="zawartosc"> <div id="menu">
            </div>
            <%
                Database.polacz();
                out.print(Database.readStrona("kontakt").getTekst());
                Database.zamknij();
            %>
        </div>
            <footer>
                Made by LA,SM,BŻ. All rigths reserved :)
            </footer>


            <jsp:include page="menu.jsp"/>
    </body>
</html>