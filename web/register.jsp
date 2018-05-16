<%-- 
    Document   : register
    Created on : 2018-05-03, 13:24:23
    Author     : Mateusz
--%>

<%@page import="jdk.nashorn.internal.ir.BreakNode"%>
<%@page import="Kino.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        
                Database.createUser(user, email, pwd, 1);
                Database.zamknij();
                 String site = new String("index.html");
                 response.setStatus(response.SC_MOVED_TEMPORARILY);
                 response.setHeader("Location", site);
                    }
          }
    }
%>
    </body>
</html>
