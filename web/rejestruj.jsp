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
                    <div id='err'> </div>
                    <br>
                    <h1>Podaj wymagane dane</h1> 
                    <form action="rejestruj.jsp" method="post">
                        Imię (albo ksywka):
                        <br>
                        <input type="text" name="login"> 
                        <br><br>
                        Hasło (tylko wymyśl coś oryginalnego):
                        <br>
                        <input type="password" name="haslo"> 
                        <br><br>
                        Potwierdź Hasło (wpisz po prostu drugi raz):
                        <br>
                        <input type="password" name="confirmed"> 
                        <br><br>
                        Adres email (ten z małpą):
                        <br>
                        <input type="email" name="email"> 
                        <br><br>
                        <input type="submit"  value="Potwierdź">
                    </form>
                </div>
            </section>
            <footer>
                Made by LA,SM,ŻM. All rigths reserved :)
            </footer>
        </div>
        <%

            if (request.getParameter("login") != null && request.getParameter("haslo") != null && request.getParameter("confirmed") != null && request.getParameter("email") != null) {

                Database.polacz();

                if (!request.getParameter("haslo").equals(request.getParameter("confirmed"))) {
                    Database.zamknij();
                    out.print("<script> document.getElementById('err').innerHTML = 'PODANE HASŁA NIE SĄ TAKIE SAME'; </script>");
                    // PODANE HASŁA NIE SĄ TAKIE SAME

                } else {
                    if (Database.checkNick(request.getParameter("login")) == false) {
                        Database.zamknij();
                        out.print("<script> document.getElementById('err').innerHTML = 'PODANY LOGIN JEST JUŻ ZAJĘTY W BAZIĘ PROSZĘ WYBRAĆ INNY'; </script>");
                        // PODANY LOGIN JEST JUŻ ZAJĘTY W BAZIĘ PROSZĘ WYBRAĆ INNY

                    } else {

                        if (Database.checkEmail(request.getParameter("email")) == false) {

                            Database.zamknij();
                            out.print("<script> document.getElementById('err').innerHTML = 'PODANY EMAIL JEST JUŻ ZAJĘTY W BAZIĘ PROSZĘ WYBRAĆ INNY'; </script>");
                            // PODANY EMAIL JEST JUŻ ZAJĘTY W BAZIĘ PROSZĘ WYBRAĆ INNY

                        } else {

                            Database.createUser(request.getParameter("login"), request.getParameter("email"), SHA256.szyfruj(request.getParameter("haslo")), 1);

                            if (request.getParameter("login") != null && request.getParameter("haslo") != null) {
                                if (!request.getParameter("login").isEmpty() && !request.getParameter("haslo").isEmpty()) {
                                    Database.polacz();
                                    User u = Database.login(
                                            request.getParameter("login"),
                                            SHA256.szyfruj(request.getParameter("haslo")));
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
                        }
                    }
                }
            }
        %>

        <jsp:include page="menu.jsp"/>
    </body>
</html>
