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
            <a href="aktualnosci/" class="button">Aktualności</a>
            <form action="#" method="post">
                <input type="hidden" name="logut" value="1">
                <p><input class="button" type="submit" value="Wyloguj"></p>
            </form>
        </div>
        <%
            if (session.getAttribute("logged-user-id") == null) {
                String site = new String("index.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            } else if (request.getParameter("logut") != null) {
                session.setAttribute("logged-user-id", null);
                session.setAttribute("logged-user-nick", null);
                session.setAttribute("logged-user-email", null);
                session.setAttribute("logged-user-level", null);
                String site = new String("index.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
        %>
    </body>
</html>
