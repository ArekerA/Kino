<%-- 
    Document   : menu
    Created on : 2018-05-12, 19:08:45
    Author     : Arekl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="menu">
            <p class="menu-header">Panel</p>
            <% if(session.getAttribute("logged-user-level") != null){
                 if (Integer.valueOf(session.getAttribute("logged-user-level").toString()) >= 2) { %>
                    <a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/panel/aktualnosci/" class="button">Aktualności</a>
                <% } if (Integer.valueOf(session.getAttribute("logged-user-level").toString()) >= 2) { %>
                    <a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/panel/zamowienia/" class="button">Zamówienia</a><p></p>
                <% } if (Integer.valueOf(session.getAttribute("logged-user-level").toString()) >= 3) { %>
                    <a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/panel/filmy/" class="button">Filmy</a>
                <% } if (Integer.valueOf(session.getAttribute("logged-user-level").toString()) >= 3) { %>
                    <a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/panel/wersje/" class="button">Wersje</a>
                <% } if (Integer.valueOf(session.getAttribute("logged-user-level").toString()) >= 3) { %>
                    <a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/panel/seanse/" class="button">Seanse</a><p></p>
                <% }if (Integer.valueOf(session.getAttribute("logged-user-level").toString()) >= 3) { %>
                    <a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/panel/sale/" class="button">Sale</a>
                <% } if (Integer.valueOf(session.getAttribute("logged-user-level").toString()) >= 3) { %>
                    <a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/panel/strony/" class="button">Strony</a>
                <% }if (Integer.valueOf(session.getAttribute("logged-user-level").toString()) >= 3) { %>
                    <a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/panel/userzy/" class="button">Userzy</a>
                <% }
            }%>
            <form action="#" method="post">
                <input type="hidden" name="logut" value="1">
                <p><input class="button" type="submit" value="Wyloguj"></p>
            </form>
        </div>
    </body>
</html>
