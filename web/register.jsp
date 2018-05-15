<%-- 
    Document   : register
    Created on : 2018-05-03, 13:24:23
    Author     : Mateusz
--%>

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
    String email = request.getParameter("email");
     Class.forName("org.sqlite.JDBC");
    Connection  con = DriverManager.getConnection("jdbc:sqlite:mydb.sqlite");
    Statement st = con.createStatement();
    ResultSet rs ;
    rs = st.executeQuery("SELECT MAX(id) FROM Userzy;");
    rs.next();
    //ResultSet rs;
    int i =  st.executeUpdate("INSERT INTO Userzy (id,nick,email,pass,level) VALUES ('SELECT MAX(id)FROM Userzy','"+user+"','"+email+"','"+pwd+"','1');");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("cennik.html");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("infro.html");
    }
%>
    </body>
</html>
