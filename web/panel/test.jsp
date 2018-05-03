<%-- 
    Document   : test
    Created on : 2018-05-03, 19:19:01
    Author     : Arekl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>Test</h1>
        <form action="test.jsp" method="post">
            <h1>Logowanie do panelu</h1><br>
            <input class="input-center" type="hidden" name="logut" value="1">
            <p><input class="input-center" type="submit" value="Wyloguj"></p>
        </form>
        <%
            if (session.getAttribute("logged-user-id") == null) {
                String site = new String("index.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
            else
            {
                if (request.getParameter("logut") != null) {
                    session.setAttribute("logged-user-id", null);
                    session.setAttribute("logged-user-nick", null);
                    session.setAttribute("logged-user-email", null);
                    session.setAttribute("logged-user-level", null);
                    String site = new String("index.jsp");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                }
                out.print("<h2>Nick: "+ session.getAttribute("logged-user-nick")+"</h2>");
                out.print("<h2>Email: "+ session.getAttribute("logged-user-email")+"</h2>");
                out.print("<h2>Level: "+ session.getAttribute("logged-user-level")+"</h2>");
            }
        %>
    </body>
</html>
