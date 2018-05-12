<%-- 
    Document   : index
    Created on : 2018-05-03, 17:56:37
    Author     : Arekl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Kino.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logowanie</title>
        <link rel="stylesheet" href="../styles/style-panel.css">
    </head>
    <body>
        <div class="login-pop-up">
            <form action="index.jsp" method="post">
                <h1>Logowanie do panelu</h1><br>
                <p><input class="input-center" type="text" placeholder="login" name="login"></p>
                <p><input class="input-center" type="password" placeholder="hasło" name="pass"></p>
                <p><input class="input-center" type="submit" value="Zaloguj"></p>
            </form>
            <%
                if (session.getAttribute("logged-user-id") != null) {
                    String site = new String("test.jsp");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                }
                if (request.getParameter("login") != null && request.getParameter("pass") != null) {
                    if (!request.getParameter("login").isEmpty() && !request.getParameter("pass").isEmpty()) {
                        Database.polacz();
                        User u = Database.login(
                                request.getParameter("login"),
                                SHA256.szyfruj(request.getParameter("pass")));
                        if (u == null) {
                            out.print("<p class=\"error\">Błąd logoawnia</p>");
                        } else {
                            session.setAttribute("logged-user-id", u.getId());
                            session.setAttribute("logged-user-nick", u.getNick());
                            session.setAttribute("logged-user-email", u.getEmail());
                            session.setAttribute("logged-user-level", u.getLevel());

                            String site = new String("test.jsp");
                            response.setStatus(response.SC_MOVED_TEMPORARILY);
                            response.setHeader("Location", site);
                        }
                        Database.zamknij();
                    }
                }
            %>
        </div>
    </body>
</html>
