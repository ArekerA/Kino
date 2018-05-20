<%-- 
    Document   : zaloguj
    Created on : 2018-05-02, 10:18:44
    Author     : Mateusz
--%>

<link rel="stylesheet" href="style.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Kino.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>        
            <div class="logo">
                <img src="img/kino_logo.png" alt="Kino Planeta">
            </div>
        </header>
        <div class="zawartosc"> <ul class="menu" id="menu">
            </ul>

            <section>

                <div class="login">
                    <%
                        if (session.getAttribute("logged-user-id") != null) {
                            String site = new String("zalogu");
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
                                    out.print("<p class=\"error\">BŁĘDNE DANE LOGOWANIA</p>");
                                } else {
                                    session.setAttribute("logged-user-id", u.getId());
                                    session.setAttribute("logged-user-nick", u.getNick());
                                    session.setAttribute("logged-user-email", u.getEmail());
                                    session.setAttribute("logged-user-level", u.getLevel());

                                    String site = new String("index.jsp");
                                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                                    response.setHeader("Location", site);
                                }
                                Database.zamknij();
                            }
                        }
                    %>
                    <h1>Podaj dane do logowania</h1> 
                    <form action="zaloguj.jsp" method="post">
                        Login:
                        <br>
                        <input type="text" name="login"> 
                        <br><br>
                        Hasło:
                        <br>
                        <input type="password" name="pass"> 
                        <br><br>
                        <input type="submit" value="Potwierdź">
                    </form>


                    <br>
                    <h2>Nie masz konta?</h2>


                    <form action="rejestruj.jsp" method="post">
                        <input type="submit" value="Zarejestruj się">
                    </form>
                </div>
            </section>
            <footer>
                Made by LA,SM,ŻM. All rigths reserved :)
            </footer>
        </div>

        <jsp:include page="menu.jsp"/>
    </body>
</html>
