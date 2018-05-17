<%-- 
    Document   : register
    Created on : 2018-05-03, 13:24:23
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
<%
    String user = request.getParameter("login");    
    String pwd = request.getParameter("haslo");
    String pwd1 = request.getParameter("confirmed");
    String email = request.getParameter("email");
     
    Database.polacz();
    
if(!pwd.equals(pwd1))
    {
         Database.zamknij();
     String site = new String("rejestruj_3.jsp");
      response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

    }    
else
    {
        if(Database.checkNick(user) == false)

        {
             Database.zamknij();
         String site = new String("rejestruj_1.jsp");
          response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

        }
        else
          {

                if(Database.checkEmail(email) == false)
                {

                     Database.zamknij();
                     String site = new String("rejestruj_2.jsp");
                      response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

                 }
                else
                    {
                        
                Database.createUser(user, email, SHA256.szyfruj(request.getParameter("haslo")), 1);
                        
                 
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
%>
    </body>
</html>
