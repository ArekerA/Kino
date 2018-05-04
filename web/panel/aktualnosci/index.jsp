<%-- 
    Document   : test
    Created on : 2018-05-03, 19:19:01
    Author     : Arekl
--%>

<%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Kino.Database"%>
<%@page import="Kino.Aktualnosc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
        <link rel="stylesheet" href="../style.css">
    </head>
    <body>
        <h1>Test</h1>
        <form action="index.jsp" method="post">
            <h1>Aktualności</h1><br>
            <input class="input-center" type="hidden" name="logut" value="1">
            <p><input class="input-center" type="submit" value="Wyloguj"></p>
        </form>
        <%
            if (session.getAttribute("logged-user-id") == null) {
                String site = new String("../index.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            } else {
                if (request.getParameter("logut") != null) {
                    session.setAttribute("logged-user-id", null);
                    session.setAttribute("logged-user-nick", null);
                    session.setAttribute("logged-user-email", null);
                    session.setAttribute("logged-user-level", null);
                    String site = new String("../index.jsp");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                }
                else if (Integer.valueOf(session.getAttribute("logged-user-level").toString()) < 2) {
                    String site = new String("../index.jsp");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                } else {

                    Database.polacz();
                    %>
                    <p><a href="#">Wyświetl aktualności</a><p>
                    <p><a href="dodaj.jsp">Dodaj aktualność</a><p>
                    <div>
                        <%
                            ArrayList<Aktualnosc> aktualnosci = Database.readAktualnosci();
                            for (Aktualnosc a : aktualnosci) {
                                
                        %>
                        <h2><% out.print(a.getTytul()); %></h2><% out.print(a.getTekst()); %><br/><br/>
                        <%
                            }
                        %>
                    </div>
                    <%
                }
            }
        %>
    </body>
</html>
