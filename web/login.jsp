<%-- 
    Document   : login
    Created on : 2018-05-03, 13:15:32
    Author     : Mateusz
--%>

<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
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
    String userid = request.getParameter("login");    
    String pwd = request.getParameter("haslo");
     String pwd1 = request.getParameter("confirmed");
     Class.forName("org.sqlite.JDBC");
    Connection  con = DriverManager.getConnection("jdbc:sqlite:mydb.sqlite");
    Statement st = con.createStatement();
    ResultSet rs;
   
    rs = st.executeQuery("select * from Userzy where nick='" + userid + "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("cennik.html");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
    
%>
    </body>
</html>
