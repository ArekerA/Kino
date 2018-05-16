<%-- 
    Document   : login
    Created on : 2018-05-03, 13:15:32
    Author     : Mateusz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Kino.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%@ page import ="java.sql.*" %>
       <script type="text/javascript" src="check.js">ukryj();</script>
<%
    String userid = request.getParameter("login");    
    String pwd = request.getParameter("haslo");
  
    if (session.getAttribute("logged-user-id") != null) {
                    String site = new String("index.html");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                }
                if (request.getParameter("login") != null && request.getParameter("haslo") != null) {
                    if (!request.getParameter("login").isEmpty() && !request.getParameter("haslo").isEmpty()) {
                        Database.polacz();
                        User u = Database.login(
                                request.getParameter("login"),
                                request.getParameter("haslo"));
                        if (u == null) {
                             Database.zamknij();
                                String site = new String("zaloguj_1.jsp");
                                response.setStatus(response.SC_MOVED_TEMPORARILY);
                                response.setHeader("Location", site);
                        } else {
                            session.setAttribute("logged-user-id", u.getId());
                            session.setAttribute("logged-user-nick", u.getNick());
                            session.setAttribute("logged-user-email", u.getEmail());
                            session.setAttribute("logged-user-level", u.getLevel());

                            String site = new String("index.html");
                            response.setStatus(response.SC_MOVED_TEMPORARILY);
                            response.setHeader("Location", site);
                        }
                        Database.zamknij();
                    }
                }
    
    
    
    /*
Database.polacz();

if(Database.checkNick(userid) && Database.checkEmail(pwd))
{
    Database.zamknij();
    String site = new String("zaloguj_1.jsp");
      response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
}
else
{
    Database.login(userid, pwd);
    Database.zamknij();
    String site = new String("repertuar.jsp");
      response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
            
}*/




    
%>
    </body>
</html>
